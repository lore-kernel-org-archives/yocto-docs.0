Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44583.1795621542486082832
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 07:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TBLDtzZz;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: twoerner@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c516a1623d0so602812366b.2
        for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 07:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621541; x=1796226341; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FH3tmwwbbIbWaBnJMKg9GHOYV3EBGfieKPrIWCVy8vA=;
        b=TBLDtzZzagij6/DS2piRVEePP6H/B+C6oKPnowDkSby6HxrD/VkxFN2fd8cwZmVcFn
         M+/tejRi+jSF3esanWvj8rUwHaM7xfnncmJ3dj+bupTZ6THM7h7rhUrGHhO8BiQX0v/9
         S4celJ7hOzYxT69oE5dziSt8NcgplfakknWGb/HroEi6gZOYvHHjbx+SoCH1i5dTfNrD
         zhEEqNwyP3m2E7qAR9JPLb+eEn1NwfeuTkcEOsF4h2Di/X07xXdVG3PA77eBhUY4FTwk
         sXsJAm+iwXBgpT59QRsU4AN9OyBgC6ZRL2TFR2FJqoStLQFCqB089fLT1+QgIMv1fjnP
         NnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621541; x=1796226341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FH3tmwwbbIbWaBnJMKg9GHOYV3EBGfieKPrIWCVy8vA=;
        b=xOkBEgrDasihKjRF3reL/MRX695xBi9gT0AkiP1XrKcukARael6sSTuu8+pRT6luQt
         XyqT4rpF8NC17YeBTCytVcu7+m6mCjHrnCMEi4hPoQiUuGH4QAxD5n1gO77G7KUEY5DN
         d+sddtBj+D2Zy8RX93/MLc3yvo34w7XKMDrv3+FrqAhLnIBDq42CJUc1U+rNL3w0TJkk
         M7eDlXkv9FIfqDRPR56d8Ow8vP8cHSh/LTUAp1sH0JHgUo1zMFs0951oFP/lVK01pzjc
         8bYHEOmVINDwNRHSQNe/Wj+We1PpjRjY3QwTDbozuO9mRRuwRBQj2ySl/xwCOoQlDzEw
         nEKA==
X-Gm-Message-State: APuU4Z9uaEeyzJKy4/7EKlUrtZppi7x6Pu6znaIrvOI3wdFIW1XukvFL
	Tk6VYiPfpGP8mQCmBPdkisZbhaQPhefVQ7FW4T2Pyn5xLZZl0DrPIX1SspEC1g==
X-Gm-Gg: AZFdTZctJH8rTyyYZj3YXnPO5VzFOR2RLi699B0+sIRqtmS1jf7OFrUBUAp2gqwALaO
	L9lWuqBayv/cjcZrrmTtZigNqo/WJpLZ59NMNOkf0OKPg8lJyQ3lme9NjXW1LRfgl7Aus0jp2Ho
	LEQAIku9nWf2IV5OyFaUVJX+MiPbAquDr8saQvIcP84luWR1Mt7ud+ZB2hP+uA+t66TqrMPDKds
	1siARqvQ+04S6ikUjR/oE1RZnr/3ZZQtF+lRRNVy+bCGEUOSZ2+KnPqDFJO/WjznM4WH71wOHg7
	LzAIVy1bDOT3mSmE+CGn99XfmjcB4RbQNSmfn6XSuD16TxQfPFlVAahRYff1RWbulWLzdp40Hkp
	T+ykRMIv1M0hAp/vfSo8uR8XcDYNAbpGSrGAF6a6ZFbEAgx6TE1v2DxTAsAlXQSG6oUAyA/7d0v
	gOm4SSwo6+EtYQhFUg5979o2jG0+498OD4fAXm8TwySK4m40TxAkyRlyKkQBZbCqdXnrqFRkNiO
	CPCFTJF70O00M3Sb9wVjhmPRXzxKDGLp4N3B2b3amcUHweYBB9YToY/P/SJ06NztMaS5cy5ri1V
	LOKNmFpzkqycgD4f5X3HgX/P7ctkj+pXnLX1nDjGp51lqLQrwN1532B6G6j12+YHsmM6elErfPc
	EvujaLtdWtcMVTS3JAMOKkfpvIgqg9xiA
