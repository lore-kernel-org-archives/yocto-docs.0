Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296B5C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 05:45:35 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web08.8311.1636523134530151283
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 21:45:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Efk0C7T3;
 spf=pass (domain: gmail.com, ip: 209.85.166.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id j28so1310950ila.1
        for <docs@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 21:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=t1O1SNgzDPOwhnN0VnvBCwPQ6jiNk/oSI8jC3X7gOhk=;
        b=Efk0C7T3rfmDmj9+THu+ojx0BOj1jA9sqwVNTNrONeX64Sqs3dUQ1WlsBbqbwh6SRU
         WTS0q95wmeUcwzm+EHnLnbw0w7Nq4g4zFCCACHlxYt0omY82NU2xwjXw7O+b8/Zw8A20
         eyOwGNRnd4HuClCQRVC+LSjjZLxeRyzZF3etA7PkcSTkP4dlDAwNX5dPU77zObU+zZfv
         R8JR11cOKjR82rAH7ndOUp9K/I3AEoUUhLPUO7k6dNu2ropsrmzWmOod8+tYs66NxUWJ
         0KyEaIr6+eD6AeS+EOlAaJg0Ii30zcUgfh68rH0x2ERTDSbrEXc/3DueJG1a/FjdLHJo
         EGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=t1O1SNgzDPOwhnN0VnvBCwPQ6jiNk/oSI8jC3X7gOhk=;
        b=J4xEfrruw18YKLFNsvOZXuVGp2rwbWfZ1Bs2j/eRFb6J+P2EM8TZGapdEPaiPwNTss
         M6wrBHuyPZ+6PD2pLC0KVhni5GQH15eGAMpg60gBpfzLDQzNSaXAw6c+dEGlsGU901Qy
         AFbqXuaWVRkoX/HBvEl+7m9qwsSnj4M/BJpz2BP/HK8gN5HZMOQv+qWLCxuv22aLV8ZY
         DQiIKi/M5k8zQwYNK9f39wbWAogxSb08r+Zo6pNYnVTTpm5LKCtGsGFiP611IF2a48Ao
         wfpObUJolMHf0g2DIjGHioBOOHxQDXN6CimoHWSxMIYXjUiPpQZtFa2jxSiI2YB1usmQ
         lcHg==
X-Gm-Message-State: AOAM530cDApBU4r/LXLJ+6CtSx5KG6jVtvkdo0RTt40jTOUMR9zZrN5H
	CFN3XFtJpnBlyz8pRjluNfUGkoKh/PA3UUNhBnVK0LU8XZc=
X-Google-Smtp-Source: 
 ABdhPJyUEwHoI/tL57htavcYNzTulb0WXjAhImOM9vNNhHQSnvYd7RZN7DEpA/gnAKnkW8u6UzKb9+DOGM6V8mIMd58=
X-Received: by 2002:a92:520f:: with SMTP id g15mr9444996ilb.217.1636523133598;
 Tue, 09 Nov 2021 21:45:33 -0800 (PST)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 9 Nov 2021 21:45:22 -0800
Message-ID: 
 <CANx9H-AKb9xaP8B=X+ZYH4uX5DGNeR-gO4dXa5b3pJ=f7_iStg@mail.gmail.com>
Subject: [RFC] Translating "Hands-on Kernel Lab" to Sphinx; updating
To: docs@lists.yoctoproject.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000000b813205d068bc12"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Nov 2021 05:45:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2110

--0000000000000b813205d068bc12
Content-Type: text/plain; charset="UTF-8"

In preparation for the Yocto Summit, I have begun translating the legacy
"Hands-on Kernel Lab" to Sphinx/ReStructuredText.

My WIP branch is
https://github.com/moto-timo/yocto-docs/tree/timo/kernel-lab

I will be updating/rebasing multiple times in the coming days. Do not
expect this repository to completely stabilize until the day of the Yocto
Summit.

I would very much appreciate eye-balls on this branch and the corresponding
content based on the 2.6 version [1][2] as well as some unpublished updates
for 3.3 [3].

My proposal is to add the metadata layers as git submodules to an overall
layer. Ideally this would be hosted at git.yoctoproject.org. This would
allow the content to be updated via typical git/mailing list processes,
rather than an awkward tarball => website workflow. I will lay out this
structure on GitHub as a proposal. Do not expect the corresponding
layers/repos to be stable as they will be in extreme flux up until the day
of the Yocto Summit. If you have other ideas for how to
develop/maintain/share this content, please speak up.

NOTE: my initial focus is simply on translating to Sphinx and updating to
the current Yocto Project release and Linux kernel(s). I will entertain
other changes once these required steps are complete.

Let the discussion begin!

--Tim

[1] https://wiki.yoctoproject.org/wiki/images/4/42/Kernel-lab-2.6.pdf
[2]
https://github.com/moto-timo/yocto-kernel-lab-layers/blob/legacy-2.6/kernel-lab-2.6-layers.tar.bz2
[3]
https://github.com/moto-timo/yocto-kernel-lab-layers/blob/interim-3.3/kernel-lab-3.3-layers.zip

--0000000000000b813205d068bc12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In preparation for the Yocto Summit, I have begun translat=
ing the legacy &quot;Hands-on Kernel Lab&quot; to Sphinx/ReStructuredText.<=
div><br></div><div>My WIP branch is=C2=A0<a href=3D"https://github.com/moto=
-timo/yocto-docs/tree/timo/kernel-lab" target=3D"_blank">https://github.com=
/moto-timo/yocto-docs/tree/timo/kernel-lab</a></div><div><br></div><div>I w=
ill be updating/rebasing multiple times in the coming days. Do not expect t=
his repository to completely stabilize until the day of the Yocto Summit.</=
div><div><br></div><div>I would very much appreciate eye-balls on this bran=
ch and the corresponding content based on the 2.6 version [1][2] as well as=
 some unpublished updates for 3.3 [3].</div><div><br></div><div>My proposal=
 is to add the metadata layers as git submodules to an overall layer. Ideal=
ly this would be hosted at <a href=3D"http://git.yoctoproject.org">git.yoct=
oproject.org</a>. This would allow the content to be updated via typical gi=
t/mailing list processes, rather than an awkward tarball =3D&gt; website wo=
rkflow. I will lay out this structure on GitHub as a proposal. Do not expec=
t the corresponding layers/repos to be stable as they will be in extreme fl=
ux up until the day of the Yocto Summit. If you have other ideas for how to=
 develop/maintain/share this content, please speak up.</div><div><br></div>=
<div>NOTE: my initial focus is simply on translating to Sphinx and updating=
 to the current Yocto Project release and Linux kernel(s). I will entertain=
 other changes once these required steps are complete.</div><div><br></div>=
<div>Let the discussion begin!</div><div><br></div><div>--Tim</div><div><br=
></div><div><div>[1] <a href=3D"https://wiki.yoctoproject.org/wiki/images/4=
/42/Kernel-lab-2.6.pdf">https://wiki.yoctoproject.org/wiki/images/4/42/Kern=
el-lab-2.6.pdf</a></div><div>[2] <a href=3D"https://github.com/moto-timo/yo=
cto-kernel-lab-layers/blob/legacy-2.6/kernel-lab-2.6-layers.tar.bz2">https:=
//github.com/moto-timo/yocto-kernel-lab-layers/blob/legacy-2.6/kernel-lab-2=
.6-layers.tar.bz2</a><br></div><div>[3] <a href=3D"https://github.com/moto-=
timo/yocto-kernel-lab-layers/blob/interim-3.3/kernel-lab-3.3-layers.zip">ht=
tps://github.com/moto-timo/yocto-kernel-lab-layers/blob/interim-3.3/kernel-=
lab-3.3-layers.zip</a></div></div><div><br></div></div>

--0000000000000b813205d068bc12--

