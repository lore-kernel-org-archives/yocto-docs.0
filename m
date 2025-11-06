Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4EACCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 13:14:38 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15030.1762434874150422579
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 05:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bSTAfYmI;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-87bb66dd224so10801186d6.3
        for <docs@lists.yoctoproject.org>; Thu, 06 Nov 2025 05:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762434873; x=1763039673; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1w6rgRiDt8bMNENFyDkUIeWiNr4j2ORO1QuHCsH/MpU=;
        b=bSTAfYmIna3KjrjY0Xi0Nttj0JaQafA6k3SK0Mu/EmsTg55jBN4x+tkVFjuWrdDu5P
         9quFe3I7pwqkbYRVB/f6QPNzYazCE1eMfMcl3+Mm6diQHPiz+hPEUeVEDl6cnHpnVmGk
         ehIGpBSlz9+vOP6n88rIcVl0is00QYmoxCCUZTOU1kLcf+9CAAm6zAqtFC9BVcZiywxr
         F+H9hw64C/pgv9a+pEW5Zq0nXsDZcpfdMocxhzYw4C/6MWf4SbRXhgqexx9ZqLQWFDRP
         jOXA37HK4oUpTwUdnSwOzqsW2HJ8VW2ExgTOlvs/uQb9ozj8Cmuxdy6zC6xY13DR1vi+
         LH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762434873; x=1763039673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1w6rgRiDt8bMNENFyDkUIeWiNr4j2ORO1QuHCsH/MpU=;
        b=UciN4wvoGQ0q/JxdmnTYwtR4tP0WfsGY8gneZ8AIlxPbQdLp9DqXVZEsq8TFRNXTHP
         MtOsSOf6NvX4wks0peqKEee81BEzKgPydHVNq0lelJXsarci9j0+/W4u0g8S5NbJ8KI7
         X2pGpfQ/l8Idp16NF/sn7nkLtKEiAelj5qcOfNiizpPrLeNLJDORvbm1M0ny/D13GZ2T
         1LXQ12hEV7CHUbOSVpEeViuKaPRtNc0mT7dIP3CxA3KzOfuyVhb/IRiteUTKgn/4Tijt
         M4XWBFedMarOGbKakbOBmg1C0DZwVyIGzZCUH9Uyb1rfNpQ2xDZshx4sT+nXN/rZbL/F
         XrBw==
X-Gm-Message-State: AOJu0Yzo2q8PDzOgTod6164Km+doi0MMq3V9jnPyLVWE5+AuDQKprRVm
	H+3yOcmiopQVpa25cCHvlhBQyYf/pgnuC5rK40183XxxakIWTsrm/sEcmWdshaM8KV61v3UfmfD
	CEi9vfmEj6OziImNOSvVjPY3+ZCjIMuw=
X-Gm-Gg: ASbGncvO3ZwZJFV0s7PYJDJs+oSbqTYlKVljwUgB7rAfFcMRs34UZuCo0GNc/i8/FCQ
	AlR1koxPAhxIas469DKiIuVdO6guYwz3c8BSJtlps/BdTzQSXAP3KDXq+f8RaJopKWJDnW83NV+
	CiSusd48WJQ1NomnskWpUw1nOwI96PYtHJGSB0ZmHOUh3QGLkcoZiDPR7ynq9yo2berKhz4k/Dg
	HI54/eDcExW59q7EW4XjhPX6KybzxIDzs2blymDoo2B+nYF8Nt54lZ2vzIyYpsxlXvYz3BG+TKV
	x1/hT9Ypg+J/k9zaRko/MtffpQBaRHco58roBtuL
X-Google-Smtp-Source: AGHT+IHjCm+n9t+BP4CZPGdFRp4QfopBW0pXAiA+2EpbPgKwt4zldUfVEM7WdaSW0+bf3AzJJkBAV/S3l8UOUuOvyi8=
X-Received: by 2002:ad4:5ce7:0:b0:880:23fb:9e63 with SMTP id
 6a1803df08f44-88071191f52mr93692416d6.56.1762434873019; Thu, 06 Nov 2025
 05:14:33 -0800 (PST)
MIME-Version: 1.0
References: <20251106-bitbake-setup-v3-0-97db90f85f84@bootlin.com>
In-Reply-To: <20251106-bitbake-setup-v3-0-97db90f85f84@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Nov 2025 14:14:22 +0100
X-Gm-Features: AWmQ_bm3tdoTp9M--tHj0xX2lgiZjq1kGYIPgZUWxEUt2lGq8CJE8z7ZMYDOTUA
Message-ID: <CANNYZj91Ob9JOfXcUVMfdDdXeZ61gYy8rFPZzEoRgcj_mUmb_Q@mail.gmail.com>
Subject: Re: [docs] [PATCH v3 0/7] Start switching the documentation to bitbake-setup
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Nov 2025 13:14:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8010

On Thu, 6 Nov 2025 at 10:11, Antonin Godard via lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> Changes in v3:
> - Add suggestions/corrections by Alex (thanks!)
> - Add a patch to document core/yocto/root-login-with-empty-password.
> - Add websockets note and mention buildtools.
> - Use meta-raspberrypi as the example BSP layer.
> - Link to v2: https://lore.kernel.org/r/20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com

Thanks, I think this is good to go.

Alex

