Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44585.1795621553662626040
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 07:45:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Y4dpLUpk;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: twoerner@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5188e4980fso109396166b.2
        for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 07:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621552; x=1796226352; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l/L3pCA0ank4LCLtWIj9065zBYaq4O8cnQa00w7Ma8c=;
        b=Y4dpLUpklT38GvtUQDnCobv1zc0QBpYcAz5H3ggvOlQD19vAmsJk+zhdU5W18aqsiE
         7xYUGLWcggO4aSZu4GcSmY6EslQkFKvn3Ie5vXIfx29FGUJ2cNMCRDelmDYp9Ro89hfS
         gC/D67YEZLHM3XCcrEg5GgBT+1oiwP0P45CpPEtfCjIMgXX1E9QEJs/H0UYYJDQKg4nR
         3WozTH1jobb0sZvO8qcnDV4O1SRk4fHdw4IKPVDPYcla5Lb4BwyePweyZIidf/FMntkQ
         Ndf4+wOmQOxADROsIiddRW4Q8XemmE9ggYXjoJKbtH9ZxwraLkyC1QrWnztxNoX5Z2U8
         bRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621552; x=1796226352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l/L3pCA0ank4LCLtWIj9065zBYaq4O8cnQa00w7Ma8c=;
        b=OFihEHbrtl6Y0Nr2nEklNCy5/IeoULO07AgM2w/F5SvsULYa9BJMyjagi1CewgAqm2
         ZW8Vd3113GifGOLI7OQCRCHsSmhYQVrOxhLcWhK3e9lfC1nq5BFt27fUR7ObYzHyOvuN
         gLxgqPZL96Zm54F2UAoGg91/XIophxXYNvK50wBunmE3kicGN/0qrRJjP5SOPvDCZ+Qm
         T8yU7VZQihcbATQz9WfnvzruCYTrsXZ8o4d81Tn46OmwIBbF1nV7Q0w7K52Fkvp4yVQH
         pYrL08IPZ3iCH3E+4ucZSt4lQpESVqMMsHVuXips95BLfG2xm+CilLWsgZ6otXMakVFR
         v4uQ==
X-Gm-Message-State: APuU4Z8vIkLhlA0iJL83Jz26trs7LWsUq92T91QnGerIu5sM2f6Tsvx0
	jVd/saDDQbmPJYbuS+YLaPwe5TDwbGpBhlvXFqO/V5KKIwigw0o3q+0U4ytw5w==
X-Gm-Gg: AZFdTZf2x54r28FozJ09CBIPGNmr24XyDrRE1ldrqWjBogAEtBYNsnzTgVUkKCzomSL
	TcOby6L89P6sE4Jx243kaZWkApfHbJK6Pdy2/P+jRe6oynd3KTJAV/JouJD/pqhIzBUIX9hkglf
	q8h11zjzpvM8GP0dM26MBRFd/OcbVmE3+iOxfDgK/87lWVtBrRbKB6b5CTaIfT4PocyzNr2fcmX
	o/TvymbDiZD1PyJ/Kfe1PIgYqOPwqn+7WcOSa43cV6UY0Qr7FIXz6OqTmdu5uRzXQPM3netJyhp
	+MdYJMm59JixFoz9U3j72XxLEQ2+/bIN7wDMJGTk+rkidIGWwxZKolQc7eiTzA9pLb+POcsDByX
	oDgGdlQveUuc+YrZR+aCCAw9pKDMoV+Ri6JSkexHDGPMUnukR0Ssjgv706jEaMrD/zxFDoz+hL+
	hnLpeJFtDWJmmcxPfDF244tx6KBLmyjdU+ptnBOBezSqGqcConeRwNYQstCgaRRnSC4IuS5Q5kq
	AyXeXG42ul0EsxtnWnHlLVXftDvZNHrCHMu2PuvNObqsuq3PTd4lLaKoagt7agutr8A3Qui8oUM
	MbMW12Onwig2tIALqi9M+GikEpjSCodsoKuUJF+5pxeFRqcejJYA3954vYz2avlXUrpEBiK5VWG
	LbFJ1vQqjHW/amNCPwm8wAtQGwuQUTJE=
