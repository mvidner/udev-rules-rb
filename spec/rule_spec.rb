
require_relative "./spec_helper"

describe UdevRules::Rule do
  describe ".parse" do
    let(:rule_string) { 'SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ' \
                        'ATTR{address}=="00:22:43:12:34:56", ATTR{type}=="1", '\
                        'KERNEL=="wlan*", NAME="wlan0"' }
    let(:rule) { described_class.parse(rule_string) }

    it "gets 1st value" do
      expect(rule.value("SUBSYSTEM")).to eq("net")
    end

    it "gets 1st operator" do
      expect(rule.op("SUBSYSTEM")).to eq("==")
    end
      
    it "gets middle value" do
      expect(rule.op("ACTION")).to eq("add")
    end
      
    it "gets middle operator" do
      expect(rule.op("ACTION")).to eq("==")
    end
      
    it "gets last value" do
      expect(rule.op("NAME")).to eq("wlan0")
    end
      
    it "gets last operator" do
      expect(rule.op("NAME")).to eq("=")
    end
  end
end
