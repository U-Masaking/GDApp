class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {maximum: 50}
  validates :body, presence: true, length: {maximum: 200}
  validates :start_on, presence: true
  validates :end_on, presence: true
  validate :start_on_check
  validate :end_on_check

  def start_on_check
    if self.start_on?
      errors.add(:start_on, "を現在時刻より後にしてください") if self.start_on < Time.now
    end
  end

  def end_on_check
    if self.end_on?
      errors.add(:end_on, "は開始時間より後にしてください") if self.start_on > self.end_on
    end
  end
end
