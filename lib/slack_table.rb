# frozen_string_literal: true

require_relative "slack_table/version"

class SlackTable
  def initialize(options = {})
    @title = options[:title] || ""
    @columns = options[:columns] || []
    @data = options[:data] || []
  end

  def render
    "*#{@title}*\n```\n#{[header_row, data_rows].join("\n")}\n```"
  end

  private

  def padding(text, max_length, direction)
    if text.length < max_length
      padding = " " * (max_length - text.length)
      direction == :left ? text + padding : padding + text
    else
      text[0, max_length]
    end
  end

  def fill_dash(length)
    "-" * length
  end

  def lines
    fill_dash(@columns.reduce(0) { |sum, col| (col[:width] || 10) + sum } + @columns.length - 1)
  end

  def col(column, row = {})
    align = column[:align] == "right" ? :right : :left
    data = (row[column[:index]]).to_s || ""
    padding(data, column[:width] || 10, align)
  end

  def get_header_col(column)
    align = column[:align] == "right" ? :right : :left
    padding(column[:title], column[:width] || 10, align)
  end

  def rows(row)
    return lines if row == "-"

    @columns.map { |column| col(column, row) }.join(" ")
  end

  def header_row
    @columns.map { |column| get_header_col(column) }.join(" ")
  end

  def data_rows
    @data.map { |row| rows(row) }
  end
end
