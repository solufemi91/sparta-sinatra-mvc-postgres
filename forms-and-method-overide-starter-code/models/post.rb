class Post

  attr_accessor :id, :title, :body

  def save
    conn = Post.open_connection

    if(!self.id)
      sql = "INSERT INTO post (title, body) VALUES ('#{self.title}', '#{self.body}')"

    else
      sql = "UPDATE post SET title='#{self.title}', body='#{self.body}' WHERE id = #{self.id}"


    end



    conn.exec(sql)

  end

  def self.open_connection
    conn = PG.connect(dbname: "blog")
  end

  def self.hydrate(post_data)

    post = Post.new

    post.id = post_data['id']
    post.title = post_data['title']
    post.body = post_data['body']

    post

  end

  def self.all
    conn = self.open_connection

    sql = "SELECT id, title, body FROM post ORDER BY id"

    results = conn.exec(sql)

    posts = results.map do |post|
      self.hydrate(post)
    end

  end

  def self.find(id)
    conn = self.open_connection
    sql = "SELECT * FROM post WHERE id =#{id} LIMIT 1"

    posts = conn.exec(sql)

    post = self.hydrate(posts[0])

    post


  end

  def self.destroy(id)
    conn = self.open_connection

    sql = "DELETE FROM post WHERE id = #{id}"

    conn.exec(sql)
  end





end
