Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFC5D1A45B
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 09:19:18 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.7550.1728724755278958097
 for <docs@lists.yoctoproject.org>;
 Sat, 12 Oct 2024 02:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OeFWXpy3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d49a7207cso1587868f8f.0
        for <docs@lists.yoctoproject.org>; Sat, 12 Oct 2024 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728724753; x=1729329553; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QpHknmR+9I8EfRzQ5sZP0Nt5GJdlSA5dHZMMYNWi+jA=;
        b=OeFWXpy3gu0wUPCTGIkrA/xmdXJxnZ0PGCgTTycxXQfceDYlccHf9Hwpw6JnfInC9T
         O5bnEvm/s8fWSAiNRiwL5T20mTXGC/MHYzc1ZfkBMmJJlwtajhMN9tALxcQe/BhcgRBU
         F6BdBytrCYJtNyr7mP5VJJPSIXtXu2DBpGMRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728724753; x=1729329553;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpHknmR+9I8EfRzQ5sZP0Nt5GJdlSA5dHZMMYNWi+jA=;
        b=oyCoKlwyh4GEXWZobnAJHI4H8g8wmi50siSg9qv4VUGxyO8bxPS98cz3iLNzPydmxJ
         k8MlKWN+pNgwOE/ujWIptFrEAPPxeP+09itGDY3fUrv7L/+32P6wlGyvqL9SVgA0KHFN
         m8j+pDDrKhI1neppjx92enP0smaUhTedR6K5vFnqhpRNO9g0wtXxGmd7yzcRr3xDouXo
         +NHKhdZ6muab8Cm24Xygf8NMyTobprUff7adAmtm0A4xzF7h2EZ910kkAZg7nbEu+KKY
         mdylzsDy4jk3K1jqXQ9Z85T5vXqZVQY1KDwoMANRkE0+aNGtDlOIXG+f70JJftbWMRAB
         JSVg==
X-Gm-Message-State: AOJu0YwDLlDBfBcPSPGjrVLtGhjzFlmA0PmJaoxXIep5nIT6S0NrtfpZ
	a2356T6UB84vgLXyUtkIAvn5OWTYAUaIfjYZnTgWTWcK6V0jBoRUr/Oso3IIaRS15V9iucKb4LD
	u
X-Google-Smtp-Source: AGHT+IHDu5nV5wpu84LjB2mwIwbrWkYE6L6C5SeRIiD8wdRBVGq02MO+8Em8luBbRpoUWnHy3fWNSw==
X-Received: by 2002:adf:f304:0:b0:37d:4fb1:4fab with SMTP id ffacd0b85a97d-37d601d21bemr1199213f8f.57.1728724753468;
        Sat, 12 Oct 2024 02:19:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3c32:983d:58d3:a830? ([2001:8b0:aba:5f3c:3c32:983d:58d3:a830])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a859fsm5874445f8f.2.2024.10.12.02.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 02:19:13 -0700 (PDT)
Message-ID: <3019070797186fd40c2b71959ed6b995660a790f.camel@linuxfoundation.org>
Subject: Docs build/workers need inkscape?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs <docs@lists.yoctoproject.org>, Michael Halstead
 <mhalstead@linuxfoundation.org>, "antonin.godard"
 <antonin.godard@bootlin.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Sat, 12 Oct 2024 10:19:11 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 12 Oct 2024 09:19:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5473

Hi All,

We've seeing docs build failures:

https://valkyrie.yoctoproject.org//#/builders/34/builds/6

The issue is that inkscape isn't installed on the workers and isn't in
the docs buildtools tarball either.

I'm reluctant to start requiring installing inkscape on all autobuilder
workers as we try and keep the packages installed minimal for the other
builds.

I'm wondering if we should just pre-generate those png files alongside
the svg sources? I can send a patch doing that...

Cheers,

Richard



