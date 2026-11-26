Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6920.1795732614463842581
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Nov 2026 14:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LscHBlFp;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5365d26ccbdso81338691cf.0
        for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2026 14:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795732613; x=1796337413; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HkM2EQEzvjNoG6pAwPWdZludkX/JMg2ikfFDsmcQChk=;
        b=LscHBlFpCpqO2j72g22ep4YMtBvazCNjLIxtw9D37MZHe1QQqrbKpsHY5+xbb+x83p
         w5hXvHHUeV8j/FFGM3ynI5jWYrDlQpMpYdfDuqWsi//yDASmBFp3dhxuntztAE7GrIKa
         Jvx1z8rJ4lbOTG8GI7W/iDVpppW84lCcBvJothFK4/TmwR+NOr792NE5IlcGeuJcfYK6
         Ds4WfDzo0eB2wePDU8U4Xb44KnkjS7wHcI0MN1OVL0KmLv0jUsqCYYQG3ndM2ulKT/Pr
         RSK/ykuojdAnYiq0iwArive5+0L0oJaERBy1PTKP7NG8Z7LKxbX758rGJr4CxaQHoWe+
         a4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795732613; x=1796337413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HkM2EQEzvjNoG6pAwPWdZludkX/JMg2ikfFDsmcQChk=;
        b=oyB/Bek7KOMb7cZRwe7VOM0AebNXgzAZNOoHZR7IBgqtnNvBkURW8lZFwfwF4bpRTR
         zpGx6JesyZqAgW4S8xwMpA4g2NUv2WZ1BgyLnbO/5nduJOr9h4iXJ68vdBsSWk7BovZv
         Z8+9dYF3o4F+cWdUJ2JLjAX11sJr8cOOCxYkknPlfEbWJlUzw+vgrDqHWGN7lQ1IBPWQ
         HCgftGJ9ms9vMpiTU5TJrtSK5OhYTBAvLfZsfcyOLdoHyS0MtMSdkVTChqVqw0zMjdGa
         Ze/UGdR4pyFfQEvLqHFMbXjHKVWOoMEwMzU5potGALDeXg81JOzKci63SrTFK/7XHJZe
         B5BA==
X-Gm-Message-State: APuU4Z/hQRirKAraG5s4nct6sJX7xtsGWPILA28BytfQalCRDQVtt+dd
	bCh4x//Fpeq5uw+1tq8FoB+W9jznIrKPMys8Rj8JaNz8oL/ASHTyRwHS+TSZqw==
X-Gm-Gg: AZFdTZdJrkY9sBxaCB3T+ployDu4spvtYAcplYXw1CKyRliHPh/OGxMt9sRq7KwNwIe
	kZ4wBoYtaQNI7aHhRfMvvub2fpsjweU9JqNJ28WjSRuStuc3VOGLMoiC4us3O4XN9YeuUOJBDJT
	cBmvPlZfhL9HvMsvNm6iCLkxoFuzjrUS4TFK3GImB1xNbPgoJzHC14BuEg1LsKjpCB4wDGIlJcX
	92Fr6qHwi7Kft07v02ghWA1sQVcrkc42x/bV0QSjMBXTzO5JqzeOJ+X1bjkf5+CL/EAnBp3tc7L
	4aSfQHoMQqw6I6CgfyM5v80rx/GNS4wJuszUZVcXNVkV4vzYBojB5HNeMhLKDN26b5W/BrxMDv3
	fEOf5p55pOOZD7CFWULDYyr/0V0/e4lUfpheIdg11xcuiI8dcLucDwNSlwST9XyufW6brX86bS0
	fIIXK20HyAxlUwwg4O5m9geHxqFQIj9scCNkspBlrRR6T2op/47T4yRnWKKohyXEHxPfPdX43Rq
	XJV4gv6JPrfPhuBTsA0cqdiuo/DJlBx/7H4jRH2HnKmhkN0jxiJJTDm5Pvsk7B2gBW4OstpL1Mx
	/YIlnDdbdhsO4jVmCEYIW8SNNGeSqSFgqaZK1D2cJSSGdjjHHYRk3s0YlpsY6v0HiWTCmZGoDZs
	IlFrTHFuJpmVKxvOGTMOHMqkZyFFSck8=
X-Received: by 2002:ac8:5707:0:b0:535:52c:a2e7 with SMTP id d75a77b69052e-55d76a305bbmr446981421cf.44.1795732613390;
        Thu, 26 Nov 2026 14:36:53 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349ec64csm201742136d6.28.2026.11.26.14.36.52
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:36:52 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 0/2] sphinx: add lexers for wic kickstart files and pydevshell sessions
Date: Thu, 26 Nov 2026 17:36:48 -0500
Message-ID: <20261126223650.3701672-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2026 22:36:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10846
Content-Type: text/plain; charset="utf-8"

Lexers for wic kickstart (.wks) files and for sessions in BitBake's
Python development shell, which the manuals show and Pygments does not
cover. No block names either yet, so the rendered manuals do not change.

changes in v2:
- keep only these two lexers
- rebase on master

Trevor Woerner (2):
  sphinx: add a lexer for wic kickstart files
  sphinx: add a lexer for pydevshell sessions

 documentation/conf.py                    |  4 +-
 documentation/sphinx/pydevshell-lexer.py | 48 +++++++++++++++++++
 documentation/sphinx/wks-lexer.py        | 60 ++++++++++++++++++++++++
 3 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 documentation/sphinx/pydevshell-lexer.py
 create mode 100644 documentation/sphinx/wks-lexer.py

-- 
2.50.0.173.g8b6f19ccfc3a

