Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4190CD37B5
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 10:44:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9795.1778323432917990809
 for <docs@lists.yoctoproject.org>;
 Sat, 09 May 2026 03:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ka0TTuT2;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso26828245e9.2
        for <docs@lists.yoctoproject.org>; Sat, 09 May 2026 03:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778323431; x=1778928231; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kUFCdRUkuEzjdflg14UBcBVEsLEgF2wLJXC56CSYySc=;
        b=ka0TTuT29tpLho/8eENcZBQR+1LGCAD1izIv6RlCSzrxA+WfP/mKsBEJYFd9z/cpiK
         otUax7WQ34UuZDOIeXQs1vil5NfD/quzwqo7FE5rIROVeXg0ReD6gevVwji1jviBC5iC
         InxntImkeQVnNJz3w7XMKywUetBfgrbJw+H0DJigSW/wpU29amJzpA0hVOP9tmEczwIk
         qMccBePYQzdmQtFytlRmtDj1DxS3D3ggG1h1rKr8MfumyxATCs0yfetgoskjlfXRIwKA
         D5igcoRbNyKAgMF7YXVNLNPwTyQNDs9Ib3AZ9sgYW5PTPHVJjPHtu+m/e5geCP9Rvlfr
         XU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778323431; x=1778928231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUFCdRUkuEzjdflg14UBcBVEsLEgF2wLJXC56CSYySc=;
        b=J9dL0kXkByo6C4pHDlk92kf1mAtecDfCCjjD8DPanQkZJwoUPhk7SeqdcJh9ZKBzCc
         QY9rVKetM2gyUoHzMu4U6ZwWQg9cm0i+G86pEYhQPPtUpM0KbadOQBnIJbOFi3+jEKG3
         MzlmDR+yE+SSBoqirHVxy73hcUzLRbrNIOPAZqY2365OnM/8vZ9khIHorETuENrJqe2R
         GXZElBAMZZYotEPiYh3e35I4QuAK4yCKXlr0JG9rcrxhq8IfRmuCMtqWmK7bnQmzaQfy
         6Xs3R7xGrw7yap7h0n4h1+QaK7SjsHk5WKQIJaBK/3kNgRW27kE9Ptu/ih8UYLMyt7An
         IteA==
X-Gm-Message-State: AOJu0YxuUkPYi5Lt0WiMV7xTgiJyQY7mzl97e/a8mHlVouJRJ9v5TaTJ
	AmDxLJDyJAzd1kHIY5zd6UT2z2VjCIUBDhtOV71Qb22RH+Jcm9Q3toVk
X-Gm-Gg: Acq92OGybL8bEiwq6yMPvhPTEDASl+jFSFCXX96QMHW6uk65pv2re7Antv12wRkU37T
	E+c+d4fEwgRPibXxh+XCceNRauMh6x4M4K+lfBy06FYo1whZSYFvPMmidmRPHRce9Tsews+os+o
	crBKR4s5E0qYae+AH/qnGsqypR6YRpNmiTVSzr2zuuthB0JCIOI/83z9RPLAMuK2Bme1M/LalCP
	JPQuOUAt0nOKFJLNVMpg8YjhV76qO/4gLER9Xe/xeiHyYIlWIPDjb4typRpRRuzmQStPYRgxVKJ
	6hJzN5x/MHcFD4a8crwv5KTBZQyHnvnh0Svzw76v7q0ACxHDGlKEVZtvFyGsnaoDvudmwgDeK52
	reqgiBnCTHDKNx4cPSmdzYHhA0XWwLV9ojfXjoJguGUPvQzxcJNVfRVMyn5a3yMyeeG2u+qQd6I
	PReJr9nArEz+7CdbNcu+rQ2GfC1HHB2jlTw8fSIq47aY27BJjsKM5jY5xlVff/KUlzn8tSIzkli
	o/9RxUmNQPY9+2VXP6oj2V6YKkEmqbx3mmKgHooPAAaN2X5b8JYZx7UfFFOozqWCQ==
X-Received: by 2002:a05:600c:3548:b0:48a:7aad:4425 with SMTP id 5b1f17b1804b1-48e51e097fcmr245675045e9.3.1778323431136;
        Sat, 09 May 2026 03:43:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8070:d188:380:b100:f430:86bd:b50])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e6d895781sm38837255e9.0.2026.05.09.03.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 03:43:50 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	quentin.schulz@cherry.de,
	richard.purdie@linuxfoundation.org,
	Dawid Bijak <bijak.dawid@gmail.com>
Subject: [PATCH v3 0/3] doc: bitbake-user-manual-metadata: clarify inherit_defer documentation
Date: Sat,  9 May 2026 12:43:04 +0200
Message-ID: <20260509104307.26698-1-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 09 May 2026 10:44:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9422

v3 of a series addressing a few inaccuracies I came across while reading the inherit_defer documentation.

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

    add a warning explaining that using a anonymous python has no effect
    on the inherit_defer

3)
    Add a short explanation of how inherit_defer interacts with conditional overrides, and rename VARNAME to
    VARIABLE for consistency with the rest of documentation.

Changes since v2:
    - Link to v2: [2]
    - Picked up Quentin's Reviewed-by for patch 1 from [3]
    - Applied Quentin's suggestion from [4] and added Suggested-by:
      Quentin to patch 2
    - Renamed VARNAME to VARIABLE as suggested by Quentin in [5] in
      patch 3
    - Dropped patch 4 following NACK in [6]

Changes since v1:
  - Link to v1: [1]
  - Split single patch into four
  - Shorten the override example explanation
  - Drop the "footgun" example from the previous patch

[1] https://lore.kernel.org/all/20260424062327.820993-1-bijak.dawid@gmail.com/
[2] https://lore.kernel.org/all/20260501091418.76994-1-bijak.dawid@gmail.com/
[3] https://lore.kernel.org/all/aff89f3f-7bc6-4634-b834-1872d559c8e0@cherry.de/
[4] https://lore.kernel.org/all/fec735f6-f87d-4036-a013-384ed7c54701@cherry.de/
[5] https://lore.kernel.org/all/a3a8a5c5-81c3-4764-aba6-32c84ce55a7e@cherry.de/
[6] https://lore.kernel.org/all/7558cb67-4ee0-4cde-9d43-4ce2b8d1ef5f@cherry.de/

Greets,
Dawid

Dawid Bijak (3):
  doc: bitbake-user-manual-metadata: remove incorrect claim
  doc: bitbake-user-manual-metadata: remove invalid anonymous Python
    example
  doc: bitbake-user-manual-metadata: explain inherit_defer example

 .../bitbake-user-manual-metadata.rst          | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

-- 
2.48.1


