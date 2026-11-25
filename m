Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44586.1795621556657482999
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 07:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qQUG3AnZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: twoerner@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so962592166b.2
        for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 07:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621555; x=1796226355; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8xm2pkiBKoAFYcjiRQ32m42vtUPVgV1pqxNkaVwsL3Y=;
        b=qQUG3AnZc5eCfuD9YXAdLibpKbjDAcTiLB8GF+1Ijw6tGGB+rWyR+x+zv0Y0PryxTX
         zZpbfTspJoA7V0GDnv9pgVzUDaL+itZtyefP5+20JjTtd/VbcoX3KYnB7RR0YfXN1CEz
         /WGPtYxNzbym5RLCewrbF85AuTkOb15Mp+02YKJqQaMRuW2i8Kx67aNIktS+8R1zwdOx
         H5zw6jUuIhYq3kJGKTQ2I8UoIAq6iVGJVqCbx+Ofhjln3JNUFAIozTPqR9NyKA9/9ni8
         07cUOOkvtDzF44XA9AaipQnRVH+43pa9s1soX6Ki1aLb3XsWnwHH1vuybVXqDkgYlb2+
         4pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621555; x=1796226355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8xm2pkiBKoAFYcjiRQ32m42vtUPVgV1pqxNkaVwsL3Y=;
        b=eX9N8CajVkqgfq7l3QOqXUojEkQkdsRbIE00NDiZhlSjGnQ2OmohvXQ1tXEmOTdhlu
         PZFGjzrTIoY+/diqD2PGO4AqZFkux51sFGCeeJsxHL5U7Y6EMxXlodL5pGojreL4taIT
         46dn4vCHlvq7e/ksLz7rPtalhsPA3VfhGryZDjQpiBg7HkG85GhnahuHjFgTdZBHvvbn
         lYRKiX6qKvlF/t545KTHgW6Z1JT0x6sXQsQQdk6AK3+/P+qmrW7/c8gTOdvyT/Zxrpam
         4CkZ0XOrmrOFcS/tAkM99zdgLXMcn4gzmFyjnLnMCDccI4gdoMy4Kl06qotXogQQ3vmM
         bnJg==
X-Gm-Message-State: APuU4Z9KwnbiBZEnuoPqfxTANQ5T6iGyWEKxqVQz6ndXOcjNG5AhRKMJ
	LS1pA+Jmb4X0CBl/DCVoXM9KIvxqcUA+9E7eqpS4S4cQA54nPiHFO1u3z2MHNQ==
X-Gm-Gg: AZFdTZfIfTTyLxac1+24AlEYaj74iUkHgglLrSs9Bv852YUvpQuRfxdqT7gnfW6/Ip5
	VjIO2n/goRYoYn8rTIif5Vq9tW6tRxVyX53v0Czx0F9Cm8QrEgHjJzJnLr7BdJd8XqbDRbmK4zT
	0MQhIDmYqcRynIYTmDewe6m/p79i3o7P+y+ro3slZy66TahDMa2O9Xp3WDeJHK+nO42Qad3YCYZ
	N2gNaSz+Lxu4uwdA5DiNvT0YUG1iugYy2Mw3cWILjwmrLXkhJJjREonMa9TxN/EOwXy3spPEB6y
	0ipZGa4Jm4kmF9RYay1vfrVIXPwUnjEHKT64ejZrHg/aH+R9CYMQRWOPv2DfM5BzoCAfB1/QxAd
	f4s24cts4HefduJY2YEpiolz1LoOFmih5rnb9etnSnu4zJp9rXQBfxZlVq8uYgcbZIHKaxHgyRx
	rEtAAXG81T1G82pmQDwAb/+xXSNk5nzlne9w9AHELKZoBzzc3EENT4/GqBNEE2UYSFlmRJul1zN
	zHE9KncCLh8GSLdMFnqGbJ2zHInR5svVFWh6zu//763jSQtvpbx0U2b+ReNIEEyJjlUrrGuD0Od
	DNYjqELLF9dIC4AUdXc54wWmIEYTK15lvS2dVNsO+sqn5TThu350ZxBPiWNb6izDyK9ALi+/VKF
	hCgmKLt3RJXJaXCa1ZzrKRE2s8TpDYGk=
