class FindChapterJob < ApplicationJob
  queue_as :default

  def perform(user)
    step1 = UserBook.find_by(user_id: user.id, priority:1)
    step2 = Chapter.where(book_id: step1.book_id)
    step3 = step2.map do |chapter|
      if UserChapter.find_by(chapter_id: chapter.id,user_id: user.id).read == false
        chapter
      end
    end
    step4 = step3.select {|chapter| chapter!= nil}
    step5 = step4.sort_by {|chapter| chapter.chapter_order}
    step5[0]
  end
end
