Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60190C46CD3
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 15:38:16 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.46437.1702913888965518215
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 07:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VR64nN6M;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cc5e48779aso22148921fa.2;
        Mon, 18 Dec 2023 07:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702913886; x=1703518686; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eqdtF9HdxwqBiu0vp0/0IloTIZLOgy4TyyhZULNGO4s=;
        b=VR64nN6MuZsbVNv0VrXw2PYAn6TQlTycq9U8kRROEP0oUG1+DzhQ51XpnH0m4zNcIn
         uKTGeBkpMEqjOUxj8hljMWV4Qg0rpP6ATRfUtEl3pl+VFnjvOSDJ4u8I6ESiR3sPNsiS
         zcxPtbtCF17X/x166TMuAXl+CPAJq/UT+M/HC4Iulgm++yFEyE7lwON4l7ao+FSEQecF
         2LER2Qt8+gccYH8DExhzr+PkO4GjmJIgDvGKyHT6ZeUflpWxcJl3VEjgU+P/eQsLF793
         BjMdn2umucX3wyVE6nCwEfwo0z0Vt6+d+AyICnVEVQkIr/L40elGwKKM8Ppv9TqjAnZV
         e1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702913886; x=1703518686;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eqdtF9HdxwqBiu0vp0/0IloTIZLOgy4TyyhZULNGO4s=;
        b=B/kwec8DfQI3x1hRmLoD4c5WFSpL9QbbEbo28gmifgJWS7prOBKAvgz7mwhWyT6AH7
         N7eHIfegjK1nA1IsByIQOQBptzjh7KjkijUZPpNRbVINSkm5JwstIDCb6N/LZ72EE4T6
         gIndWeM1cSBxLEVZhZshWN+nF6yCYVPqM6dgxmBqfVMroyfbHUN74tZmzKdijXHNIKxr
         9jPidjT2uJtixLBfgCYw2tAw4TvnbTDt/A7WCDBTJp/xe6L9FcWPsLtJ6Re8p8lxDzTw
         3aAmBwRIIrXnznkwJpIwA7LSoXa49psS4IGpFYOGB0SN1i3MyBZ6n5K3phOI/uByotJs
         ajxw==
X-Gm-Message-State: AOJu0Yx/x2VSy4azMQEfLDHsr3VIWsngUkWTpolzWWxNRc+eQNZS7XT4
	AfJq4A+6Jse8x7GtrSN0stEEz0DlUqE/RPfwAFXmWGdv+0A=
X-Google-Smtp-Source: AGHT+IH23DjPMJO1nGVHIRTogS0Gp/HFlhoZaYt7gkFAnju4D858r4v/JJtEenCiTTl4vTg1/iclM37HaQk4NzGxuvI=
X-Received: by 2002:a2e:7808:0:b0:2cc:6809:bb9a with SMTP id
 t8-20020a2e7808000000b002cc6809bb9amr538369ljc.26.1702913885861; Mon, 18 Dec
 2023 07:38:05 -0800 (PST)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 18 Dec 2023 16:37:53 +0100
Message-ID: <CAApg2=RSBvoPrS4F5ZOxtwEN97188huhA0LSQ_WXT3vocarb5g@mail.gmail.com>
Subject: Documenting security advisories
To: YP docs mailing list <docs@lists.yoctoproject.org>, yocto-security@lists.yoctoproject.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 15:38:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4685

Hello,
When discussing security processes, there is one thing that we haven't
set up for now. This is, where are we going to put any possible
security advisories affecting the Yocto Project. The need to release
such an advisory could happen one day.

A security advisory describes in more detail a single issue or a
series of issues. Gives the context, workarounds, information about
the version where the issue is fixed. An issue from an advisory is
likely affecting multiple versions of YP, and might have different
fixes for each version. The advisory will be referenced in the CVE
issue, security aggregators etc.

Where can we put such advisories:
* mailing list of the affected layer/module
* general documentation in "Release Manuals", using a separate section
for advisories with links from each of the affected versions? OR a
separate manual section?

What do you think?

Kind regards,
Marta

