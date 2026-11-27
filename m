Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14809.1795781136373391712
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2026 04:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Kd3N/qdg;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55bd96affd2so108708951cf.1
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 04:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795781135; x=1796385935; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SWoN+reuYYJG9IDPj/4nZV+/muow3ekWiOd/Uyd1Szs=;
        b=Kd3N/qdgB2xZDEtz1JwF3qQsJqyYXu6q8f/QRL2qXTtzjcOtlvR+3fcpvOMU7Jf8WN
         ZUARPclkWVp2gWu3blvicwAJ9rF7DSVoSD3x05oEh8i3thghypc7toco9nRncQsBq+/U
         Vii88xO0biltWP7/6ug+fHY41uuOQhlCKFfHoU5YyNcS1uzi+Fy+juMzrpkCOtVxRKK+
         7iQ3NVQj1X9ALEfYdtr62l2U9uHv4jz4W3eWEspWNF/6QNTbGwALP8+RaV+/cSvUemhY
         UwNEGNSAGAV/LovFGS/sp5AKTjRLMyjB4tkcfgYSR29X17p3I6ZVgiCpYj31x/5KOhol
         2K5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781135; x=1796385935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SWoN+reuYYJG9IDPj/4nZV+/muow3ekWiOd/Uyd1Szs=;
        b=j6nr/GWmOlDvPEZAYOzT+5Px8iMGXHqWjrjR6J42HVy5/k+ZIqQp86Cg/nV/CrcO3v
         ZDK9mjGvZaL8aXo3WXH5yyZUzuCk12SoH6spyPfisCDRLFmklBRs4OiwHdN39+Y6pkR4
         FVIhxqsxYZf/xhrZdKhlRTb3g0IVs85et/6k7xnLEbMVw8Geo/FI3m1kCKRu1Qxwty5I
         TBN3WldI8HpLoW39RssWNm2BsNtEuZ7sGFqJi8aw4amAm9AsGVzyiud7THYlWge2D/lg
         p61/n47v3H/PPjs3/QRzGhyFALJE+f3SGoqTv9stz+iEAUxwXX8QhaiGLo4PuxBxaEhF
         tmcA==
X-Gm-Message-State: APuU4Z8kIQTnaflTXOoU+wtACoVnAB2akR1XVEqWAhb/8flEw1F4UqXP
	I8PIS7EG/2V98e3twPitC6BVd8mi3d+l1R+EEjf7JSggl/pIvmRPFrwNlpIm+g==
X-Gm-Gg: AZFdTZe4Ge+VTK2eSj+8XRbanS3341fiv58c5kf3zu5qk8u1Ql8oh2jMuQ/laBUA08z
	d95MdVCgX6n11MliWW+IJ3SvRr8NLU1WLi0pGgg8534B4x6yD3HaTTmUOfWanTLOjZypDEPkME7
	A0agN+x7Tmi8jgCEBXlpXWqipFfPPou7OBZNDJ7mYUr58wZ57/MobPwQ8EMS5PussiCK1J92Tsr
	HESjU/c7Aa6h9CY8B9XCelCzPkK2O5HocdozLtN0Bkphz4hWbB9bjJzgH1DcVdW13woVlIJA2cA
	cGXJoN9wZM5z12dS2b2UYhbBlX0cpYDfxgDsFH7LAumPpNwG7LGmNzlFHysY15OUrz9HMigM69q
	LZFJXTsoYlhNjRaoTWNM0UA2imeTGgbry3oFf3d4ooAhK5hF6RPJqoZC5/nmUsg/tlKFc30F+l5
	PGpOJeeTWMfSitFjGdIHlqERfY+ceoRYSWLYefyahpgg5q+/xn/7Nhu4OcDq6UDDu8WMX7J8Fs7
	i6sfnzorYAJiP+l7unL2Vquq1n5PyyyL95KXBD90Q5r8XV1HfDrxlaez2bU4WaiSsnDnjqPvt20
	hsNRv65frARginOGbdWAgobVXk2jno5Skp5BKFogdXqnKuqWCPOk0iQrhKynywOjKsu0v2oBiPj
	WApGEIHpAD6bam33b
