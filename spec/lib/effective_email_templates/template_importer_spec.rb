require 'spec_helper'
require 'effective_email_templates/template_importer'

describe TemplateImporter do
  it 'imports templates from view files' do
    Effective::EmailTemplate.delete_all
    expect{ TemplateImporter.invoke }.to change { Effective::EmailTemplate.count }
  end

  it 'does not import templates if a template already exists in the database' do
    Effective::EmailTemplate.delete_all
    expect{ TemplateImporter.invoke }.to change { Effective::EmailTemplate.count }
    expect{ TemplateImporter.invoke }.to_not change { Effective::EmailTemplate.count }
  end
end