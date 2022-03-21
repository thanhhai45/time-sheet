class Timesheet < ApplicationRecord
  # Scope
  scope :order_by_date, -> { order(date_of_entry: :asc) } 

  # Validate 
  validates :date_of_entry, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  validate :entry_cannot_be_in_the_future
  validate :finish_time_not_earlier_than_start_time
  validate :check_overlapping

  def entry_cannot_be_in_the_future
    return if date_of_entry.blank?

    start_time_format = "#{date_of_entry} #{start_time}".to_time
    finish_time_format = "#{date_of_entry} #{finish_time}".to_time

    errors.add(:date_of_entry, "can't be in the future") if finish_time_format > Time.current ||
                                                            start_time_format > Time.current
  end

  def finish_time_not_earlier_than_start_time
    errors.add(:finish_time, "can't earlier than start_time") if finish_time.to_i < start_time.to_i
  end

  def check_overlapping
    return if date_of_entry.blank?

    errors.add(:entry, 'was overlapped') if timesheet_entry_overlapping?
  end

  def timesheet_entry_overlapping?
    date_entry_format = date_of_entry.strftime('%Y-%m-%d')
    entry = Timesheet.where("date_of_entry = ?", date_entry_format)
                     .select { |entry| check_blocking_time(entry) }
    entry.count.positive?
  end

  def check_blocking_time(entry)
    return if start_time.blank? || finish_time.blank?

    (entry.start_time..entry.finish_time).overlaps?(start_time..finish_time)
  end
end
