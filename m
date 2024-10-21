Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD708D1712B
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 19:30:49 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.1198.1729539042883799063
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Oct 2024 12:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KhFLP2Gz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d58377339so5284863f8f.1
        for <docs@lists.yoctoproject.org>; Mon, 21 Oct 2024 12:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729539041; x=1730143841; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9ipl8VqYOvWrj4tcREUVoFFZJZh9Z1mxVbt9XlLDy34=;
        b=KhFLP2Gzn0ZLxlRVDkGFt3y7F7H6w3bC3WlPpOUYQHpyCGPuGtxWfDzRG+9gLevb3W
         ll/fAZ93lnOPZUClH6CzowTizkZRqoawOdo3xo91aXEfS5QdjVTQYp2qkARGlGjKSg6W
         da5wTGF59LHHinggBEpPDX+u0E2vCEyDwjudg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729539041; x=1730143841;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ipl8VqYOvWrj4tcREUVoFFZJZh9Z1mxVbt9XlLDy34=;
        b=xAa8Og4C8A0AAvh0Tli8Vlj93NWgzcAz40z5mrkkcB7VsYI2V0KBrZXZiedf0HE5t9
         OaCsmpb/LWwBF/+WQkatZW7hTLyN0f02qt7rnx1Oypn4xUWcVudiV16VOPKg0WjHkr7I
         FYCmibGGbANiPncM0c0KJrVwpX2TeBX0t9gaUH8UzjhpgUhCbe3laAUXhlvOnrzORAaN
         iSCzN6J4Bm2xhB9+7/FI+dz5sUeZHhZ4woPVOB+Do7JBIP4DQH7Q94/Lb5BCQqIz5WFJ
         ctEDuUe2NAae0uCD6BcqYv23CAfNfKJYFNUDLF73Kvc7HkKzbC2AP4kRJVQzDiFY30kv
         pOEA==
X-Gm-Message-State: AOJu0Yx07S5RJHAeHMyo0H7By93wcUSVe7zgnnPkg8yHqVMFQnfL1IJ8
	1n7X4Ve7GMuEkkpIpdclOrW0eeKKX3w34oPNfuq5lp2OTyeaUe12gYn7OXZ1lJxwVQY5jC0z45a
	t
X-Google-Smtp-Source: AGHT+IGo1GHNqeEjVgrvX+njB4HRo1uWJ7LTXEAmiLVAx/jHdvdVGfAVECUmu4KGWxiQV5foZxin3Q==
X-Received: by 2002:adf:e7c2:0:b0:37d:95a7:9e57 with SMTP id ffacd0b85a97d-37ea21c300dmr10918478f8f.2.1729539040973;
        Mon, 21 Oct 2024 12:30:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2d74:9690:f5f5:9b21? ([2001:8b0:aba:5f3c:2d74:9690:f5f5:9b21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9b41fsm4948704f8f.93.2024.10.21.12.30.39
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 12:30:39 -0700 (PDT)
Message-ID: <f2329d5f28bd22f75a29a3cc7f4332025de65603.camel@linuxfoundation.org>
Subject: Possible new entry for the FAQ section?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs <docs@lists.yoctoproject.org>
Date: Mon, 21 Oct 2024 20:30:38 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Oct 2024 19:30:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5542

Q: Why isn't there a way to append bbclass files like bbappend for
recipes?

A: The project has consciously chosen not to implement such
functionality. Class code is designed to be shared and reused and
expose some level of configuration to it's users. We want to encourage
people to share these changes so we can build the best classes.=C2=A0

If append functionality was available our evidence/experience suggests
people would sit on changes instead of sharing and discussing issues
and we'd end up with bizarre class interactions when new layers were
included. We therefore consciously choose to have a natural pressure to
share changes to them.

There are also technical considerations like which recipes a class
append would apply to and how that works within the layer model. These
are complications we think we can live without!



