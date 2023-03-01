Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5751C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:49:46 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.18292.1677664183067764640
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WvcQCGIt;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id bi9so16868977lfb.2
        for <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 01:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677664181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AXz/dXfKL/CujHjYgcb+l/SLN3IekW3XdJ7aHlbcoaU=;
        b=WvcQCGItrQlb3Glj4CwdWg4HAAwkivh+JlrErya0Kmg5KJ0kyLHA7NpLqF79rcWVdI
         tKQZsIFQM/du7sN9INkefrkCxboB7a3qa/vEtfx0V2GUaJC1MVFfKn/dYn8bXMLac/4a
         jtNE6W2SFz1/btJNfemBvc8UkAIM1QvSig0ca6+ykibIoIf3EZWBcQPI2WvAyBYw0Tn/
         Y2yOb7xsrgInQjkNEQr/YrFq/6xtcfxVLxibClSD73uBy/eAV7ZU7Nd+y66cWIUk+YrT
         AlmpMXAruMEmA3cEKD1t00pr1g0k3FbscKB5JY1j9IIuCkTt6fhi1lHQodXOR91Yaxhs
         /iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677664181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXz/dXfKL/CujHjYgcb+l/SLN3IekW3XdJ7aHlbcoaU=;
        b=q9AZM8q/vim6rDK2cT+Rm6i+lFDHWXHyOpmOTKd8Hxaa7Dz9HVMoABfF6QzHqYVi4t
         IkC4i3VBMxIMfXt6WsJsFpOT3OehoDvYdJt47wne72XnZouymjwj0XLeXedKyD8G5/Za
         tlHxJwHX0WKAs2We9wDLcIwnMnakY82Y3wq1yRVKy4jQj+FRROwamLt0VHaPVxyX6/eP
         1pls7kfDCNAWbS5c3lJEy3jUrKvYGFaK1yoy2kFKYtOR49u8M1+MORw8eMqRVpIc5YxF
         iwXCzZ/L6keBTUefDtPAoTtDZA213IFa4HkxWTZ6ffo8ed0j6FVQvRM2dT8YtDlwYC+x
         XadA==
X-Gm-Message-State: AO0yUKVpIN9VCUWSmp8sgIZqJWLllmzk6TW6oN7SgWQxIAgwygEhepLA
	o++jgC0GqzYxa6p+zxvPOxklENg2sJz99hVpgKo=
X-Google-Smtp-Source: AK7set9PNNIckupgqAaihAqexaszQ0g9R6KQU8yH/y5f7pSpiYKUHAx+BmfD7D2JSeXohxoUI5t9nR7RrFg0NsjAXJA=
X-Received: by 2002:ac2:4f92:0:b0:4db:1999:67a3 with SMTP id
 z18-20020ac24f92000000b004db199967a3mr1619510lfs.13.1677664181131; Wed, 01
 Mar 2023 01:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20230228221309.82156-1-yoann.congal@smile.fr> <20230228221309.82156-2-yoann.congal@smile.fr>
 <cd39cbba-51e6-3c91-24c2-41c1edaed0c2@bootlin.com>
In-Reply-To: <cd39cbba-51e6-3c91-24c2-41c1edaed0c2@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Mar 2023 10:49:29 +0100
Message-ID: <CANNYZj9jtHeKnKprAJraa7mZaYz+pa1kV8EMGJ2faJXvroSF2A@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/1] ref-manual: Add info on "mixin" layers
To: michael.opdenacker@bootlin.com
Cc: Yoann Congal <yoann.congal@smile.fr>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:49:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3763

On Wed, 1 Mar 2023 at 10:44, Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
> This makes me wonder about how official these are, though we said they
> are not officially supported by the project itself. Maybe we could just
> mention this repository in the next paragraph...

They are not official. Official things get tested on the AB and
breakage blocks the changes; these layers are ad hoc, as is.

Alex

