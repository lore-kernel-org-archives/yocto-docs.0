Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A52CD3425
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 12:32:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13237.1777638720545832240
 for <docs@lists.yoctoproject.org>;
 Fri, 01 May 2026 05:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oEyK3Q4F;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so1055506f8f.0
        for <docs@lists.yoctoproject.org>; Fri, 01 May 2026 05:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777638719; x=1778243519; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQMDdZOzY7Chcp0qUd/nLeaaFuTg1icdyJdB9wofvKE=;
        b=oEyK3Q4FMyhxyfGjMUThVPjT7mFQvxNFqlRj96x2BmwfCaVVv/sFdUutRyn8UTAmCq
         45ZQNn2eYwRyUnIcNEznMG+UTmnGTVyRrD2AzyzkJAOoWfJ3dW2l7732laGS4e0vvI2s
         QTfOn1CVSYhEz3RV1MxdX3MItXlTlTpK/VPJFJgS4KX+x3dPCORT3DP+XH5yGHZWc3cP
         TFd7+g2Sj+ABoEkgS4N+fSd2ebZjAEcuSmntxnuYzRRsy6K9M4OosP2Jth87ATCRjARm
         BsiNOSqyRzTJqe7oDkWsFgavcI5w89noKwO/9qvS7LwC9vLBZt+TcrCrttMSEnGtyb1u
         oV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777638719; x=1778243519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQMDdZOzY7Chcp0qUd/nLeaaFuTg1icdyJdB9wofvKE=;
        b=WPd4wsHKW6oP4FHF4q+SaR+OvyyHg6WnbyYL+NDr6R8nbykL0c75m/ybQR6WSLu715
         xYvSIL75PtfzU9ZVPs9vVNVhlGM1ztN5CP9hSJ9XMvwA8Qz1RRTFYTgeri0+aD8na3rx
         Dy8nYRM8YoLnjZVDMeyJlTz1D9YTYmhCYfmH5wmvJ9lVSvuulGQOC1oupKeR3a8N7Pa8
         H2NdP3/aB7YpzJnfkVPAj/6tovTCnpsb0gIyBlFPmsbROaoF++ItmMD4WP26xsGSZixS
         SLQSDcUWx9bMJFcDXNTiN3lRlQ8FHN1KNBWoWdYP8xzbj5QQARGbR1eLjzOOdL/sxitM
         fZSw==
X-Gm-Message-State: AOJu0Yw6vMXur4CVGIPRXiPrPAE3ILp9F+ar9fQLu+RZGtk2QnzC9164
	4QzVGiolpK0lu1c1RlNuTuuxeEbTAAiqgxbAxAsQlePNe+DFUy+hW1ev
X-Gm-Gg: AeBDievyntMBKlrS3QGcnmgT0EZIQwgWUXdY+riiDD7zlZ3R4DRCSNdE7A5OW3jcskm
	UOXkTVOa/rsa99GuHHc7X+G+JB4BlxUtiptqwpNWNDdb1e+dL7+2uo082zAJSZwA8g0ABfsex9c
	XKjPnrqwAomBu4W0PnwEsE2EaSWgI8FTI/z+s0VT+JRTklUPFHpStsvfBuc+t16qHe3QjDne0QP
	gnn5/L8jSfGaY0j8te+FNu1nSxVnsPnmocI5vxdrsUakyPFRF1MSKjcM2TIJ+etwPpm+HB9Y7rm
	fX/+LT5hqGZGHrSD4cqKALPRw04Nx2bD3qLxH0VhSFeQIu2/FyiSbChnOVxkxkJGoZeYzsHaVH7
	wFe7xMKvKDzgYz8/wtsoPl9FL9DkZpeoTaD6W71l4xT2xRMv/utIkepABI5O14aVuCCmA6DSm6l
	we3NBSfV1dGzBaMW4tvsZ0scW8/GwuEl21Cf3gdXrHiZRq7PqN7yjeu+zn/XrBGX05iycePKcdZ
	2vS7skxtIs9sY8GOHve/Fbd9BuGiPJb7CcYtBD1ViGlniRz13gT4xW0qi/Q3VB1kuVnHX5nEA==
