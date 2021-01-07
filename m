Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.11204.1610038381709189840
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 08:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Z9AlrOsV;
 spf=pass (domain: linaro.org, ip: 209.85.208.50, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f50.google.com with SMTP id r5so8327647eda.12
        for <docs@lists.yoctoproject.org>; Thu, 07 Jan 2021 08:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=o8bgzNuDBXZ2Og8qg6myFwtm3fXv62bFln2TfKU2h9M=;
        b=Z9AlrOsVpqJRWwR0ls/jDHlOrmR+HaIdjERCoCP1mb//7q19LBCA64uHLDWTOyWrY8
         22BlbYF7PwJiYMjCwElKtGkPONp36vfCWC3mf/GdexjvB91glQOq+Xr+6GZ/BpFNLcJE
         Cqj46eVXEwEdUlAWfN6d64LE0Zf4X4dP3kBauuBt3Jx4ZjDi67eiRsMy3Z6to6dvH7sJ
         JGzbO6VITB9TQoIbVnXrtdVS8OVye9nKfJC9tksjE3ITWbXkxQk6YkJS/9nKYBus9OkC
         LMfA9KjpqKV8O4RqsssFpyT2I5GCW6OuURp+wQRrT4WyGVKhHZBjUfY11NKoHCPEJDpY
         OBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=o8bgzNuDBXZ2Og8qg6myFwtm3fXv62bFln2TfKU2h9M=;
        b=jG1PNzIAiXshborJVR5HQ1I+1mlb4B7RaPIWn5LSz3SCN4eAynySWEXt92Tho9sHVi
         VwJXmPNw/mUxV8mzgGnqqcRGNnGzrjnxivnu82p9YB3km3jjY+WB0j3f6d53sWXZNr3Z
         gXUiWT/OFTULMUohrvzKAhaB+trVLDPGGfx9krYSvZ6Ge/rqAO/f0a0bvUywK3XnZBNf
         Kg3YpozHSHxhqIioFq/QyTVaoAKheYonSKzvITBUEcjNeRGXLHEQeGDpF9rXBNO5sJrR
         xxvDL+QcplJEkyGXsThYQjxzNWdzuugjmX+O02iQw/M3Y+fbvKU2C22DhZdrn7P2p3xb
         fhiA==
X-Gm-Message-State: AOAM530ji7E8u/CbO9T+V929PIba4OXbSCfCeY+tAa1c87u92TFBCy3G
	t/lk8ywLmPY+2uVuGVkcEVliAgTghgc3bH0m22jq3q9shNOH8g==
X-Google-Smtp-Source: ABdhPJy5ctXSeQipr9CVlTftcufl25qbJSkSEQsbMXlHSLifedae8AGktOkbJLWug0IRLA+qQBvCdOGbbIcLhByQQso=
X-Received: by 2002:a05:6402:95c:: with SMTP id h28mr2320171edz.26.1610038379881;
 Thu, 07 Jan 2021 08:52:59 -0800 (PST)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 7 Jan 2021 17:52:49 +0100
Message-ID: <CAP71Wjw3T0XKPxVH59J_fGpBmB+qJ6GyKowOPqa8CGOZ2e8OmQ@mail.gmail.com>
Subject: broken links
To: YP docs mailing list <docs@lists.yoctoproject.org>, 
	Robert Berger <robert.berger@reliableembeddedsystems.com>
Content-Type: multipart/alternative; boundary="000000000000b53ee105b852458a"

--000000000000b53ee105b852458a
Content-Type: text/plain; charset="UTF-8"

hey!

Robert opened a bug for a broken link in the doc, see
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14168

This is a valid bug, a regression in
e1bcfe4d8 dev-manual: remove unused labels

Unfortunately, it opens a can of worms... since it looks like the built in
linkcheck did not detect the broken links, and this is not the only broken
link.

I ran an online link checker on
https://docs.yoctoproject.org/dev-manual/common-tasks.html, and it reported
the following errors with anchors.. they look like they are regression with
the commit above..

https://docs.yoctoproject.org/dev-manual/common-tasks.html#new-recipe-fetching-code
(line 1783)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#qemu-image-running-tests
(line 8164)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#dev-debugging-viewing-logs-from-failed-tasks
(line 8594)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#wic-using-the-wic-plugin-interface
(line 5148)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#best-practices-to-follow-when-creating-layers
(line 6101)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#new-recipe-single-c-file-package-hello-world
(line 1696)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#new-recipe-storing-and-naming-the-recipe
(line 2356)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#new-recipe-autotooled-package
(line 1622)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#usingpoky-extend-customimage
(line 2434)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#combining-multiple-versions-library-files-into-one-image
(line 4671)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-bbappend-files
(line 6107)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#dev-viewing-task-variable-dependencies
(lines 8610, 8919)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#platdev-gdb-remotedebug
(line 8634)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#wic-requirements
(line 5545)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#dev-viewing-dependencies-between-recipes-and-tasks
(line 8606)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#dev-other-debugging-others
(line 8641)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#platdev-appdev-devshell
(line 9299)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#how-to-submit-a-change
(line 9393)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#dev-debugging-buildfile
(line 8623)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#new-recipe-makefile-based-package
(line 2069)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#incrementing-a-binary-package-version
(line 6199)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-a-quilt-workflow
(line 9337)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#dev-debugging-taskrunning
(line 8616)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#finding-the-temporary-source-code
(line 3504)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#automatically-incrementing-a-binary-package-revision-number
(line 6290)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-a-provided-kickstart-file
(line 5134)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#dev-debugging-bitbake
(line 8620)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#figuring-out-the-mailing-list-to-use
(line 9920)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#new-recipe-post-installation-scripts
(line 2201)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#dev-debugging-viewing-variable-values
(line 8598)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#understand-what-gives-your-image-size
(line 4024)
https://docs.yoctoproject.org/dev-manual/common-tasks.html#new-recipe-patching-code
(line 1703)

Anyone have any recommendations on how to configure the builtin linkcheck
so that it reports such errors?

cheers
nico

--000000000000b53ee105b852458a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hey!<div><br></div><div>Robert opened a bug for a broken l=
ink in the doc, see</div><div><a href=3D"https://bugzilla.yoctoproject.org/=
show_bug.cgi?id=3D14168">https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D14168</a><br></div><div><br></div><div>This is a valid bug, a regression=
 in=C2=A0</div><div>e1bcfe4d8 dev-manual: remove unused labels<br></div><di=
v><br></div><div>Unfortunately, it opens a can of worms... since it looks l=
ike the built in linkcheck did not detect the broken links, and this is not=
 the only broken link.=C2=A0</div><div><br></div><div>I ran an online link =
checker on=C2=A0<a href=3D"https://docs.yoctoproject.org/dev-manual/common-=
tasks.html">https://docs.yoctoproject.org/dev-manual/common-tasks.html</a>,=
 and it reported the following errors with anchors.. they look like they ar=
e regression with the commit above..=C2=A0</div><div><br></div><div><a href=
=3D"https://docs.yoctoproject.org/dev-manual/common-tasks.html#new-recipe-f=
etching-code">https://docs.yoctoproject.org/dev-manual/common-tasks.html#ne=
w-recipe-fetching-code</a> (line 1783)<br><a href=3D"https://docs.yoctoproj=
ect.org/dev-manual/common-tasks.html#qemu-image-running-tests">https://docs=
.yoctoproject.org/dev-manual/common-tasks.html#qemu-image-running-tests</a>=
 (line 8164)<br><a href=3D"https://docs.yoctoproject.org/dev-manual/common-=
tasks.html#dev-debugging-viewing-logs-from-failed-tasks">https://docs.yocto=
project.org/dev-manual/common-tasks.html#dev-debugging-viewing-logs-from-fa=
iled-tasks</a> (line 8594)<br><a href=3D"https://docs.yoctoproject.org/dev-=
manual/common-tasks.html#wic-using-the-wic-plugin-interface">https://docs.y=
octoproject.org/dev-manual/common-tasks.html#wic-using-the-wic-plugin-inter=
face</a> (line 5148)<br><a href=3D"https://docs.yoctoproject.org/dev-manual=
/common-tasks.html#best-practices-to-follow-when-creating-layers">https://d=
ocs.yoctoproject.org/dev-manual/common-tasks.html#best-practices-to-follow-=
when-creating-layers</a> (line 6101)<br><a href=3D"https://docs.yoctoprojec=
t.org/dev-manual/common-tasks.html#new-recipe-single-c-file-package-hello-w=
orld">https://docs.yoctoproject.org/dev-manual/common-tasks.html#new-recipe=
-single-c-file-package-hello-world</a> (line 1696)<br><a href=3D"https://do=
cs.yoctoproject.org/dev-manual/common-tasks.html#new-recipe-storing-and-nam=
ing-the-recipe">https://docs.yoctoproject.org/dev-manual/common-tasks.html#=
new-recipe-storing-and-naming-the-recipe</a> (line 2356)<br><a href=3D"http=
s://docs.yoctoproject.org/dev-manual/common-tasks.html#new-recipe-autotoole=
d-package">https://docs.yoctoproject.org/dev-manual/common-tasks.html#new-r=
ecipe-autotooled-package</a> (line 1622)<br><a href=3D"https://docs.yoctopr=
oject.org/dev-manual/common-tasks.html#usingpoky-extend-customimage">https:=
//docs.yoctoproject.org/dev-manual/common-tasks.html#usingpoky-extend-custo=
mimage</a> (line 2434)<br><a href=3D"https://docs.yoctoproject.org/dev-manu=
al/common-tasks.html#combining-multiple-versions-library-files-into-one-ima=
ge">https://docs.yoctoproject.org/dev-manual/common-tasks.html#combining-mu=
ltiple-versions-library-files-into-one-image</a> (line 4671)<br><a href=3D"=
https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-bbappend-f=
iles">https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-bbap=
pend-files</a> (line 6107)<br><a href=3D"https://docs.yoctoproject.org/dev-=
manual/common-tasks.html#dev-viewing-task-variable-dependencies">https://do=
cs.yoctoproject.org/dev-manual/common-tasks.html#dev-viewing-task-variable-=
dependencies</a> (lines 8610, 8919)<br><a href=3D"https://docs.yoctoproject=
.org/dev-manual/common-tasks.html#platdev-gdb-remotedebug">https://docs.yoc=
toproject.org/dev-manual/common-tasks.html#platdev-gdb-remotedebug</a> (lin=
e 8634)<br><a href=3D"https://docs.yoctoproject.org/dev-manual/common-tasks=
.html#wic-requirements">https://docs.yoctoproject.org/dev-manual/common-tas=
ks.html#wic-requirements</a> (line 5545)<br><a href=3D"https://docs.yoctopr=
oject.org/dev-manual/common-tasks.html#dev-viewing-dependencies-between-rec=
ipes-and-tasks">https://docs.yoctoproject.org/dev-manual/common-tasks.html#=
dev-viewing-dependencies-between-recipes-and-tasks</a> (line 8606)<br><a hr=
ef=3D"https://docs.yoctoproject.org/dev-manual/common-tasks.html#dev-other-=
debugging-others">https://docs.yoctoproject.org/dev-manual/common-tasks.htm=
l#dev-other-debugging-others</a> (line 8641)<br><a href=3D"https://docs.yoc=
toproject.org/dev-manual/common-tasks.html#platdev-appdev-devshell">https:/=
/docs.yoctoproject.org/dev-manual/common-tasks.html#platdev-appdev-devshell=
</a> (line 9299)<br><a href=3D"https://docs.yoctoproject.org/dev-manual/com=
mon-tasks.html#how-to-submit-a-change">https://docs.yoctoproject.org/dev-ma=
nual/common-tasks.html#how-to-submit-a-change</a> (line 9393)<br><a href=3D=
"https://docs.yoctoproject.org/dev-manual/common-tasks.html#dev-debugging-b=
uildfile">https://docs.yoctoproject.org/dev-manual/common-tasks.html#dev-de=
bugging-buildfile</a> (line 8623)<br><a href=3D"https://docs.yoctoproject.o=
rg/dev-manual/common-tasks.html#new-recipe-makefile-based-package">https://=
docs.yoctoproject.org/dev-manual/common-tasks.html#new-recipe-makefile-base=
d-package</a> (line 2069)<br><a href=3D"https://docs.yoctoproject.org/dev-m=
anual/common-tasks.html#incrementing-a-binary-package-version">https://docs=
.yoctoproject.org/dev-manual/common-tasks.html#incrementing-a-binary-packag=
e-version</a> (line 6199)<br><a href=3D"https://docs.yoctoproject.org/dev-m=
anual/common-tasks.html#using-a-quilt-workflow">https://docs.yoctoproject.o=
rg/dev-manual/common-tasks.html#using-a-quilt-workflow</a> (line 9337)<br><=
a href=3D"https://docs.yoctoproject.org/dev-manual/common-tasks.html#dev-de=
bugging-taskrunning">https://docs.yoctoproject.org/dev-manual/common-tasks.=
html#dev-debugging-taskrunning</a> (line 8616)<br><a href=3D"https://docs.y=
octoproject.org/dev-manual/common-tasks.html#finding-the-temporary-source-c=
ode">https://docs.yoctoproject.org/dev-manual/common-tasks.html#finding-the=
-temporary-source-code</a> (line 3504)<br><a href=3D"https://docs.yoctoproj=
ect.org/dev-manual/common-tasks.html#automatically-incrementing-a-binary-pa=
ckage-revision-number">https://docs.yoctoproject.org/dev-manual/common-task=
s.html#automatically-incrementing-a-binary-package-revision-number</a> (lin=
e 6290)<br><a href=3D"https://docs.yoctoproject.org/dev-manual/common-tasks=
.html#using-a-provided-kickstart-file">https://docs.yoctoproject.org/dev-ma=
nual/common-tasks.html#using-a-provided-kickstart-file</a> (line 5134)<br><=
a href=3D"https://docs.yoctoproject.org/dev-manual/common-tasks.html#dev-de=
bugging-bitbake">https://docs.yoctoproject.org/dev-manual/common-tasks.html=
#dev-debugging-bitbake</a> (line 8620)<br><a href=3D"https://docs.yoctoproj=
ect.org/dev-manual/common-tasks.html#figuring-out-the-mailing-list-to-use">=
https://docs.yoctoproject.org/dev-manual/common-tasks.html#figuring-out-the=
-mailing-list-to-use</a> (line 9920)<br><a href=3D"https://docs.yoctoprojec=
t.org/dev-manual/common-tasks.html#new-recipe-post-installation-scripts">ht=
tps://docs.yoctoproject.org/dev-manual/common-tasks.html#new-recipe-post-in=
stallation-scripts</a> (line 2201)<br><a href=3D"https://docs.yoctoproject.=
org/dev-manual/common-tasks.html#dev-debugging-viewing-variable-values">htt=
ps://docs.yoctoproject.org/dev-manual/common-tasks.html#dev-debugging-viewi=
ng-variable-values</a> (line 8598)<br><a href=3D"https://docs.yoctoproject.=
org/dev-manual/common-tasks.html#understand-what-gives-your-image-size">htt=
ps://docs.yoctoproject.org/dev-manual/common-tasks.html#understand-what-giv=
es-your-image-size</a> (line 4024)<br><a href=3D"https://docs.yoctoproject.=
org/dev-manual/common-tasks.html#new-recipe-patching-code">https://docs.yoc=
toproject.org/dev-manual/common-tasks.html#new-recipe-patching-code</a> (li=
ne 1703)<br></div><div><br></div><div>Anyone have any recommendations on ho=
w to configure the builtin linkcheck so that it reports such errors?</div><=
div><br></div><div>cheers</div><div>nico</div><div><br></div><div><br></div=
><div><br></div></div>

--000000000000b53ee105b852458a--