X-Received: by 2002:a17:906:b091:b0:c51:24a7:deb7 with SMTP id a640c23a62f3a-c513a39f14bmr1100917666b.3.1795621540219;
        Wed, 25 Nov 2026 07:45:40 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm651892066b.51.2026.11.25.07.45.37
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:45:38 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 0/7] sphinx: carry lexers for the languages the manuals show
Date: Wed, 25 Nov 2026 10:45:28 -0500
Message-ID: <20261125154535.3486104-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 15:45:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10835
Content-Type: text/plain; charset="utf-8"

This is the series proposed in [1]: the BitBake lexer first, then the
other lexers, one patch each. The BitBake lexer is patch 1 and can be
applied on its own.

No block uses any of these lexers yet, so the rendered manuals do not
change, with one exception: the console fix in patch 6 changes how
existing console blocks read a line opening with a bare "#", from a root
prompt to program output. Every commit builds clean under -W on its own.

The BitBake lexer takes its patterns from BitBake's own parser, and is
the same lexer proposed to Pygments in [2]. The SCC and wks lexers are
derived the same way, from yocto-kernel-tools and from wic's parser.

The series is based on master-next with two of your pending series
applied, since both also edit the extension list in conf.py:

  - Add support for documentation tags [3]
  - Add a "Library Functions" section to the ref-manual [4]

The tags series needed two trivial conflict resolutions to apply on
master-next, both in the tags it appends to the end of
contributor-guide/submit-changes.rst and ref-manual/kickstart.rst.

[1] https://lore.kernel.org/r/atjXdzebFGmKVjj8@localhost.localdomain
[2] https://github.com/pygments/pygments/pull/3284
[3] https://lore.kernel.org/r/20261028-tags-v1-0-d5ad01019eae@bootlin.com
[4] https://lore.kernel.org/r/20261124-oe-utils-docs-v1-0-5fafbf6cb01c@bootlin.com

Trevor Woerner (7):
  sphinx: carry a BitBake lexer as a local extension
  sphinx: add a lexer for BitBake with placeholders
  sphinx: add a lexer for kernel metadata SCC files
  sphinx: add a lexer for wic kickstart files
  sphinx: add a lexer for pydevshell sessions
  sphinx: read a bare "#" in a console block as output
  sphinx: mark placeholders in console and plain-text examples

 documentation/conf.py                         |   9 +-
 .../sphinx-static/theme_overrides.css         |  20 +
 documentation/sphinx/bitbake-lexer.py         | 432 ++++++++++++++++++
 documentation/sphinx/bitbake-placeholder.py   | 145 ++++++
 documentation/sphinx/console-lexer.py         |  53 +++
 documentation/sphinx/placeholder-lexers.py    | 134 ++++++
 documentation/sphinx/pydevshell-lexer.py      |  48 ++
 documentation/sphinx/scc-lexer.py             | 116 +++++
 documentation/sphinx/wks-lexer.py             |  60 +++
 9 files changed, 1016 insertions(+), 1 deletion(-)
 create mode 100644 documentation/sphinx/bitbake-lexer.py
 create mode 100644 documentation/sphinx/bitbake-placeholder.py
 create mode 100644 documentation/sphinx/console-lexer.py
 create mode 100644 documentation/sphinx/placeholder-lexers.py
 create mode 100644 documentation/sphinx/pydevshell-lexer.py
 create mode 100644 documentation/sphinx/scc-lexer.py
 create mode 100644 documentation/sphinx/wks-lexer.py

-- 
2.50.0.173.g8b6f19ccfc3a

