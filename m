Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438A1EB64DC
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 14:45:58 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.15448.1687877156372663995
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 07:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=TZsLfYt7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fba5a8af2cso7728615e9.3
        for <docs@lists.yoctoproject.org>; Tue, 27 Jun 2023 07:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687877154; x=1690469154;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHSxIB5KtgdH6NPaTwPIddIFvKn/Oy1olsmyDHv0ZTs=;
        b=TZsLfYt7HQ51Cb+bEXzqftortss3FtiasApWEnZt7aSMNLh0DA2mnc/KOZy0piPavQ
         Cvy3mXyzzxxYjojL6Q/P74c6tzuDa3cTO/MYgv5Jy+3rhiJX1xKbUWTtyhFHneNRZg/p
         5mrHE0PgQWfJs6RJngnL2aHwoFDwaBDrheZY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687877154; x=1690469154;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qHSxIB5KtgdH6NPaTwPIddIFvKn/Oy1olsmyDHv0ZTs=;
        b=ZQWFjmp42Uh23gQEuucDNzdmqOFVZJqMzXoPilspuYHDirSSpV79EVMcBAz6uVYC0E
         sId/+xZCkZzYoJTeAXZra0XFd//F5dJtNZ4fW/c3bkJGZdF+xflDPSQbwml8LwuAF8nC
         QTJSJTm2kRmSkLKGQ16j+UT7neNt9CSXLF5+NANxzpZfQUVbofbIS5GzTbGuGgcZHqV0
         SyW98JUj+pXIYk7+Y1WNkF6dxAVrdHlPxi/ekCmZFh4cGgLyMic6iWNonn4VnjK/j92n
         fUi0sY6qxzWiDW0SlpFUtRrbaVwSLUdrnr1oLdCwaMgrhX9U/F5YyICKWZcRf3Vfqd8V
         UgRQ==
X-Gm-Message-State: AC+VfDzH+u6Y/AyirCB3VbfjJGaK2hxozzy+dtvJgpKhQk5B3amoYkny
	x5mTOQosVUpoEE5ZIiofthbzUA==
X-Google-Smtp-Source: ACHHUZ7iZFsHQDUyNJiwgyXE7S3U+dwf3WYJc5lsbsCVEtYeV0wqux7JykJEhYL1piGnmasXoVmw8Q==
X-Received: by 2002:a5d:452f:0:b0:313:e12d:b245 with SMTP id j15-20020a5d452f000000b00313e12db245mr7317316wra.29.1687877154537;
        Tue, 27 Jun 2023 07:45:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:90b7:e2b1:2368:2244? ([2001:8b0:aba:5f3c:90b7:e2b1:2368:2244])
        by smtp.gmail.com with ESMTPSA id r11-20020adfce8b000000b00313f3c11512sm5213343wrn.89.2023.06.27.07.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 07:45:54 -0700 (PDT)
Message-ID: <0666fd2c344a5831fcb9c7727dc6f7805157079f.camel@linuxfoundation.org>
Subject: Re: [docs] First quick build of Yocto poky
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jeremy.drezet@airbus.com, docs@lists.yoctoproject.org
Date: Tue, 27 Jun 2023 15:45:53 +0100
In-Reply-To: <CAO9kbo+WzKyAi98qeXcxW8PdNxUEk4_WyP+gzUfSLn_99i1Y6A@mail.gmail.com>
References: 
	<CAO9kbo+WzKyAi98qeXcxW8PdNxUEk4_WyP+gzUfSLn_99i1Y6A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jun 2023 14:45:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4042

On Tue, 2023-06-27 at 14:44 +0200, Jeremy DREZET via lists.yoctoproject.org=
 wrote:
> Hello
>=20
>=20
> I send you this email because I am just trying to build a first version o=
f Poky in order to test basic capabilities of th OS, but when using "bitbak=
e" I have some warnings and errors of this kind :
>=20
> #########################################################################=
##
>=20
> WARNING: cmake-native-3.25.2-r0 do_fetch: Failed to fetch URL=C2=A0https:=
//cmake.org/files/v3.25/cmake-3.25.2.tar.gz, attempting MIRRORS if availabl=
e
> ERROR: cmake-native-3.25.2-r0 do_fetch: Fetcher failure: Fetch command ex=
port PSEUDO_DISABLED=3D1; export DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/r=
un/user/1001/bus"; export SSH_AUTH_SOCK=3D"/run/user/1001/keyring/ssh"; exp=
ort PATH=3D"/home/adminj/poky/scripts/native-intercept:/home/adminj/poky/bu=
ild/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/adminj/poky/scripts:/=
home/adminj/poky/build/tmp/work/x86_64-linux/cmake-native/3.25.2-r0/recipe-=
sysroot-native/usr/bin/x86_64-linux:/home/adminj/poky/build/tmp/work/x86_64=
-linux/cmake-native/3.25.2-r0/recipe-sysroot-native/usr/bin:/home/adminj/po=
ky/build/tmp/work/x86_64-linux/cmake-native/3.25.2-r0/recipe-sysroot-native=
/usr/sbin:/home/adminj/poky/build/tmp/work/x86_64-linux/cmake-native/3.25.2=
-r0/recipe-sysroot-native/usr/bin:/home/adminj/poky/build/tmp/work/x86_64-l=
inux/cmake-native/3.25.2-r0/recipe-sysroot-native/sbin:/home/adminj/poky/bu=
ild/tmp/work/x86_64-linux/cmake-native/3.25.2-r0/recipe-sysroot-native/bin:=
/home/adminj/poky/bitbake/bin:/home/adminj/poky/build/tmp/hosttools"; expor=
t HOME=3D"/home/adminj"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /hom=
e/adminj/poky/build/downloads/cmake-3.25.2.tar.gz.tmp -P /home/adminj/poky/=
build/downloads 'https://cmake.org/files/v3.25/cmake-3.25.2.tar.gz' --progr=
ess=3Ddot -v failed with exit code 4, no output
>=20
> ERROR: cmake-native-3.25.2-r0 do_fetch: Bitbake Fetcher Error: FetchError=
('Unable to fetch URL from any source.', 'https://cmake.org/files/v3.25/cma=
ke-3.25.2.tar.gz')
>=20
> ERROR: Logfile of failure stored in: /home/adminj/poky/build/tmp/work/x86=
_64-linux/cmake-native/3.25.2-r0/temp/log.do_fetch.330289
>=20
> ERROR: Task (/home/adminj/poky/meta/recipes-devtools/cmake/cmake-native_3=
.25.2.bb:do_fetch) failed with exit code '1'
>=20
> #########################################################################=
##
>=20
>=20
> Maybe something is wrong with sockets use... Could you please help me on =
this point ?


It is showing the wget command failed with exit status 4 which is "network =
failure".


It is trying to run the command "wget -t 2 -T 30 --passive-ftp -O /home/adm=
inj/poky/build/downloads/cmake-3.25.2.tar.gz.tmp -P /home/adminj/poky/build=
/downloads 'https://cmake.org/files/v3.25/cmake-3.25.2.tar.gz' --progress=
=3Ddot -v".

Is network access available where you're running this build?

Cheers,

Richard