X-Received: by 2002:a17:906:f8d2:b0:c50:bf14:8eb1 with SMTP id a640c23a62f3a-c513a84d84emr1169668066b.14.1795621551708;
        Wed, 25 Nov 2026 07:45:51 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm651892066b.51.2026.11.25.07.45.50
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:45:50 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 6/7] sphinx: read a bare "#" in a console block as output
Date: Wed, 25 Nov 2026 10:45:34 -0500
Message-ID: <20261125154535.3486104-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261125154535.3486104-1-twoerner@gmail.com>
References: <20261125154535.3486104-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 15:45:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10841
Content-Type: text/plain; charset="utf-8"

Pygments treats "$", "#", and "%" alike as prompts and lets the preamble
before them be empty, so a line opening with "#" is taken for a root
prompt and the rest of it is lexed as the command it introduces. Across
these manuals that line is a comment or a line of program output every
time, never a prompt: a root prompt carries the host preamble saying
whose root it is.

Require that preamble before a "#". The line then falls through to
Generic.Output, which is what it was, and the theme stops showing
perf headers and generated-file comments as commands somebody typed.

AI-Generated: codex/claude-opus 5.5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/conf.py                 |  3 +-
 documentation/sphinx/console-lexer.py | 53 +++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 documentation/sphinx/console-lexer.py

diff --git a/documentation/conf.py b/documentation/conf.py
index 3a7e3c920fc4..5db20ff021fc 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -84,7 +84,8 @@ extensions = [
     'bitbake-placeholder',
     'scc-lexer',
     'wks-lexer',
-    'pydevshell-lexer'
+    'pydevshell-lexer',
+    'console-lexer'
 ]
 
 # current_version = "dev"
diff --git a/documentation/sphinx/console-lexer.py b/documentation/sphinx/console-lexer.py
new file mode 100644
index 000000000000..0f9eaa4ce33e
--- /dev/null
+++ b/documentation/sphinx/console-lexer.py
@@ -0,0 +1,53 @@
+"""A console session lexer that reads a bare ``#`` as output, not a prompt.
+
+Pygments treats ``$``, ``#``, and ``%`` alike and allows the preamble
+before them to be empty, so a line beginning ``#`` is a root prompt and
+the rest of the line is lexed as the command it introduces. In these
+manuals that is wrong far more often than it is right: a ``#`` opening a
+line is a comment or a line of program output, and a root prompt carries
+the ``user@host:path`` preamble that says whose root it is.
+
+Requiring that preamble before a ``#`` is the whole of the change.
+``$`` and ``%`` keep Pygments' behaviour exactly, bare prompt included.
+A line that is no longer a prompt falls through to ``Generic.Output``,
+which is what it always was.
+
+This is a local convention rather than a universal one - outside these
+manuals a bare ``#`` really is how a root shell prompts - so it belongs
+here and not upstream.
+"""
+import re
+
+from pygments.lexers.shell import BashSessionLexer
+
+__version__ = '1.0'
+
+# Pygments' own preamble alternation, spelled twice: once as it has it,
+# and once with the empty branch removed. Keeping its wording rather than
+# writing a tidier one means a prompt shape it learns later still works.
+_PREAMBLE = (r'(?:\[.*?\])|(?:\(\S+\))?'
+             r'(?:| |sh\S*?|\w+\S+[@:]\S+(?:\s+\S+)?|\[\S+[@:][^\n]+\].+)')
+_NAMED = (r'(?:\[.*?\])|(?:\(\S+\))?'
+          r'(?:sh\S*?|\w+\S+[@:]\S+(?:\s+\S+)?|\[\S+[@:][^\n]+\].+)')
+
+
+class ConsoleSessionLexer(BashSessionLexer):
+    """A console session in which a bare ``#`` is not a root prompt."""
+
+    name = 'Console session'
+    aliases = ['console']
+    filenames = []
+    mimetypes = []
+
+    _ps1rgx = re.compile(
+        r'^((?:' + _PREAMBLE + r')\s*[$%]\s*'
+        r'|(?:' + _NAMED + r')\s*#\s*)(.*\n?)')
+
+
+def setup(app):
+    app.add_lexer('console', ConsoleSessionLexer)
+    return {
+        'version': __version__,
+        'parallel_read_safe': True,
+        'parallel_write_safe': True,
+    }
-- 
2.50.0.173.g8b6f19ccfc3a

