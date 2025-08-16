package tree_sitter_systemd_service_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_systemd_service "github.com/jd-apprentice/zed-systemd/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_systemd_service.Language())
	if language == nil {
		t.Errorf("Error loading SystemdService grammar")
	}
}
