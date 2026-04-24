Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE1AFB44B3
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 06:23:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15494.1777011822682456890
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 23:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UJmyvlSR;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso46076045e9.0
        for <docs@lists.yoctoproject.org>; Thu, 23 Apr 2026 23:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777011821; x=1777616621; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HdXKLmj5T4p38Jb4dmJTfHvYVEcWwUcS+/iRhQkkQKo=;
        b=UJmyvlSR8T0utLC8sGio5BjWvZipS8+K1STpATiXJBrobffUuHIcfsq6UtgA6z1KJA
         47LMHPr2FgogJ+f42EyESv9tXRxkcnV78joZsbqPThr/2J2QdiWvlDQQTHnVgx44yelY
         ZmTu2gCwaF8FfxeDwTq2TRwWXqJ+VGAJeiIQPCPzZFkpXdrQnxUPLBJ+7Bbm/Lsq1weu
         MKDJyElIrolpr8wzvexDDP9f/oXQ5yAlyYaVwV+UZVq/wv0rrvRKwIl5D06v3xHJ3+JL
         1AmByfV3HXS4gj1pM4G7p+E0+W/2agE0T+wjuedpl9JwQgeijbrgZkXKJqaPJnax/js+
         NM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777011821; x=1777616621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdXKLmj5T4p38Jb4dmJTfHvYVEcWwUcS+/iRhQkkQKo=;
        b=PWrlrjgO2MByDKAyqOv8QP1OLFUrrpbtMSOm0Ya3JZxovxeRvXS1XOCtDmJ6FuX1/J
         GAp1Si+yn2QHI+u6W4rPg7dklj78uBdlxzM07wtHJDttnVnvFiG5ueWTMubR2I2yrmHd
         V0IA5UGf2TZK2N8e+UfptbPUv/rvHxA3O0ShqCffU65IyN7wIqW+QXHeHUpceSjxaYww
         R5GRtG7a9Uj97+OxMtm0iC0XdnZnuktrlxx8SwU2hNFz9QWuxDKBARRCk9AQ2Y0z6TSs
         oeatQSxxL0NtaJyee+z7fyxvjkd89vAOuw55+nW3y/sicDR+bJgJJUH1D6KdlLTYHvbb
         N/fQ==
X-Gm-Message-State: AOJu0YxXkHR3A6v5pkC2+4NeQthiYYUww3fkhhaFmAYe7PyWmH7SUr7V
	H0OIqADboTI8Y4AX66CeMlhXpWrJS3Yq83CjPUhWFc5nhh9SemwhytqyYcLkP5GPprk=
X-Gm-Gg: AeBDiesVCpsTFvDSoFP3DPeII82j7NBtJlnzaW3oTLZIEbSXPS+ZajtYNgZ7Y/AhFn2
	5uLBlhkcNKui+ypKE1EEa1oMSr5s5w+bzniqQ7vnuFf8zF5b7DO7Sy/OdWYA0tYWOfmNrFe3TaN
	w9FsrHfb4/EFQdv7bnNyRfHHsBj6oxH3/fBQK6xWoUAotqOXq90ol7YWF4SLpURllg8YWxbkLsl
	d/4qjIOZ2UR9tqbJizYRJzxhdRfe7oIzZDTcr7wAONrr59KkhOEPDLvvq4IRG5/25I2pTMPuH2D
	kS3UPbhrNgHSXFmP+4dRT36GQDC+uoVNmH69pPEA+U0uIozHjRfJybb3q/oVzVC1L84hZ7DXmev
	N7qjBoNOAkkPwJQzcGTLb254GI+E7O7iO0XrwAXm0Qgk4Zhol6m4kIutaSuaITi8ik/ulCW4FzS
	8WOws146aIw8TkBR69nS22jE1DYbcevXTClecBKbKoHcrb0h1G7pmvWPIkBnTI6awMi3eS8GGsd
	zekMRdAYX1lvKEL8SlNeXRiAY5NLJeJ+NRqXEj94uJEzZ68D2gXXrfMwdvre1/NOm3042mfVw==
X-Received: by 2002:a05:600c:5299:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48a54514646mr225307815e9.21.1777011820896;
        Thu, 23 Apr 2026 23:23:40 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:8070:d188:380:d82e:7b6b:5e9:c77b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a5549f582sm81692205e9.33.2026.04.23.23.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 23:23:39 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Dawid Bijak <bijak.dawid@gmail.com>
Subject: [PATCH 0/1] doc: bitbake-user-manual-metadata: clarify inherit_defer documentation
Date: Fri, 24 Apr 2026 08:23:26 +0200
Message-ID: <20260424062327.820993-1-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 06:23:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9336

Hi,
I've been reading through the inherit_defer documentation, and granted my limited knowledge of bitbake,
I think the current documentation is incorrect or misleading in a few places:

1)
    The sentence "If VARNAME is going to be set, it needs to be set before the inherit_defer statement is parsed"
    seems plainly wrong and defeats the purpose of inherit_defer.
    As I understand it, the whole point of deferred evaluation is that assignments made after the directive are taken into account.

2)
    The examples using inline Python, e.g. inherit_defer ${@'classname' if condition else ''},
    are not specific to inherit_defer - they would work equally well with plain inherit.
    They probably belong in the inherit section.

3)
    The suggested technique of assigning the class name from an anonymous Python function does not appear to work:

    python () {
        if d.getVar('SOMETHING') == 'value':
            d.setVar('VARIABLE', 'someclass')
        else:
            d.setVar('VARIABLE', '')
    }
    inherit_defer ${VARIABLE}

    From my experiments, inherit_defer is resolved before anonymous Python functions run, so ${VARIABLE} always expands to empty
    and the inherit is a no-op.

    Is that the intended order and the documentation is wrong, or is this a bug in bitbake, or did I just get it wrong?

Anyway, just in case, the attached patch rewords the documentation to address points 1 and 2, and adds a note about point 3.
Happy to revise if I've misunderstood any of it.

Thanks,
Dawid

Dawid Bijak (1):
  doc: bitbake-user-manual-metadata: fix inherit_defer documentation

 .../bitbake-user-manual-metadata.rst          | 61 ++++++++++---------
 1 file changed, 32 insertions(+), 29 deletions(-)

-- 
2.48.1


