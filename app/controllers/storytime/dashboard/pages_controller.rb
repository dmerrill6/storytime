require_dependency "storytime/dashboard/posts_controller"

module Storytime
  module Dashboard
    class PagesController < PostsController


    private
      def current_post_type
        @current_post_type ||= Storytime::Page
      end

      def load_posts
        @posts = policy_scope(Storytime::Post).page(params[:page_number]).per(10)
        @posts = @posts.where(type: "Storytime::Page")

        @posts = if params[:published].present? && params[:published] == 'true'
          @posts.published.order(published_at: :desc)
        elsif params[:draft].present? && params[:draft] == "true"
          @posts.draft.order(updated_at: :desc)
        else
          @posts.order(published_at: :desc)
        end
      end
    end
  end
end