X-Received: by 2002:a17:906:eec9:b0:c51:5589:35a1 with SMTP id a640c23a62f3a-c515589d211mr1157463666b.5.1795621554578;
        Wed, 25 Nov 2026 07:45:54 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm651892066b.51.2026.11.25.07.45.51
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:45:52 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 7/7] sphinx: mark placeholders in console and plain-text examples
Date: Wed, 25 Nov 2026 10:45:35 -0500
Message-ID: <20261125154535.3486104-8-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261125154535.3486104-1-twoerner@gmail.com>
References: <20261125154535.3486104-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 15:46:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10842
Content-Type: text/plain; charset="utf-8"

Most of the values a reader has to replace are in the commands the
manuals tell them to run, where <recipe> and <path/to/repo> look exactly
like text to type verbatim.

This adds console-placeholder and text-placeholder. A console line
containing a placeholder is already valid, so they re-label the run with
a filter over the finished token stream rather than a new grammar. The
filter works on offsets, because the shell lexer reads "<" as a
redirection and splits the run before a filter sees it.

Both are opt-in per block, because angle brackets also mean other
things, such as the kernel's <idle> task in an ftrace listing. A C
include is the one case the filter decides for itself, since nobody
substitutes the header in "#include <near/dbus.h>".

AI-Generated: codex/claude-opus 5.5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/conf.py                         |   3 +-
 .../sphinx-static/theme_overrides.css         |   2 +-
 documentation/sphinx/placeholder-lexers.py    | 134 ++++++++++++++++++
 3 files changed, 137 insertions(+), 2 deletions(-)
 create mode 100644 documentation/sphinx/placeholder-lexers.py

diff --git a/documentation/conf.py b/documentation/conf.py
index 5db20ff021fc..d56c648d8701 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -85,7 +85,8 @@ extensions = [
     'scc-lexer',
     'wks-lexer',
     'pydevshell-lexer',
-    'console-lexer'
+    'console-lexer',
+    'placeholder-lexers'
 ]
 
 # current_version = "dev"
