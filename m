Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.18939.1604256019919003815
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Nov 2020 10:40:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QsllK4qT;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id z1so5683489plo.12
        for <docs@lists.yoctoproject.org>; Sun, 01 Nov 2020 10:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=fvI0Ne63ajaJ7Kow/HBPzQdGxhW+G/Nezi3FTfkgEBQ=;
        b=QsllK4qT0NdtBso8IOnDD2YU5RoeNHqwuQKQTxEfDVySeR8R43DF44v85Dn+yi0sNc
         6jstgUmY9sJwCHb6Q0lS7w842tXnXQleIzmPDyLyJcI2mdkH6AYp2d4FLHYYM5DG5Lnt
         DRIKJD8lmWgMSfagg0pnMgLHOqT20pw/6Qu+uRlIsQy3lw5sHY0L0xIi/lw4bd83I393
         1pp161zL9UYtBDLITtQ+QYFe1/RDgXe214nA8FOAx69mVZ/rhDOsOxtDTpG1W/eooB7P
         +BIPvkOzRYuVH3c6JfmfnLBtDmZshOkl0pWKFZ56avP7x93m5m2Np5xNGuvuFFWH7BPu
         3umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=fvI0Ne63ajaJ7Kow/HBPzQdGxhW+G/Nezi3FTfkgEBQ=;
        b=CxCZrB4JBlB993TL5Tv3MHjQtNqFfpmXDixe/29bIclinsvXrVQf9Kcc+KQoksICpw
         yco1uJwNMjTVrYsk8J7hysPy2clSwQfAlRajm8OVz69Z7O32kaV/KMqyPmGP1A5oMSkE
         OuOZrbWFe0uxfyhgwOj2YiV0acJEYe3CDBc9CW+jUWNsdezLq8RZ8a29edSS7IaFlNYA
         YOSxWSSoGPKPljp41XDufULE0x4gp2060hwkczvrWJzVZDRftXTA0eZV3NssplLf3Qcv
         1XMnQ/bsFhGRsHcCXGdruuoSEwtPNevYUIY0UfS0gZ+wf3cA8VOFRmHUgPypaXN7GCA7
         r0gw==
X-Gm-Message-State: AOAM530IJRn0aN9uN3Xx2TD/MTww5efjP/nyPxEefmZx1rRIkdydtWUA
	YMc5tKt4W1hAfEM+LDvKAWD0mIkmgOs=
X-Google-Smtp-Source: ABdhPJwD8S940YmRQglkBcdaFtliYP1Re7A/FwvHorRXCzPZcS0VC7aVezBKGLhC/VYDROnQDJYnww==
X-Received: by 2002:a17:90a:1b8a:: with SMTP id w10mr13083853pjc.145.1604256017194;
        Sun, 01 Nov 2020 10:40:17 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:5c1c:9520:3cc8:c75e? ([2601:202:4180:a5c0:5c1c:9520:3cc8:c75e])
        by smtp.gmail.com with ESMTPSA id k9sm11698019pfi.188.2020.11.01.10.40.16
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2020 10:40:16 -0800 (PST)
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
From: "akuster" <akuster808@gmail.com>
Subject: [RFC] Add recipe-yocto-docs
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <d6cadebf-150f-079a-8a47-bf18220a5bfa@gmail.com>
Date: Sun, 1 Nov 2020 10:40:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello,

I just finished creating the ability to build the yocto-doc via a recipe
( Thanks to everyone who helped with the sphinx migration)

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dakuster/y=
octo_docs_recipe

There are several structural decision to me made.

Several of the dependency packages that currently reside in=C2=A0 other
layers so those might need to moved in core.=C2=A0

The easy decision is where the yocto-doc recipe should live. I suspect
in meta-yocto.

The ones I am not sure are the ones needed to support sphinx. Do we want
these only as Native? Do we want this sphinx in core?

This may be a gateway to allow including the docs in an SDK image. Add
layer based docs. Create an Docs installer, bitbake-docs, etc.

The recipes most likely need a bit of cleaning up. I did test a native
version of the index.html and that worked fine.


- armin



