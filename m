Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10020.1793617730946311584
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2026 03:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PkEGyGM0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so30060515e9.3
        for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 03:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793617729; x=1794222529; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fP0ocuPRVmeRGUM2m5Up1+tuWbmW9exUXqEfNOQBSfk=;
        b=PkEGyGM0GRn25jQvKcCJCveNA2KpA5yYwLJcnBOgJ6lEOnE9jY9nz1ia5wYpOYcDKS
         JEoMLrxURLDbKmhjOSEhdMsJp8aAX6sHj+KLGTGZ/GT9XVtgRhCVAM/GozKjk2990HmY
         5OS0XaHTiscX+Kb4c5VfhXQYhodatC1oYA/IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617729; x=1794222529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fP0ocuPRVmeRGUM2m5Up1+tuWbmW9exUXqEfNOQBSfk=;
        b=JrekmPRXLweZCni2TEqiNnUmeQLTzWKJHyzu825vvlqPF140yPLxDS2fWmm/vsRnx6
         AUveYEEqp+dqcIlr3rkp9MEH645w+FPTTJS13Z/Z2CgUHvDGsKfn6rkLprNsBTX1LYLW
         Mn8ghjObiY8TBVF7RB3KuUchx18ck1fcEfgArr79HqMr+mOyNLoAoe+8wLq9viQ/QD0x
         nbOBlFOWHmfqAVegaq3K025H9HK6cD5vl27aLK4Fdu8ADYVkoBBQ+mQuL4pxLhIbwNMa
         MXzq+UnVNik43RZ3A+eRL+k+6hyD4GaurTo4rlu4/Hs1sLLORO5QnSRcI0PfPaoMTHsb
         vO4g==
X-Gm-Message-State: AFq9FYKDGIGHCjM9rX/r1wNrQsmTw24fMCxR8IuqpEr+UvVv4hLseZi8
	uLU7PavWXb27tNU6XpXs4YnfbWMXn7RFE1T0ViFt1ZcUW9JAiUChlTPr+TAQVENke1VyttDR5x3
	jARNPJcc=
X-Gm-Gg: AYBFou2n2sYFzaqpYM2BOYAkdMgzVItduzcqSVhw8ShLFAghF5F8enb8BRoHXY33s5I
	clrwEHJH9N5k+6kQlgCrV+h114Tzws5g/RZcbuEnmTIrPklJXwB9Xv1nF78do/LiJUqHNeGn9HX
	pjmnw6UUzkYIWwyP6WBPRL6HLDIdW9P0TKaIN+ym0HKFwD5cLNKHuBY1z1KWnRl+BwV0zrD3BHG
	8CwN570XlpF4Xsw3OrAlzDpu2rGl/QXkDtS+4tJ7W6kzUKXeJI4qLbv+5nmHi/vTi4TEiHSQxhC
	oMzaFU+XqSJY9ECeKJ3YHbs7fAzTjXhvHTYxQbPY7kTUc4A0OAOIE8KQt82VBh8Ukq1+jZZIyZ6
	mliIY7QOGNIwi3RshAMBv0lqcP/g59fN370/X4gRckvijWXkKaTVPlKK+meTfym4hYmptx7qReG
	UVgoZAPogMWHQNEU9QavgzUDE53x62ELvnS8sEzhNUbBlOtOcf/zf+IPjDi7EvMKWmt55BX11+F
	V1vI49lqSGAZMb3x3QySz9jjT2VwDnFSlAF1B0adrM7RxxLacnZYGKyYl6J8mwMkg4wcPzmX03C
	eAb7bQ5b840V2wliBAHHwl0u0AMfOYIBCsU9IfQWjZ+kt+FfiY8jLXX4XDY=
X-Received: by 2002:a05:600c:348d:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4ac19234acbmr215454465e9.33.1793617728817;
        Mon, 02 Nov 2026 03:08:48 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a866:4584:45b1:5742])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9eaeesm19505407f8f.49.2026.11.02.03.08.47
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:08:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual/faq: Add entry about github pull requests
Date: Mon,  2 Nov 2026 11:08:46 +0000
Message-ID: <20261102110847.15588-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 11:09:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10758
Content-Type: text/plain; charset="utf-8"

This is an emotive topic but try and fairly document some of the pros and cons
of such a model and where they make sense along with why the project has made
the decisions it currently has.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/ref-manual/faq.rst | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index c1657d677..60e89d834 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -108,6 +108,34 @@ It is very easy to check whether a patch has merged by looking at the repository
 pulling and rebasing.
 
 
+Why doesn't the project use github?
+-----------------------------------
+
+This is not a simple question and there is no right answer to it but there is some
+background worth appreciating.
+
+Some components within the project do accept pull requests from github, others don't.
+The README in the component in question should make the process clear for that
+component. Github itself is a commercial operation and there are concerns about what
+happens if they change direction or decide to to discontinue it as there is precedent in
+the past for that kind of thing happening. Equally, there are open alternatives to it.
+
+The bigger issue is the model. Mailing lists allow for wide peer review. The people
+performing that review are extremely valuable with experience built up over decades.
+The github model doesn't really lend itself to them being able to easily see or be
+aware of changes beyond the maintainer accepting the pull request. That model also
+tends to focus on the single maintainer with total authority, which for components
+like OE-Core, simply isn't how things operate for us. Moving to much a model would
+alienate our existing reviewers and our community consensus approach to changes.
+
+So yes, for a contributor wanting to make a quick submission, github and similar models
+are attractive, but they would likely come at a cost to the project's long term health.
+They can work well for the single or limited number of maintainer model, and for components
+with the setup, but not for other areas which benefit from wide peer review. We live
+in hope that tools can catch up with that, we'd even love to develop them ourselves if
+we had time but sadly, we don't at this point.
+
+
 Building environment
 ====================
 
