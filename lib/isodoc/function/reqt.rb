module IsoDoc::Function
  module Blocks
    def recommendation_labels(node)
      [node.at(ns("./label")), node.at(ns("./title")), 
       anchor(node['id'], :label, false)]
    end

    def recommendation_name(node, out, type)
      label, title, lbl = recommendation_labels(node)
      out.p **{ class: "AdmonitionTitle" }  do |b|
        b << (lbl.nil? ? l10n("#{type}:") : l10n("#{type} #{lbl}:"))
        if label || title
          b.br
          label and label.children.each { |n| parse(n,b) }
          b << "#{clausedelim} " if label && title
          title and title.children.each { |n| parse(n,b) }
        end
      end
    end

    def recommendation_attributes1(node) 
      out = [] 
      oblig = node["obligation"] and out << "Obligation: #{oblig}" 
      subj = node&.at(ns("./subject"))&.text and out << "Subject: #{subj}" 
      node.xpath(ns("./classification")).each do |c|
        tag = c.at(ns("./tag"))
        value = c.at(ns("./value"))
        tag && value or next
        out << "#{tag.text.capitalize}: #{value.text}"
      end
      out
    end

    def recommendation_attributes(node, out)
      ret = recommendation_attributes1(node)
      return if ret.empty?
      out.p do |p|
        p.i do |i|
          i << ret.join("<br/>")
        end
      end
    end

    def recommendation_parse(node, out)
      out.div **{ class: "recommend" } do |t|
        recommendation_name(node, t, @recommendation_lbl)
        recommendation_attributes(node, out)
        node.children.each do |n|
          parse(n, t) unless %w(label title).include? n.name
        end
      end
    end

    def requirement_parse(node, out)
      out.div **{ class: "require" } do |t|
        recommendation_name(node, t, @requirement_lbl)
        recommendation_attributes(node, out)
        node.children.each do |n|
          parse(n, t) unless %w(label title).include? n.name
        end
      end
    end

    def permission_parse(node, out)
      out.div **{ class: "permission" } do |t|
        recommendation_name(node, t, @permission_lbl)
        recommendation_attributes(node, out)
        node.children.each do |n|
          parse(n, t) unless %w(label title).include? n.name
        end
      end
    end

    def requirement_component_parse(node, out)
      return if node["exclude"] == "true"
      out.div **{ class: "requirement-" + node.name } do |div|
        node.children.each do |n|
          parse(n, div)
        end
      end
    end

    def requirement_skip_parse(node, out)
    end
  end
end
