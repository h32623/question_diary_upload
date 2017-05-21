class HomeController < ApplicationController
  def index
    @questions = Question.all
  end

  def update
  end

  def list
    @questions = Question.all
  end
  
  def memo_create
    memo = Memo.new
    memo.content = params[:content]
    memo.question_id = params[:q_id]
    
    file = params[:pic]

    uploader = AvatarUploader.new
    uploader.store!(file)
    memo.image_url = uploader.url

    memo.save
    
    redirect_to :back
    
  end
  
  def memo_update
    @questions = Question.all
    @t = Time.now
    @one_question = Question.find(params[:q_id])
    @one_memo = Question.find(params[:q_id]).memos.find(params[:m_id])

  end
  
  def memo_update_post
    one_memo = Question.find(params[:q_id]).memos.find(params[:m_id])
    one_memo.content = params[:content]
    one_memo.save
    
    redirect_to '/'
    # redirect_to "/post_title/#{params[:p_id]}"
  end
  
  def memo_destroy
    memo = Question.find(params[:q_id]).memos.find(params[:m_id])
    memo.destroy
    
    redirect_to :back
    # redirect_to "/post_title/#{params[:p_id]}"
  end 
  
  
  def like
      
      one_like = Memo.find(params[:m_id]).likes
      
      if one_like.empty? 
        like = Like.new
        like = Memo.find(params[:m_id]).likes.create(like_count: 1)
        like.save      
      
      else
        one_like = Memo.find(params[:m_id]).likes.find(params[:l_id])
        
        if one_like.like_count == 30
          one_like.save
        
        else
          one_like.like_count += 1
          one_like.save
        end
        
      end

      redirect_to :back
  end 
  
  def view
    @one_question = Question.find(params[:q_id])
  end
  

end