diff --git a/documentation/sphinx-static/theme_overrides.css b/documentation/sphinx-static/theme_overrides.css
index 2083ebb5baf4..2120c43245cc 100644
--- a/documentation/sphinx-static/theme_overrides.css
+++ b/documentation/sphinx-static/theme_overrides.css
@@ -264,7 +264,7 @@ a.sd-badge {
    survives a monochrome printout. The border is #5b8db9 rather than
    something paler because it has to clear 3:1 against the code block to
    count as a boundary: a lighter blue measured 2:1 and disappeared. */
-.rst-content .highlight-bitbake-placeholder .ge {
+.rst-content div[class*="-placeholder"] .ge {
     color: #144e8c;
     font-style: italic;
     font-weight: 600;
diff --git a/documentation/sphinx/placeholder-lexers.py b/documentation/sphinx/placeholder-lexers.py
new file mode 100644
index 000000000000..668a3b71e992
--- /dev/null
+++ b/documentation/sphinx/placeholder-lexers.py
@@ -0,0 +1,134 @@
+"""Marking placeholders in languages whose lexers already accept them.
+
+``bitbake-placeholder`` exists because BitBake *rejects* a placeholder in
+a variable name: ``<`` is not in its name charset, so
+``SRCREV:pn-<recipe>`` is not an assignment at all until a rule says so.
+Widening a grammar has to be done in the grammar.
+
+Everywhere else there is nothing to widen. ``$ devtool modify <recipe>``
+is a perfectly ordinary console line; the placeholder simply looks like
+text to type verbatim. All that is needed is to re-label the run, and
+that can be done after lexing, for any language, without touching how it
+parses.
+
+So this carries a filter rather than a dialect, and builds the dialects
+from it. Most of the manuals' placeholders are in console blocks, so this
+is where the convention is most often unreadable.
+
+The filter works on absolute offsets rather than on token values, because
+a base lexer may already have split the run: the shell lexer reads ``<``
+as a redirection operator, so ``<recipe>`` never arrives as one token.
+
+Output is marked as well as input. A session lexer can tell a typed line
+from a printed one, but that does not decide whether a run is a
+placeholder: a usage synopsis is printed by the tool and exists precisely
+to say what the reader supplies.
+
+Each dialect is opt-in per block. Angle brackets mean other things, such
+as ``<idle>-0`` in an ftrace listing, where ``<idle>`` is the kernel's own
+name for the idle task. Apart from a C ``#include``, which is excluded
+below, no pattern can tell those from a placeholder, so a person decides
+per block, and a block whose printed text should not be marked is simply
+left out.
+
+An address in the angle brackets RFC 822 wants is safe by construction
+rather than by exclusion: ``@`` is not in the placeholder charset.
+"""
+import importlib
+import re
+
+from pygments.filter import Filter
+from pygments.lexers.special import TextLexer
+from pygments.token import Generic
+
+# The corrected console lexer, not Pygments' own, so a placeholder block
+# reads a bare "#" the same way every other console block does. The
+# module name is not an identifier, so it cannot be a plain import.
+BashSessionLexer = importlib.import_module('console-lexer').ConsoleSessionLexer
+
+__version__ = '1.0'
+
+# Opens with a letter, then word characters, spaces and the punctuation a
+# path or a dotted name needs. No "@", so an e-mail address never matches.
+PLACEHOLDER = re.compile(r'<[A-Za-z][\w .\'/-]*>')
+
+# The one bracketed form that is never a placeholder however a block is
+# labelled, because it is C rather than prose: the reader does not
+# substitute the header in "#include <near/dbus.h>". This is mechanical
+# and needs no per-block judgement, unlike the opt-in itself.
+INCLUDE = re.compile(r'#\s*include\s*$')
+
+
+def placeholder_spans(text):
+    """Offsets of the runs to mark."""
+    return [m.span() for m in PLACEHOLDER.finditer(text)
+            if not INCLUDE.search(text[:m.start()].rsplit('\n', 1)[-1])]
+
+
+class PlaceholderFilter(Filter):
+    """Re-label placeholder runs in a finished token stream."""
+
+    def filter(self, lexer, stream):
+        tokens = list(stream)
+        text = ''.join(value for _, value in tokens)
+        spans = placeholder_spans(text)
+        if not spans:
+            yield from tokens
+            return
+
+        split, pos = [], 0
+        for ttype, value in tokens:
+            end = pos + len(value)
+            cuts = sorted({pos, end} | {edge for span in spans
+                                        for edge in span if pos < edge < end})
+            for a, b in zip(cuts, cuts[1:]):
+                inside = any(s <= a and b <= e for s, e in spans)
+                split.append(((Generic.Emph if inside else ttype), text[a:b]))
+            pos = end
+
+        # Merge adjacent pieces of the same type. Keeping the base lexer's
+        # boundaries emits one span per fragment, and an outlined style
+        # then draws a box around each half of the same placeholder.
+        merged = []
+        for ttype, value in split:
+            if merged and merged[-1][0] is ttype:
+                merged[-1] = (ttype, merged[-1][1] + value)
+            else:
+                merged.append((ttype, value))
+        yield from merged
+
+
+def _filtered(class_name, lexer_name, alias, base):
+    """A copy of `base` that marks placeholders and changes nothing else."""
+
+    def __init__(self, **options):
+        base.__init__(self, **options)
+        self.add_filter(PlaceholderFilter())
+
+    return type(class_name, (base,), {
+        '__init__': __init__,
+        '__doc__': '%s, with placeholders marked.' % lexer_name,
+        'name': lexer_name,
+        'aliases': [alias],
+        'filenames': [],
+        'mimetypes': [],
+    })
+
+
+ConsolePlaceholderLexer = _filtered(
+    'ConsolePlaceholderLexer', 'Console session with placeholders',
+    'console-placeholder', BashSessionLexer)
+
+TextPlaceholderLexer = _filtered(
+    'TextPlaceholderLexer', 'Plain text with placeholders',
+    'text-placeholder', TextLexer)
+
+
+def setup(app):
+    for lexer in (ConsolePlaceholderLexer, TextPlaceholderLexer):
+        app.add_lexer(lexer.aliases[0], lexer)
+    return {
+        'version': __version__,
+        'parallel_read_safe': True,
+        'parallel_write_safe': True,
+    }
-- 
2.50.0.173.g8b6f19ccfc3a

