module SessionsHelper
	  def score(pageToken, metric, daysStart, daysEnd)
		token = pageToken
		q1Start = DateTime.now
		q1Start = q1Start.strftime('%F')
		q1End = DateTime.now - daysStart
		q1End = q1End.strftime('%F')
		q1Data = Insight.page_insights(token, metric, q1End, q1Start)
		q1_data_hash = Insight.get_values(q1Data)
		q1_data_array = Insight.create_value_array(q1_data_hash)
		q1_data_mean = Insight.mean(q1_data_array)
		q2Start = DateTime.now - daysEnd
		q2Start = q2Start.strftime('%F')
		q2End = DateTime.now - daysStart
		q2End = q2End.strftime('%F')
		q2Data = Insight.page_insights(token, metric, q2Start, q2End)
		q2Hash = Insight.get_values(q2Data)
		q2Array = Insight.create_value_array(q2Hash)
		q2_data_mean = Insight.mean(q2Array)
		qoqComparison = q1_data_mean/q2_data_mean
		@data_score = Insight.content_score(qoqComparison)
	end
	def metrics_history(pageToken, metric, daysStart)
		token = pageToken
		q1Start = DateTime.now
		q1Start = q1Start.strftime('%F')
		q1End = DateTime.now - daysStart
		q1End = q1End.strftime('%F')
		q1Data = Insight.page_insights(token, metric, q1End, q1Start)
		q1_data_hash = Insight.get_values(q1Data)
		# q1_data_array = Insight.create_value_array(q1_data_hash)
	end

	def combine_hash(hash1, hash2)
	    results = Hash.new
	    hash1.each {|k,v| results[k] = [v]}
	    hash2.each {|k,v| results[k].push(v)}
	    results
    end

	def date_array(pageToken, metric, daysStart)
		token = pageToken
		q1Start = DateTime.now
		q1Start = q1Start.strftime('%F')
		q1End = DateTime.now - daysStart
		q1End = q1End.strftime('%F')
		q1Data = Insight.page_insights(token, metric, q1End, q1Start)
		q1_data_hash = Insight.get_values(q1Data)
		q1_date_array = Insight.create_date_array(q1_data_hash)
	end

	def fb_pages(userToken)
		@pages = Insight.get_pages(userToken)
		@pages
	end
end
