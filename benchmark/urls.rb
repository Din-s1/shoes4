# frozen_string_literal: true

require 'benchmark/ips'
require File.dirname(__FILE__) + '/para_creator'

class UrlBenachmark < Shoes
  include ParaCreator
  url '/', :index
  url '/first', :first
  url '/second', :second

  def index
    button 'Start benchmark' do
      Benchmark.ips do |benchmark|
        benchmark.report 'visit both urls' do
          visit_both
        end
      end
    end
  end

  def first
    create_paras 4
  end

  def second
    create_paras 5
  end

  def visit_both
    visit '/first'
    visit '/second'
  end
end

Shoes.app