X-Received: by 2002:a05:622a:1b28:b0:535:1463:ec25 with SMTP id d75a77b69052e-55d76a3c64dmr421674401cf.25.1795781135260;
        Fri, 27 Nov 2026 04:05:35 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7884b5e9sm208106041cf.18.2026.11.27.04.05.33
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:05:33 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3 3/4] sphinx: add a lexer for pydevshell sessions
Date: Fri, 27 Nov 2026 07:05:27 -0500
Message-ID: <20261127120528.837051-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127120528.837051-1-twoerner@gmail.com>
References: <20261127120528.837051-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 12:05:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10856
Content-Type: text/plain; charset="utf-8"

The development manual shows a session in BitBake's Python development
shell, and no lexer reads it: console wants a prompt ending in $, #, or
%, pycon wants >>>, and both mark the whole block as program output,
which the theme greys. The prompt cannot be changed to suit them either,
since devshell.bbclass is what sets it.

Teach a session lexer the prompt instead, with Python inside it, so the
expressions the reader types are highlighted as Python and the results
are not.

AI-Generated: codex/claude-opus 5.5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- recognise the "... " continuation prompt (_ps2) without a backslash on
  the line before

changes in v2:
- rebase on master, where conf.py no longer lists the dropped lexers
---
 documentation/conf.py                    |  3 +-
 documentation/sphinx/pydevshell-lexer.py | 51 ++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 documentation/sphinx/pydevshell-lexer.py

diff --git a/documentation/conf.py b/documentation/conf.py
index 8992496f7569..7d0e103042fd 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -52,7 +52,8 @@ extensions = [
     'sphinx_copybutton',
     'sphinxcontrib.rsvgconverter',
     'yocto-vars',
-    'wks-lexer'
+    'wks-lexer',
+    'pydevshell-lexer'
 ]
 
 # current_version = "dev"
diff --git a/documentation/sphinx/pydevshell-lexer.py b/documentation/sphinx/pydevshell-lexer.py
new file mode 100644
index 000000000000..9e8a48e1f73e
--- /dev/null
+++ b/documentation/sphinx/pydevshell-lexer.py
@@ -0,0 +1,51 @@
+"""Lexer for ``bitbake -c pydevshell`` sessions.
+
+The development manual shows a session in BitBake's Python development
+shell: expressions typed at a ``pydevshell> `` prompt with their results
+beneath. No existing lexer reads it. ``console`` is a shell session and
+wants a prompt ending in ``$``, ``#``, or ``%``; ``pycon`` wants ``>>>``.
+Both mark the whole block as program output, which the theme renders in
+grey, so the block ends up dimmer than the prose around it and no better
+told apart.
+
+The prompt is not ours to change: ``devshell.bbclass`` sets
+``ps1 = "pydevshell> "``, so what the manual shows is what the reader
+sees. That leaves teaching a lexer the prompt as the only way to render
+one of these correctly.
+
+``ShellSessionBaseLexer`` does the work once ``_ps1rgx`` matches: it
+splits the typed line from its output and hands the typed part to an inner
+lexer, which here is Python.
+"""
+import re
+
+from pygments.lexers.python import PythonLexer
+from pygments.lexers.shell import ShellSessionBaseLexer
+
+__version__ = '1.0'
+
+
+class PyDevShellSessionLexer(ShellSessionBaseLexer):
+    """A session in BitBake's Python development shell."""
+
+    name = 'BitBake pydevshell session'
+    aliases = ['pydevshell']
+    filenames = []
+    mimetypes = []
+    url = 'https://docs.yoctoproject.org/dev-manual/python-development-shell.html'
+
+    _innerLexerCls = PythonLexer
+    _ps1rgx = re.compile(r'^(pydevshell> )(.*\n?)')
+    # devshell.bbclass prompts "... " while a statement is incomplete, as
+    # Python's own console does, without a backslash on the line before.
+    _ps2 = '... '
+    _bare_continuation = True
+
+
+def setup(app):
+    app.add_lexer('pydevshell', PyDevShellSessionLexer)
+    return {
+        'version': __version__,
+        'parallel_read_safe': True,
+        'parallel_write_safe': True,
+    }
-- 
2.50.0.173.g8b6f19ccfc3a

