Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15086.1793633376246304716
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2026 07:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GPJeyVo1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so21129545e9.0
        for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 07:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793633374; x=1794238174; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xi+NB+h/2eHdLVlVM+MqK2y2WRd9g+awMQ1LzN/y62g=;
        b=GPJeyVo1bNE23wkyJttXrGbRh+rWw254fbcwg8L4SN7/Urn5JXntoxCa82lFC0Dafo
         P2JZwLU4cSIBlEFP/l36EC4dkeafob8vs8XkrQuQEm+UdUF1sdvNsGEC9luWiysNGWcO
         0g9JCT9F1O9HJ+r6RsXLRfYWgF3MNb48x3ids=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633374; x=1794238174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xi+NB+h/2eHdLVlVM+MqK2y2WRd9g+awMQ1LzN/y62g=;
        b=tOAde2eYryqWlQH7MtH6+WttWCBxaAlQ408dOb2+rMAAjCnMUvzYf9Hw/jTY+mjg+z
         fiI8XfrjSHPpOzXgvwbK7OM2oOv+sCHY6KrGAP1PED3BGx9NSKvzpnp6mmU9w60smvgL
         BEdxwmdKmrisPSo1H0hvpNHPCQN8I2TmMLjFbpD1OJ+iiTsiTL2kwR5qAJhHAWjJlzun
         xn3ggpNxUyvs/NFYMwdBtComucynCoNVHlhPHN5W/KD3B1IWLNqt2KNhN6ENJcKi/XxB
         n2rt8/4kmYbNZy/P118/WmOmF1d6RwgBTJqbvukwLA7CnjosfIkF8W/XtZpuf+HA5FFE
         PJww==
X-Gm-Message-State: AFq9FYI4iHQQyPGfsqY1tKD5X+9AUpnV896/Jo2uetOg3fDiITJEO+OK
	cz5i1hZLBy2SNGd1bTbeUk/3H94OZO0V1C8qNq3jA4R56kyx2rBODTDI/rxVgQ7SBiFHI1BLvHQ
	40e5VcSk=
X-Gm-Gg: AYBFou2Vsg/nGgTDmT76jS6xBaB2Hq8f7Lo4hbfsTS4I1iOGuZvwA04VmIm3ylX+cVW
	66I6RHYshLxj1K1uxrrlpbQqaWcBrVLEKmhi+vZtas35T2dMK5YRkqoH6WiC9mafT+IZLw6hbp/
	PtG9t43DleSz/QFzlHu/5+zYMFkfDbjPP9MruQSSb2RJnuTYeIJxidrboe8SMGKJFnPyARmsfct
	lARth1gOT+EAX/Sm3my01LiTiQ1dZBk5W6MsJONMQV8CxW0nHlcKbC0+xuBSdQUR5ahoqV7xvaY
	IJ8tTVOU2ud4+OzWho03Pd2ZGL/6owuFX8+C9svEFt7jhj/fpAg4ecd7nr4C1MnXrXc6uVTd6RA
	e2VCI+yib3AOCUIwodb05c+xOW18JrymoPhxQeMiu/07AQEbZWcJrLMJk1+9flcGeWstRWN8v9F
	Jq5ffvXsjKbSZNx1La9vYNdMtgwA9d8vyKbSC5/KTyeiCXXebBff+N5yII1fIMUmtpNZadUFiJX
	dcRt7AmVjcx7ohJip7Q58sXA+0D97uAz07FqyVcpMyG+f/B28HzrI5evUSwAv+eb6nu4U9n0Hjc
	IFD1CJ1/sWRePboC7ISiwXudYT5XYlxElMi7uUFZBxBoqP4qzRZ/lW0Yn7E=
X-Received: by 2002:a05:600c:198e:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4ac1932a23fmr247800765e9.32.1793633374120;
        Mon, 02 Nov 2026 07:29:34 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a866:4584:45b1:5742])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723b4sm21187512f8f.17.2026.11.02.07.29.32
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:29:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2] ref-manual/faq: Add entry about github pull requests
Date: Mon,  2 Nov 2026 15:29:32 +0000
Message-ID: <20261102152932.846754-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 15:29:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10764
Content-Type: text/plain; charset="utf-8"

This is an emotive topic but try and fairly document some of the pros and cons
of such a model and where they make sense along with why the project has made
the decisions it currently has.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/ref-manual/faq.rst | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index c1657d677..27733a5d1 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -108,6 +108,41 @@ It is very easy to check whether a patch has merged by looking at the repository
 pulling and rebasing.
 
 
+Why doesn't the project use GitHub?
+-----------------------------------
+
+This is not a simple question and there is no right answer to it but there is some
+background worth appreciating.
+
+Some components within the project do accept pull requests from GitHub, others don't.
+The README in the component in question should make the process clear for that
+component. GitHub itself is a commercial operation and there are concerns about what
+happens if they change direction or decide to discontinue it as there is precedent in
+the past for that kind of thing happening. Equally, there are open alternatives to it.
+
+The bigger issue is the model. Mailing lists allow for wide peer review. The people
+performing that review are extremely valuable with experience built up over decades.
+The GitHub model doesn't really lend itself to them being able to easily see or be
+aware of changes beyond the maintainer accepting the pull request. That model also
+tends to focus on the single maintainer with total authority, which for components
+like OE-Core, simply isn't how things operate for us. Moving to such a model would
+alienate our existing reviewers and our community consensus approach to changes.
+
+Another issue is that GitHub and similar forges use the Pull Request mechanism,
+heavily leaning into reviewing and testing the Pull Request as a whole (e.g. the
+automated testing (CI) only runs on the last commit of the Pull Request, and
+per-commit reviews are painful to write and follow-up on). Using GitHub or a
+similar forge would require the project to completely change its reviewing process
+(or have two wildly different processes which would be inconsistent and confusing).
+
+So yes, for a contributor wanting to make a quick submission, GitHub and similar models
+are attractive, but they would likely come at a cost to the project's long term health.
+They can work well for the single or limited number of maintainer model, and for components
+with the setup, but not for other areas which benefit from wide peer review. We live
+in hope that tools can catch up with that, we'd even love to develop them ourselves if
+we had time but sadly, we don't at this point.
+
+
 Building environment
 ====================
 
