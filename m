Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14756.1795781133599960127
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2026 04:05:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wbJPnaDz;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-536c8f958d7so60878781cf.1
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 04:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795781132; x=1796385932; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7SxhF78C9Di3ld32zKkyGZ0+CJPA+TuOCKfejRpK6Vc=;
        b=wbJPnaDzq7+DpyfK7SoAaw2+BYAUumIjfbXG1ILaV7HhIOIspQYivDZC2NI4znmJTk
         3CseEaSTjVCdIPN9pAZI+INvaIR9NVPGOnXEmmANwUlj1QAPNCEqxa/xY5oylfHKx9CB
         FqlpLEDigKiwmO8SU7xu9S/sopbyQFybfrbTAJ8dZ8ypyL0W85ApA9jgqf4gtjNvz8oa
         7uK0RFPpAuCemnJMZMahH5VCavgSgCuwzyQTBuYV4dJKY778ys7O4g8K0j68p1tBfi+b
         1CurSDRQkybW55jMejkg4A7MPRNMko/degI78kEcH7UtdXBfN+iR2MQ9vlLCrDT2Wbx0
         wncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781132; x=1796385932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7SxhF78C9Di3ld32zKkyGZ0+CJPA+TuOCKfejRpK6Vc=;
        b=B7tX14OfAUcEMhqNpMU9d7BUOzpIw1SbcK+3+TbD72o8fLNaqBJt9LckJmioOxUs4D
         9PvVLHbM7UBHQ4j9u7eNX4OnXY4ZXyoqlI4JGhxuM00hZrfVn8lI4/v2fp8v38+s1CvM
         gQ112w1uy5e8LoI6KhJN4ZqJudmBloPHK2wchezkeRQkt4HnQXFGj+h/7r+4NLrHL3a6
         0y4Atu0R2zrcDhtE6997QSj8vtthMrj2YFhlL2ikDHSs4QUG2zGKmLG5iYwQCBXESG3I
         8IthWzJjd9z0DXvc6MYYeRzpVwv1LzI5ZygXJEWfkmZRuKAtbibJNzhFivLoYiHatEXx
         bGqQ==
X-Gm-Message-State: APuU4Z+KfAQF0AYRBbQPlwWi/PSTsh1GSZGgb9Q65U2PCFIs/c8O9l5M
	17PdWQfhdsDe2RFD5FZcvW5HkAeusEZLawBIlJwhB1gedDrGCXSXywcZnhLnsA==
X-Gm-Gg: AZFdTZfL4afgttfqr7GvH7rOFUCrPXyWYH7or7Ljm+C/5D0798oJhWTTz1sj7jJFeX2
	yfBpotki+eumuYCrKihA0f54vSvUZA1zUIZGZgY3si8i9rEp0XdsosxmRUVqKJ5QmwZZuSzEM0Q
	7EWLsMeu3MG4i10ZZIv21EDzIJf+ae0eT8nSuOssytngGdmll9iDAGKrRlLmfkBUNLp6YZRINXh
	X65bvwnRYMJQ18tAt1uOLQPJU3PToS1HQim7okPvq8PiVXwFeMgBUphFVoIW5V6PW9qzJx6RTn6
	SUV39gDGk1cdMC6EwCJzgoZqy4QyNy46rZX/amQvUC7G2tZAiJUcdKXIGxArZBY7AVbHBmXe0/n
	iOWSJEL7puyp6O7BrdKidUNF3stI0hhMDdgJP3DciFWShhkY7eEcb6rR+mlpNB2e7EkrV3NN7hr
	JZ/wFqMLKJYjQUoziOWnugJShtudXoxgLoljaxR6qdPAvGswFu81o3LhudksNrnIKcuCAn5MN2G
	wUWvVPmvtpu92dWT1QlXiEuraw6IwlL60QIKIKH67Yu/aF3Ha9VsTj9JkogheOeP96Se7Q0eUzU
	IoP/JOfD8ozSmYL6V4tcWKsVIaAQPYWm8IfreGm3cmNTUfHxdNfSlaId6eVrkwXPXpbY6SbKsMO
	TD7bK4VJFRoqk8NChD9XNgF91d+43Jtsb
X-Received: by 2002:a05:622a:2609:b0:55b:d65c:665e with SMTP id d75a77b69052e-55d7688cd55mr463348581cf.5.1795781130767;
        Fri, 27 Nov 2026 04:05:30 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7884b5e9sm208106041cf.18.2026.11.27.04.05.29
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:05:29 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3 0/4] sphinx: add lexers for wic kickstart files and pydevshell sessions
Date: Fri, 27 Nov 2026 07:05:24 -0500
Message-ID: <20261127120528.837051-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 12:05:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10853
Content-Type: text/plain; charset="utf-8"

Lexers for wic kickstart (.wks) files and for sessions in BitBake's
Python development shell, which the manuals show and Pygments does not
cover, and the changes that tag the manuals' examples to use them.

changes in v3:
- tag the existing kickstart and pydevshell examples with the new lexers
- make the pydevshell lexer recognise the "... " continuation prompt

changes in v2:
- keep only these two lexers
- rebase on master

Trevor Woerner (4):
  sphinx: add a lexer for wic kickstart files
  docs: use the wks lexer for the kickstart examples
  sphinx: add a lexer for pydevshell sessions
  dev-manual: use the pydevshell lexer for the session example

 documentation/conf.py                         |  4 +-
 .../dev-manual/python-development-shell.rst   |  4 +-
 documentation/dev-manual/wic.rst              |  6 +-
 documentation/ref-manual/kickstart.rst        | 16 +++--
 documentation/ref-manual/variables.rst        |  8 ++-
 documentation/sphinx/pydevshell-lexer.py      | 51 ++++++++++++++++
 documentation/sphinx/wks-lexer.py             | 60 +++++++++++++++++++
 7 files changed, 136 insertions(+), 13 deletions(-)
 create mode 100644 documentation/sphinx/pydevshell-lexer.py
 create mode 100644 documentation/sphinx/wks-lexer.py

-- 
2.50.0.173.g8b6f19ccfc3a

