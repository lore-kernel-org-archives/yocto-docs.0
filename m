Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AF3CD3427
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 09:14:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10682.1777626877480703625
 for <docs@lists.yoctoproject.org>;
 Fri, 01 May 2026 02:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aYoJHP/b;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so11144625e9.1
        for <docs@lists.yoctoproject.org>; Fri, 01 May 2026 02:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777626876; x=1778231676; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=td9IdHMjP6jW0i0JxDWP2EwUzUYveDUjc6Y7wPLxDeQ=;
        b=aYoJHP/b4/Mbd1xA+kz1Kjg4/3bNod95rUZ6DxI79pSpGzOr4lAi8fFHfIwRXuNXq4
         KKk6jD+d7KvrTn2oLnkkUi/tz1qrEWu+sstmDPiIsJD+dWRJbt70U2G6TZu7bybkoMJk
         GVMf6oUrk/L8aGFF2x+cgLKHkYFe9M/gFGiuiycdO9P6pXRqLJVJYCV+surpQZGVWsG0
         EfiKlyzvo/tDBNlydnmfKOzRppoSwH34MWesXvJtZ3bLOUPXRH/OxOvP3TMHUgKINRz5
         gyDbMzOmljgl9SyYdQlv5sS9VAhNr/9QR3GRh42QvhRzT2shz7oIuY7i6oRmcbUxFHXU
         WPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777626876; x=1778231676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=td9IdHMjP6jW0i0JxDWP2EwUzUYveDUjc6Y7wPLxDeQ=;
        b=DHxzDmkEcJA+A28qa4Aj6TASyakCYCnidvQsOTicB1b4h5ia2B88HAlJVtyL7bGTjY
         1Ix4Y9PLRV+euWn6kIirm0E47KucqFyx2zqPZgIFHMMrHtLp8UwNsLMeaeULSWurDoEv
         yKDNX2BfVPjiyiMW8CDcI2slNeNhcTdHSla4WXmxLUiz6BCVJzcGPTxjJVdwfWdq7rwo
         whsg5E3WKOcGQ7XUO7l+yWKdJioqZF5TAiV851GAgANeBUHF03glN88biNN7XQy4YjSZ
         7srXk0c4cwMxK/kKj49QYVajPtG1cXdhtI9H5kGXgAgJVJDUEt1EpUbKvE9UUG4US4MC
         Ac4Q==
X-Gm-Message-State: AOJu0YyXdj2rmCuhmaCxC0/XunSJXNmlBOhK7ynQYUBxMv5whrjM7V+d
	b0q0GpRza/A4xVtC9eibjNtArqv+wAt3Cj5iZw4OVND4yvw5hpseiUGh
X-Gm-Gg: AeBDiesA04fxY0l0VUoQWozyiKd0LgFNJ7t4QUFE53Yoc0NXlgsnsOzaO0bNNYcQZik
	m13ZhUBbQ6gBDvBoJ9dtCLDwmnxoyEd8FKt3Z2/A2aG+lZrXg0+T3AfspJHJqNqlZFjXDbqphdH
	94SNLKLpvRIvkT/AHjQmA1IRJ+BI4ZSfrOzzfdCwzXU4VekcgygS2O0GiludYiGek0OfbljmApQ
	3+BIttfjt9H9SCmHPcBfrz/kwm14pSjpol011JZGRnLiwEouHNE3ZBniGEek+KR/eQHay4azGSa
	5uULY3pyzEXJ/skb8VImNu4Take64XFTUf3SN9G3xeUiRh6eLx/4rUj6Rs1QgExCAqGqrwhG1UI
	d983PtXcN3cH3seNSiyqAwEatmakgHKAhKf8HSlnSL5G2uflvV1qw+/0AthW94RxQc2OmyqXMjM
	lzOeJHBkBLUa8zCI1GsLzoRS/0zK3U+vocDRSrQulldqvaKNr6q4H5f5addB6xe5cp91gz2q4ZW
	jsXLf/pJn/xv0nTZqx2qTwqaztuWMlucyLR8HSDKcXBEtoNsONuuQmLEv1CT5M=
X-Received: by 2002:a05:600c:3e8e:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48a86069e04mr83843865e9.9.1777626875858;
        Fri, 01 May 2026 02:14:35 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:8070:d188:380:6a5d:7450:e8b3:758])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a8fe953besm12097955e9.2.2026.05.01.02.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:14:35 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	quentin.schulz@cherry.de,
	richard.purdie@linuxfoundation.org,
	Dawid Bijak <bijak.dawid@gmail.com>
Subject: [PATCH v2 0/4] doc: bitbake-user-manual-metadata: clarify inherit_defer documentation
Date: Fri,  1 May 2026 11:14:14 +0200
Message-ID: <20260501091418.76994-1-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 May 2026 09:14:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9388

This is v2 of [1].

The previous single patch has been split into 4 smaller, independently reviewable patches
as suggested by Quentin in [1].

The series addresses a few inaccuracies I came across while reading the inherit_defer documentation.

1)
    Drop the claim that "If VARNAME is going to be set, it needs to be set before the inherit_defer statement is parsed"
    which is wrong and defeats the purpose of inherit_defer.
    The whole point of deferred evaluation is that assignments made after the directive are taken into account.

2)
    Drop the anonymous Python example of assigning the class name from an anonymous Python function, which does not work:

    python () {
        if d.getVar('SOMETHING') == 'value':
            d.setVar('VARIABLE', 'someclass')
        else:
            d.setVar('VARIABLE', '')
    }
    inherit_defer ${VARIABLE}

    inherit_defer is resolved before anonymous Python functions run, so ${VARIABLE} always expands to empty
    and the inherit is a no-op.

3)
    Add a short explanation of how inherit_defer interacts with conditional overrides, and rename VARIABLE to
    VARNAME for consistency with the preceding code block.

4)
    Move the inline Python examples up into the inherit section. They work with both plain inherit
    and inherit_defer, so presenting them only under inherit_defer is misleading.

Changes since v1:
  - Split single patch into four
  - Shorten the override example explanation
  - Drop the "footgun" example from the previous patch

[1] https://lore.kernel.org/all/20260424062327.820993-1-bijak.dawid@gmail.com/

Greets,
Dawid

Dawid Bijak (4):
  doc: bitbake-user-manual-metadata: remove incorrect claim
  doc: bitbake-user-manual-metadata: remove invalid anonymous Python
    example
  doc: bitbake-user-manual-metadata: explain inherit_defer example
  doc: bitbake-user-manual-metadata: move inline python examples to
    inherit section

 .../bitbake-user-manual-metadata.rst          | 47 +++++++------------
 1 file changed, 18 insertions(+), 29 deletions(-)

-- 
2.48.1


