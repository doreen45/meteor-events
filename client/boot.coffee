################################################################################
# Client-side Config
#


# Blog =
#   settings:
#     blogIndexTemplate: 'blogIndex'
#     blogShowTemplate: 'blogShow'
#     blogAdminTemplate: 'blogAdmin'
#     blogAdminNewTemplate:'blogAdminNew'
#     blogAdminEditTemplate: 'blogAdminEdit'
#     pageSize: 20

#   config: (appConfig) ->
#     @settings = _.extend(@settings, appConfig)

# @Blog = Blog


################################################################################
# Bootstrap Code
#


Meteor.startup ->

  # Twitter
  window.twttr = do (d = document, s = 'script', id = 'twitter-wjs') ->
    t = undefined
    js = undefined
    fjs = d.getElementsByTagName(s)[0]
    return  if d.getElementById(id)
    js = d.createElement(s)
    js.id = id
    js.src = "https://platform.twitter.com/widgets.js"
    fjs.parentNode.insertBefore js, fjs
    window.twttr or (t =
      _e: []
      ready: (f) ->
        t._e.push f
    )

  # Facebook
  js = undefined
  id = "facebook-jssdk"
  ref = document.getElementsByTagName("script")[0]
  return  if document.getElementById(id)
  js = document.createElement("script")
  js.id = id
  js.async = true
  js.src = "//connect.facebook.net/en_US/all.js"
  ref.parentNode.insertBefore js, ref


################################################################################
# Register Global Helpers
#

Handlebars.registerHelper "eventDate", (date) ->
  moment(new Date(date)).format 'DD/MM/YYYY'

# Handlebars.registerHelper "blogPager", ->
#   if Post.count() is Session.get 'postLimit'
#     return new Handlebars.SafeString '<a class="load-more btn" href="#">Load More</a>'

# Handlebars.registerHelper "blogIndex", ->
#   new Handlebars.SafeString Template.blogIndexLoop(this)

# Handlebars.registerHelper "blogShow", ->
#   new Handlebars.SafeString Template.blogShowBody(this)