X-Received: by 2002:a5d:68c6:0:b0:44a:fa76:5193 with SMTP id ffacd0b85a97d-44afa765260mr2003353f8f.12.1777638718754;
        Fri, 01 May 2026 05:31:58 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:8070:d188:380:64c4:4eb6:9167:a4ec])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-44a986aa3a5sm5161703f8f.26.2026.05.01.05.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 05:31:58 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	bruce.ashfield@gmail.com
Subject: kernel-metadata: KMETA_EXTERNAL_BSP(S), tree preparation, and scc semantics
Date: Fri,  1 May 2026 14:31:57 +0200
Message-ID: <20260501123157.95088-1-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 May 2026 12:32:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9393

Hi,

I have a few questions about "linux-yocto-style" kernel recipes and the kernel-metadata machinery. 

I've read the advanced kernel-metadata documentation [0], the previous discussion at [1][2], 
and the patch that introduced "KMETA_EXTERNAL_BSP(S)" [3], but few things still aren't clear to me. 

My current understanding of do_kernel_metadata() is:
1. 
    The BSP description '.scc' is located with the (KMACHINE,LINUX_KERNEL_TYPE) tuple via 'spp --find -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE}'.
2. 
    In the default flow, that BSP definition is fed to 'scc' only for the config run. The patch run operates on 
    '${sccs} ${patches} $KERNEL_FEATURES_FINAL' from 'SRC_URI' and explicitly omitting '$bsp_definition'. 
    Any 'patch' directives reached from the BSP '.scc' are therefore skipped, on the assumption that those patches are 
    already committed to the kernel branch being checked out (as is the case of the 'linux-yocto' git tree).
3. 
    Setting 'KMETA_EXTERNAL_BSPS = "t"' in the recipe, or 'define KMETA_EXTERNAL_BSP t' inside the BSP '.scc', 
    add '${bsp_definition}' to '${sccs}' for the patch run, so that the BSP-referenced patches do get applied.

Assuming my understanding is correct, I have a couple of questions:

1.
    Neither 'KMETA_EXTERNAL_BSP' / 'KMETA_EXTERNAL_BSPS' variable appears in [0] or in the variable glossary, 
    but both are part of the public contract of 'kernel-yocto.bbclass' to opt out of the "patches are pre-applied" assumption. 
    Are they undocumented on purpose? Or would you accept a small docs patch adding them to the advanced kernel-metadata page or variable glossary? 

2.
    The Kernel Maintenance appendix mentions that 'kgit-scc' in 'yocto-kernel-tools' is what the yocto-team uses to construct the 
    'linux-yocto' git tree from 'yocto-kernel-cache', and that "the steps used to construct the full kernel tree are the same steps that 
    BitBake uses." 
    For a downstream user with a vanilla kernel tree and a kernel-cache that defines a BSP, what's the recommended 
    way to generate the equivalent branched tree (so the default, non-'KMETA_EXTERNAL_BSP' flow works)? 
    Is 'kgit-scc' intended to be invoked directly for this purpose, or is 'KMETA_EXTERNAL_BSP' the expected path? 
    If you could point to a concrete kgit-scc invocation for this case, that would clear it up.

3.
    Section 3.6 of [0] documents the the branch directive as "branch [ref] - creates a new branch relative to the current branch"

    With 'KMETA_EXTERNAL_BSP' set, the 'patch' directives are applied as expected, 
    but the 'branch branchnaem' directive appears to have no effect - patches are applied on the existing branch rather than on a newly created 'branchname'. Am I misreading the intended semantics of 'branch' here?

Thanks, and again I'd be happy to turn whatever clarifications into doc patches.

Best regards,
Dawid

[0] https://docs.yoctoproject.org/kernel-dev/advanced.html
[1] https://lore.kernel.org/all/CA+4=imafR6ncjuC9UOgR3PBPS7MR7H5fo42vn0M9tk7=GSFUoA@mail.gmail.com/
[2] https://lore.kernel.org/all/20191219183759.3122153-1-JPEWhacker@gmail.com/
[3] https://lore.kernel.org/all/20191220152117.49850-1-bruce.ashfield@gmail.com/

