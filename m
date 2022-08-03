Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDFFC19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 14:23:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.8996.1659536588608496825
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 07:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hm2l7I0E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id c22so8796878wmr.2
        for <docs@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 07:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=tFenhtt++eSlIJ/oS2IjRWCtQsl7XvO/cb3sEJkVCGw=;
        b=hm2l7I0E26mePoO6vAcdwO5qFc0XUjyQnBkTZUBBYNs95rU+5UvgDJ7gZWb0C0l/r6
         /NOCDD8Sm3EpcShT5KQZrWq7vyqKT5TmPdBDk5xOvGNNS12epBKu/5pQeygMHlg+Gobk
         xmjtdYQGLZl26bGQvsjUle40HXri+PHHYxhpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=tFenhtt++eSlIJ/oS2IjRWCtQsl7XvO/cb3sEJkVCGw=;
        b=qA5xABGMbU5FFrdmyhrfHQJE9ZXgWRvmsWd6di7zJxsOrvnt8w8XLMC/YsKejhagK6
         Ynyy1HiewZup6ApU37dNr+EBLFz0UW+KSJ0X9VyVsC111Q8xM9T4PZLgmciPQFmCObRP
         b8S6QddlfQ8KV1xg7ZJrB4Vo0tY8cu8A//hUFBLUznhcZG0GPjZq+pEbFE1Swtn/RfaO
         EU6DM4lknBFy3jyuugDc5qJEufq8ook4X8oWHDUPqmIBTCa7vYTu519xrHVKjx4Nrlwa
         Fs1otLz4Bof9/czsGgxs6co2BI9KGJCgl/zuSlFMAnNUQy5LGiMz82wtaurMLVuTmK75
         rvcQ==
X-Gm-Message-State: ACgBeo2dCqrw9/nLbxlN70VuwaQzoDilY7YcKNMKfM4UYzVEwC1wGcaE
	xGo3Bi8icXOppsp+7wrVl+kFyA==
X-Google-Smtp-Source: 
 AA6agR7o2E41nMRz3/g99UhTmLBYVGfXZ98BeY8PfWQa3dDlh8I8x+FWlrdHMpwakSEfSsHP+MJdVg==
X-Received: by 2002:a05:600c:1d04:b0:3a4:f43b:e2e4 with SMTP id
 l4-20020a05600c1d0400b003a4f43be2e4mr2698423wms.121.1659536587012;
        Wed, 03 Aug 2022 07:23:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac96:e386:102:36cd?
 ([2001:8b0:aba:5f3c:ac96:e386:102:36cd])
        by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c4ecb00b003a02cbf862esm3140078wmq.13.2022.08.03.07.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 07:23:06 -0700 (PDT)
Message-ID: 
 <acc2ac5ca374f501bd72ee532067b6d033023fa8.camel@linuxfoundation.org>
Subject: Re: [docs] Add 3.1.18 to supported release manuals
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 03 Aug 2022 15:23:05 +0100
In-Reply-To: <21b24dbd-1355-ac55-2d7c-b4ad303817e2@bootlin.com>
References: <21b24dbd-1355-ac55-2d7c-b4ad303817e2@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Aug 2022 14:23:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3110

On Wed, 2022-08-03 at 16:07 +0200, Michael Opdenacker via
lists.yoctoproject.org wrote:
> Hi again Quentin,
>=20
> This question is also related to release management.
>=20
> https://docs.yoctoproject.org/dev/releases.html doesn't have version=20
> 3.1.18 (released yesterday) yet, though a "yocto-3.1.18" tag was added=
=20
> the yocto-docs repository too.
>=20
> I guess nothing triggered a rebuild, and therefore the set_versions.py=
=20
> script didn't get a chance to update the list of releases=20
> (releases.rst). Would it be possible with the Autobuilder to cause the=
=20
> addition of a new tag to trigger a new build? Or any other solution?

I suspect this is a buildbot configuration issue and:

https://issuehint.com/issue/buildbot/buildbot/6416

may be relevant.

Cheers,

Richard

