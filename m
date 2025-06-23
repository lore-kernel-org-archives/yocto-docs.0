Return-Path: <alex.kanavin@gmail.com>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA46C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 12:43:20 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.18668.1750682589103655744
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 05:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NohWwvtp;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso35715965e9.2
        for <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 05:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750682587; x=1751287387; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxDTNFe5mIKzF61ZX3niSyDp91iBD0i27uz+1jOdzc0=;
        b=NohWwvtpV/kb2Md0MlCIbPPf2mnJcw8zKx2z4p8hVVo6WJKPkt18QwRWlxuwR7xQS/
         WuHw28VoniaPQTc2WIAkavqj2Qfc1mVRw8Eso15nircYK5R9Xd6FVZDRDI4Z0vlkHrBQ
         wlDvfP66dhqpkdUtvhZNZmD4kx6TdhA3qXLlDcKoXDAkxljbj5XYOBM+BEnr1AjC5jmd
         dLyyQietMEsL0iEFJad1fuJGH/tJwkQHfEFz34Yv6hAGWfF+nor5dKPx40jD5itjpIoj
         vFy0H8+pqRqjSNR9AC+JlAGxW/4kXDwuMtC8Mg1DH85pE58hBHIDIMnB28Ha6Er2pBEM
         Y61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682587; x=1751287387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxDTNFe5mIKzF61ZX3niSyDp91iBD0i27uz+1jOdzc0=;
        b=JeCiqVRi1J5ZmcmQpf1paWn1QqYtJaCNgkdrJjT5XE2jbuF1IFPz02vsezQjoUVZVn
         CV6yX6gkO+YZvFm4w2cWWkGV8fOL6FjB8aTADMK0bJI+yCli9wp/S4u78SsKdjpnNbOI
         osWQDHbIZa8swM3TlsGa8zMUQxk/VBNDhIV8jCWhMXtaB+hC13u/YUWwnqbNd6Q916lo
         1+r/oVaVew1j/pmiNCGVpiiBmtfA1jG0N23JC3si51w1Gc4Whrb9TQSogLLSz2GLAkjJ
         tG2b+o01ua6qkhaFR8X2c2jpvEZRqQlK3wJea/PlfO/h5iucN73EHmYLQJRW2BqFXHrY
         GRMQ==
X-Gm-Message-State: AOJu0YyNMOXsFxtSWOiuLHqQwli/RIsXcP2vX24SCpEo6AV8rcikfiAo
	MWVGG+rmu5ZeFkz16NYwaRzMQvHgtBFI1Zyl7ilqpkg97QDMGJRYZuKaFUb2aA==
X-Gm-Gg: ASbGncsUZ2n1ESt79/95Um/XtAVWVa6RFQh8E2sBuLWUpTPSsua/SLOh8ANjYzp6LQO
	phMV5uTtujotpTpZVtJj7XTat5bM4svTGlydLQlA381piHh3qdHsw9jN3JYDFuJH2rIcjo7RQYt
	VjjdfDSJruUokk1fw/TQEt+0O7H8s6aaVwdGfmwn4jr0JdQbgRhhnsUCeAOTSjdu7wD3I/SQPzV
	2ugymPbkWO77uRJi0685nJgEEu3T/w9vN+EvnZFVLstcRsfv0nSfkwWd+O+LjLWgX30dUd0f5XU
	ldM5FWSLycmULYhBfgDrlA6q7HT8SuLLqg8BmYeyOb5xXVzKSYHtPQQBf5Bt84lKiq7shrol9OJ
	vIhE3J2ee9tUiuha5oYdFPic=
X-Google-Smtp-Source: AGHT+IFyG+g4hGTng/NEgkLjmiA9QxJs0dJ0QqvLnawmZP6ziyEQHGJkxjwKxvRHrwOwoduKsU4nyA==
X-Received: by 2002:a05:6000:4109:b0:3a4:eb7a:2cda with SMTP id ffacd0b85a97d-3a6d13071ddmr8283629f8f.30.1750682586295;
        Mon, 23 Jun 2025 05:43:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190b00sm9157170f8f.87.2025.06.23.05.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:43:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/6] overview-manual: correct the bitbake tasks map section and diagram to account for sources in UNPACKDIR
Date: Mon, 23 Jun 2025 14:42:55 +0200
Message-Id: <20250623124257.1544615-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623124257.1544615-1-alex.kanavin@gmail.com>
References: <20250623124257.1544615-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 12:43:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7149

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/overview-manual/concepts.rst              | 4 ----
 documentation/overview-manual/svg/bitbake_tasks_map.svg | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/ove=
rview-manual/concepts.rst
index 590055501f9..b34de4d3610 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -2368,8 +2368,6 @@ The contents of ``libhello_0.1.bb`` are::
    # Change <username> accordingly
    SRC_URI =3D "git://github.com/<username>/libhello;branch=3Dmain;protoco=
l=3Dhttps"
=20
-   S =3D "${WORKDIR}/git"
-
    do_install(){
       install -d ${D}${includedir}
       install -d ${D}${libdir}
@@ -2394,8 +2392,6 @@ The contents of ``sayhello_0.1.bb`` are::
    DEPENDS +=3D "libhello"
    RDEPENDS:${PN} +=3D "libhello"
=20
-   S =3D "${WORKDIR}/git"
-
    do_install(){
       install -d ${D}/usr/bin
       install -m 0700 sayhello ${D}/usr/bin
diff --git a/documentation/overview-manual/svg/bitbake_tasks_map.svg b/docu=
mentation/overview-manual/svg/bitbake_tasks_map.svg
index 09ef36faae4..1ba962ccc61 100644
--- a/documentation/overview-manual/svg/bitbake_tasks_map.svg
+++ b/documentation/overview-manual/svg/bitbake_tasks_map.svg
@@ -1,4 +1,4 @@
 <?xml version=3D"1.0" encoding=3D"UTF-8"?>
 <!-- Do not edit this file with editors other than draw.io -->
 <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics=
/SVG/1.1/DTD/svg11.dtd">
-<svg xmlns=3D"http://www.w3.org/2000/svg" xmlns:xlink=3D"http://www.w3.org=
/1999/xlink" version=3D"1.1" width=3D"12270px" height=3D"3804px" viewBox=3D=
"-0.5 -0.5 12270 3804" content=3D"&lt;mxfile host=3D&quot;app.diagrams.net&=
quot; modified=3D&quot;2023-11-01T08:31:56.536Z&quot; agent=3D&quot;Mozilla=
/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.=
0.0.0 Safari/537.36&quot; etag=3D&quot;p-CQVME_iMteI52En1Eq&quot; version=
=3D&quot;22.0.8&quot; type=3D&quot;device&quot;&gt;&lt;diagram name=3D&quot=
;Page-1&quot; id=3D&quot;c7558073-3199-34d8-9f00-42111426c3f3&quot;&gt;7V1b=
c6M6tv41rprzYAohro9JnO7O2X1JJZk9Z89LCtvEZtox3oA7nfn1R1yEQcjmLmRHPVV7YowxRp+=
+dV9rAm9ef3/27d36m7d0NhNFXv6ewNlEUaCl6uj/oiPvyRFFM2FyZOW7y+QYOBx4dP/rpAfl9O=
jeXTpB4cTQ8zahuyseXHjbrbMIC8ds3/feiqe9eJvit+7slVM68LiwN+Wj/3KX4To5air64fgXx=
12t8TcD3UremduLnyvf22/T79t6Wyd559XGl0l/Y7C2l95b7hC8ncAb3/PC5K/X3zfOJnqu+Ikl=
n/t05N3sln1nG9b5gPOn9ja72cPZi/UlfHp//N+7+WoKLTO5zi97s08fRnq74Tt+OvHvc6LLgAm=
8flu7ofO4sxfRu28IEOjYOnzdpG+/uJvNjbfxfPQ6fhrwemkH6+zjL942/GS/upsIK1/duePboe=
tt0Tc+2tsgPeHR2/vx9ddhiCCgaPAK/Qf9tOg/0QmBtPK81caxd24gLbzX+I1FEJ/66SW5PPqz8=
AWacp1+RfnRpU/zl+OHzu/cofRRfna8Vyf00TVl/K6lpuuaYt7Er98OAFLM9Ng6Dx4tPWinoF1l=
Fz+sHvojXcAmi4l3XW7tnCUCevrS88O1t/K29ub2cPT6cPSr5+3SVfqPE4bv6T6196FXXGP02Pz=
3/0MvZMnQ8Ou/8m/OosckZ6/es1fLq2i7opeLjR0E7uJp7W6TNz65G3z9AmAWe//XeaAnwN97fI=
HSpQ9tf+WEJ89Mt2G0fifx6DsbdIe/ikRGg1b8UfT07ffcCTvPRY8jd+X76EAO5oZqFGBu6QTLV=
H1AT6nyAOzkHg4wz35Me+SrssEI+b/dMA989PKv3FsH2Ecv3vN7IPlUo91SQH4Q+t7PTDpBgmkn=
ClzKC8dRsjNz78jxv4+0e7BUG3v3mFZRSABACmniE4psnv7EMPsne7RCDWioBphytRqAl7CgBij=
qUGoAwoxYzDaLCWuspWIwXUugKsOv5SpSxVKZc4nrip6ijiRvfmmhVXNpARhsaXUGS3uJy5nR6S=
nKVdluUxmUlq5a/ywubidttLsyelA/K023FFsHm+38dUusMFaqlpbVt2bZzeSHJiPDpyVsihj/I=
CABUObC/jBBUephAjxmfUyx5kg/fyDbQ1UFhLmDMFThWUIYyOrJDwzlfyqrbgLDY2NYxVrZuWFY=
HZiH9+EP7fr+38Gnuf63/Cd0vb9n0ykQEOYQwup5ahLoE+xZmBrL1Ddhigb0ztIO7Wn09zTwF/E=
Z+t/7KAB7nSAkwgdCxxFsxMjIcAFnV/4iMsgX0YO7RkhHhqbjHy6J/lpF/x++7vBtpJfG75Q2XG=
NzH+/OdJvlPTlZvJl766y+6W+Q3nGzbPrTvDgDGv5tWLO74X/ZxrhV186Se2fHTmjAN84ZAb15/=
s9hGIgDmDVhwQEYKKOb8RhIZ6S3tXI2nuapS9LpMjKqQVsaV7QFNG0UISa81yNAr3e3Tl3o0Y1O=
zn1/GUZzCD3glY7RQtpOIQBXM/3to4BRhSpfPIjvnDP9Dd/D/HBAnRjX3/759enu29XNl+enq4f=
Pt0/PPx4nxiyn6M3JCwjlr6PyB4vKn0qLPLPV/nB6ghDd58qWsLbo7j2psSNbQi7ZcuPO1+j2PU=
F6/ZAeVHQJOzZS3tOUsY1eHCBh7XYTFHbCnK1BYXxlz2R3zhmFBfa7oLAeKcwyinrb+PyF6wfPj=
r8u2W6tnd6l633TWKugLMQZxLjUyjwdlDVPnj5MTDYzhwTSzxHp2nkiHRB1V4ygfl6k3sKG/zC4=
NziL0Fht6lvPys3zcaDFR1JiU0rV9REoVTHalDcI7YEPqCt67/EdJlCfamNoDzKf2YuyBKa+LDw=
RfTlTie4Y8sieCCifldLKA2S6UGftzEZD4YI6gSwXE7+ruNPST54/UAnZeYUDPgqIFU6KFxqDGE=
B1BA0AtqrAESgeHMW9B60YoVjDgGKKYv2sHL4fBcVQ46QlVmMU68YoKD4rx8OHQTEnkbfmKDbHc=
J9BU6CYRxSbxnmiuNSdkJFnjM+yOuEZGzRHx0yxOVqODq5OONWfTdT6dmVNnFJfo6kSZ6VLbRyn=
PUrTyl7bafAWh2tF6VI7MNIXv3cJ3pGr+KxcQhJiu/HsZSCkZD9SclrqZDp+ATruFHYOuSmXLUp=
rlxLhrsLc0BefpUQrN1QEcw3FXBCOzFzoFsZR6FOFLnuRU81OKHR9TIBooxTyANYurKjXZUVOkp=
0VIv1INSq8MsT5BoteawCWS6cQXa7382hxJUST9mtEejF37gPH39qvTnY0plDpUOZ0CVya225O/=
I+2EaEOLbjsiVGBQlKqSkknUiBLToVwnEzlzEgWnMqCU+tWfA6VAkIJExLuQ5lAePKj0k8dQN7Y=
Z15iZ6Ui8jMSPeud6flQSC/ouSd61samZ4BTshvRc8EtKKpK2PGsVlt3xSnuvFj0Wpl/OLHohUH=
fD78BItPXoBTVa0y5TSvHib/ZPx30XJzLWN2cpHrRov+lX52XYPE/mmzT4389rT1WL9K1z7Jb8o=
2wcG+/wgimoRZfhWfly2kzCJcHFHaQZXrdQK8KOZNlejm49vXu5vb74+3F0Qob1bhEH5RpfGzpQ=
wFtWuAydFR0bkRak3HEmGGgg9pKNx8zkohmFxasKNEiTtdZ+CPwQ81x6Iv7W9rZ4WJ9cSzKl3Jm=
URRz1uzKPFeqJbtKsqwXGNa0YAOORe/cO76LnprjT/rzMPMA8S6EWjcvQcGoHHvaEcmQ5klCJYf=
SyBCwYNRyzkTsrt24c2khKHVYSqU4ctlSataDjjMHW+gMNe2KE0wy9LBpxV4RozvYlJGajYuuu6=
f6SFVLVd667hplW4AH6greA9/zwunSCcKl6wsW64fFshY3J2gMKCx5DMoj56iIrmLHG95U05k1W=
h3Q6TvnjM58Z+HunGnKaoLN+mEzC9RgM8A07InbOgs244jNao9EMDirJDP4HIngvtorR5BYPyQG=
oSzhrkYneAx7mBjR2LgBfEFjJ8ipmsawD5QXGjNZDZYcZxLaKcwVQhIfB4C9t9XuKEcNLuXoPhC=
Ojb6kqCpLSjEHkpYHp0KcBc5Ijo7T84k/HuQBkh2oz6ybLwf6byfVEYF8NqNwt4vNfimMiN6MCE=
0iGoxalHm4GpQMpvxnnZU7hAfgdCGp2rlyFmf6mclnEGrjzgVB9UNQqmZl1HOCoJjrZ2XDIMvbE=
amQ/ebtQKUooIAMygAwKd56rNcPsPzlIiVcaCsFnlQeZCAQ0IkEFDI5DxhSubMkNQA9XPKWVdaQ=
CyCQyok2Agb9wkBVasNgMC6waDpIp3XPPfM056lQQmb7i1SD5V73bLC2AFaTPMB9SfIrq2cY6D9=
XztRbmCEM24P2kZdeSn5P7sP4KANFs8y6MZJWjuSiQ4Losi5rFY1QymVChG8TAPJKya/u3FJFJw=
qSAGbhujOmyA8Mk3CfLXaOrW8RS72Ha3e7ij4dwRYbb/Njgev5wZ6TX7zNMjIC5XBtR7/PDSIg+=
k7gxD+XfsHHvx4ffvx4ep7dPTweue6bG/+cOfpeeeHtXLRHI+LzHak/8ZIvFuWuTHnQ6lUyodGk=
GJV0RWK4zOxW1e+d3PwNSL6tiCqIF1FHpYC6zrYBMr5bMbsmE5pZFbOTQ4YZMXurwWsddTUVFtz=
EkmVZFdshfkWWF7aJuxUTBBrvIspOPOt9lfVOqlGf2LsTu9W+Ak01JlU1RtlXfLZ1XnrP7jYI7e=
gX1HO1I80gLG5le+OutujvBYJbtBmvI/3BXdibq/SNV3e5TEJLTuD+155vsNWdLi66rnY90WbRt=
RBRBAlnANrOy5SXY/oX1/uvvmKlGCSsKe1MLYpiRRomPVa8lWfAXLqjjlULGLO41kf8stSiWmM4=
tw3gM20LUdbC2764q72fGZNz/8BXgsY4oDEcZDRoOGZLW2YJxSLGyKo3gElxB7Btt6LQ4gpckFj=
a70cQGJcEhqPm9H5SVTHz4ehMoU3i4wLP+y0iyp8C0HwDWpHJTty06ZJsLQulss4uXbkD7kAegv=
IiW6/DQfgS/yucN8rWyEUtcnDHZyV3E/889OUy0Ha/k88QV9Hp8Y16WwstgrsLnGqNxg526PegF=
y/u70gLIpJBib1BuMFy72i6BowL2jXAqLNraO3rB9w1lV2PxK4xxK4Z0/qjaEuM90ilC0PsEVPs=
kREly5S0MCgeE8Z7ppzbwYmFgT6+iwcYCBODZ0iX8ktlmjubsYlR9gIKQUBcxRKCYExBAGptG7a=
yAFZ6T8W2AbLYN2NKG7VGpJzxruGzb1QUc/B2+40dOs8NW+EJxYkFlDVAJnNToJyN4GGEZeFlqp=
YAQEiAMYuezBrbhqkEgBrzEUrN0sk7p8qKFHQFZ23VGPzce1OadqmysKQqVeTKAo3oasIoWRbSr=
HViP/VaDMo1FBuEqci0UWo9jkqhwkyrGECDsFpwoRizPBKrYXBUsxrepJx0scnunDOrS4xZ7m/M=
MgSczVlW1LKDTMxZHia3VMFdkU80mGScXKoqpdW/1Gm4vC3+6GNys2YC3A9yzKk8jcbkinJIRVV=
r23gaHzbesYzloyZe6QOGysDCU8tpzIH9nhSTiYmNA5MnB1Nw1XKIBK//xa0+oyrC0irX1o+Gqy=
GEeG6GaMZxwZ5Qte5kAohHn48tJbXGnlAdT2pk6wlVaQmswhNazYaqBiTLKtoMHDQnUseZSCCmC=
5xak9qd6/oP5HREE5+pumJAWZ9OT9Xkb0JZ5mUVPMYPj2lKXR7TVL54DN85ZzwmBkT1yGIWjxOi=
0PMZhcfEhKi+ua+2oxbPxBm6+3A5dybrxV3RNLg341ErO1l5oNV51MxX0GpPymE0eco6/CtAztI=
o8XHGQ6gUnU8U4t51U1kCAo79wHEKiH7Q1JHwMtMMDX3k4QNV8rnofSu6juf2wlxS40OZ65iuSm=
TaA1WVKLqslfQm7u0QbZRtfCeKHB0tzjT4EHqEUVuPMBjpEWhPEUlPMhGtqTvFAOgVF+ppiEH5j=
tOCqGM3VvqArlV54+Gp8wfyxevVzSQqS0jUUgnJONLvEX1x/F1y/j11Ylz/68fDH7O7h4mB3vyU=
JC8ePluvoAXtiK/23NlMBqsY20SXRyy9dHxMikvnxd7H9xcgkexuV08xcSuHA1+dl5BrljotwEp=
iOKqt2m7RUqePapLG64+LZ2SCG2Qf+uRVR5LSiU94Ly+BM4xRgzPcOVMn8ba5ZE2yurosjSg2UT=
uJlJi0MjD9Tek1QA+6KTQhOQKT1sOL5kYfbOqZgoPKnIF5JmDMLYxBCcY0I0vRaX7UAYHMpwf/U=
QCZVyADrdpVwBzFfA7pqK15CxQzR7ECJQ7ZmE+Xq2BjbnE8zRLheIIxn310ngSMeYWxCrhUjit7=
6IwVAVu6vgAzt2AmRttZBiWay3JIu2LwORHK3S42e4RNAWZ+wQx1naRmGp5pw1QGxDOf+dMPtzd=
397fP6XRrgWleMW2ZUDKL00QNSsYNALoEWLqVoQZK6OCq/Vgh56FmYkGxNJ0D+B4FUHWWgZmeWV=
0wh+HES6a2yWfAQngWuCVJAEuzcwy1HHdjbZOZfAYshKuXYyCTEQseYMxnxGImYMwtjDVYjiDzg=
GQ+YxYir4d3PMtEAyONMkGJbVaPyaebLOr/7zvRw372nYW7E1MAuGxdYahEhiatnblCK6IYbgoA=
LpoT7Zp6a9ek6kXPEeKxekOyBmzXpFg0dbLT+n6MdjMmIYNorWayzGVGrWYstbR0XBU+fUC/n5U=
GgmtUKXPWXNtiNdCCv8r4DwlAKHPmeLb4zKEQLUJ6Kx42DS47hFhGC+YTHUL4o76643qg3HuTyo=
4IrJxdO2bWjaC/nuhPjzp5FOjPolgRzNt34JYiotMbN1yWKWc1uIyvTm/ZnXPGZRt3LnisHx6zT=
KuU6EfhMcZqXCbUc8CL3Zdo5aX1ZSwyNwMHTK0oxw6dz8bK9IRy2YGNG0BJgSeV8+UEAjqRAJEq=
gRBAG2ZP7749HAeUvdsFEEjlprYCBv3CQFVqw2A4LqBlGgwZ5LD9RaroypygpI+1JcOUNJIH0Ci=
vrK4MN29ErrSV24z5HqnOcO0G0UPaBN4k7vUT2u42OuKF6+h8OZoyGL1+8aNvwYd1+zXC53Ye7C=
a5Ced+lgbg7JAx5GwXrhNI6GOztHES+pW5d6Iv9pMnQl5gbgdRiD8CmJy9S32y5d+Ez9/jA6vFI=
qd578nzJoWB6jd9fCNakh16cD6i/qD+V8v2dtnt22udj26qwfM427SNlCWLLFukyUsME2takTN1=
2qB6WszfGEwnAnwa5Gnt0/Ps9vFJpN9xnH6nk6mktAKoQ8oKGw2PotAxjNngv2N/ZRTSqhe0meT=
dnJXTPcXYMYhn2VV6QQHOrOLFC6qMOnWgiE9D4HN8fOp84RNU5uIvsuU6SG74soj+Vxbmn91wvb=
9sB3u1DEfvKFBVtZ7yR6cqIMvqoFV2reAyt7zczfKJBwAOn1k6S+/5xQkX67Ite8Y21AWmvkf1b=
GQOkCpTUM0y+R2C6r7fydodgAcK3iM6WSYa+eheptMejWrfWHKV/AiNxg4KtAjuLnCq2d4Oduj3=
oBcv7u9IQhA6UW0i1nQNGJe0b6KusDX2DWS6bxQhDIQw6FkYaGMLA0UIg0phoAlhwJswoOwbtsI=
A8tk4BgmDhbd9cVd73xECgW9gA6AW0wkshZJLANjCWhHioNI2UIQ8GHXbgOptw1gY8Nm1JhYGcX=
KAEAW8Y1onMK3R8gtpofQBUV3pNReyIOqDKWTBiPsG1tk3bKWBymcKCpIG+y1C2E8hDPgGtULoN=
zTPJ1tJoFYau0ISCKNgVEFgVu8ZxlKgTZ0pw8rSC2oDAnHqfnX9qMpXZooKTYESDlHSe35d/NGm=
g8eBrBIZMcrpOeIWME6dPxlkjrgKBdPxh2G1/xw8NhgGwDj5gWFAnD1Yzoy2KJhz0YmGDCv5DxV=
9KbIUysAeWlPDPqr49+EP7fr+38Gnuf63/Cd0vb9n0ynOKGHHnHnerJpqkvVsmuTzq0+nVxe4ts=
1YFB5w2YWftTI/05eeDxXDJPzO+AccY2fyfLxfjmokOKBIP38oMi8P2tx4C3sjJXR6CbzJvMEvp=
Z0dpHX4Vcv82UcHBPom4rwlbIENaxLg+dSJ1mBDSntO+kIqfbNhR+dNOdVzPt/Y744fCA7ptZcS=
jUOoOS/DtVHRKuM17b3COd/ykfL9/Kivqpr9ZdLaIGpmsHK2aFWTpgVh1E+h+psmiC6NbACIMYv=
NlejQ9f139HKavLj/M36rWcn+IZR0t6Xdy8oNj/ykZHJD9IsWa3uLdj9arbDTbyp+Vy8dBxrtbu=
4IvNiHoA9DStFK+1ijzaWGB5WhULClDbeXFS7N+GhUiX0yR9/FB/7x3YvXB53tBP+TQ6h7fNOJ+=
C1XsSgyr9OkZCtTZdxw7QK1SveWiOCKVB6u0jppzdLZhnA1kQBXuWlUsWnGnK2F53DjpnW02VqM=
Nw23VZLuNgjt6BcI9YlnTAMIVNK6ADIlVMM2B04ThZLV2dBCGoy6c5ClUb1t2IoDXSmvsxi3MK5=
bXqs9Okbna3RMduecKRdRVr29EqNj+vIv6oQDxaA4F2kjkAf0n1hcAu/+j8+zi0bdWfcSBboFJZ=
zjg6FMGU0Pdcmghc0H6ydqsoqbZ1PfjO5j36rSlQrBdtGuMZPd1VIe106MnSqq48lwmTejKleUT=
EciPzFQfhF+tDlpcBVbeLvo93qRPUdvWl8MW85ykVaqNyI73/kdzaZzt6vjp+eu/Sl4D3zPC6fe=
NgIXzSLrJBuO+B+4C3wOO/BcB4akF91vtDHZyAajTrgbUFnRK/3W4wVBC4qycMFx6kjQDKS4qAS=
1UlzLbF1wejmtU7jgSBecaFY27s5RoYRLP/kJypjlgXDCCze2fl57dn3/+nlHHuYzxJcqF8E02G=
0KOYCX5xZh6Ywz5WpnHHXi3YAKbmUsbjRv3O3j00Uj77wdchaRY0TzxukUKA/nijOMUSRz5phr4=
pf7EFLZqiuVDciZVOYzRBHY7/FE2otmRabyWDGJQSkmZUYZ2/CYIaL83DEZ5qcaTMbZODF855wx=
2T7wBYn1RWLQJKuJLcq8ZRXSBi0OyGNtAqMjaWOC+6oZrbLwGAwT+qwRqZShQY4NT+42/SQB5T7=
Clkal/3wUXp0j/Ale7YtXoQSUIq8atJa4GqRGJYejVjy5jwK+YGdvOwU9PnmbpePHRcS+Y4cIIN=
Gv8qNiYjv+7853AidGuEutT8YHsmrh+6ubP64+3zYpzv5l+24cXYzHul+74bX9M/run1vvLbq1t=
7Ud3UAyd/0tvb24zHm3jyueEQ+vohP3QRzoRwecWvf66e5rhxt1ftuvu036hOt+WXRyXCz+vVGx=
uIy2Q1zr/ebGiFl5k4aV3g2/sJiG8RLDJH76blSLK7vBkIjIjiX4FrXltRhMkzUJFtsY0mrLoQK=
oBAZUMzs+AInxKUFFZsXZxIcNtSSgOcisMCsjeiKzIpoFLDIrRtw5AJKCgYPMCrxPheeTH+vfNM=
rW/5Ezrb7N/448zGdge+nsNt779KiSnLWm2f1c5Qix1LGmDXEKk79iWoiscJefYbXpaytIcVhSr=
B3YtjgLB+E754wUKWwYeygSP8Hz1cPNl6KvQlDf0NRHbbTFmPqqG221tkAQLcU+zthbOq/nHPR3=
r0F9l9VNrWsunXmDa8qeX+uq7u5n7atKZT/H09oJ8g5f75e7jB3B8/fyydV3k/pTntHz6/vx4Uu=
jx9jgKSZ+4/pXR4+zwdVjwRe7Zn0nNkARrUdb/Sb2R9eDGma+m69Xj4+NPNIvMUTC1EGeoeCwXg=
u0QxL/fVRcN+i9pK7peHvZu50TM3Dphmo6re++f7l9uHuq//VtvXfCi0zEwYgOAjQXskprwTio/=
1gF2iiKcZpfgP+uM8ihbRW2KLzO9OfqGT24e9vIhdeHqSc4ZJw2cTtWd136gCZXFGqrhM+b+MBk=
mDptqxyuwemoU1kCU1+WqEp7pl5UOzYuQWVn3gceWKpO5LBalNJpBdd5FFy5Cpk206PyXt3jrav=
yHtrBz+jeN0GkQSydSMGIjnuNotDN9ZqbNkpwC/9eo4B8U0tmAENmEDumseo7nD3S3vLp8HD2x3=
fKW7qVo70y9zZL6l6ptmEKMMqbLHTLcIIHJiS5QVmwvDBGYWu/xu8m+TfRHbbZMS2yVOqBNb30w=
3CXPuq5qmWbVrY8GZ5cWBhPeYGZlrpxZ08dF969W1qKQkxepvVAgbSpesAYygmnyqOkcfOw8u3N=
FlWu2y9KlUerfKMPj2rT3KC3KYo5+/ikSYx3YzrDZ/LhZyVSAUdfYL76H2Q3zllAKonSDyP0OEA=
a61R6aJA2Kst5sUccRuPUJ7UMrPOAmi78VLeAcgA/XkeCOh6EnBd1/tnt/dcffz3P7h6ea+vjx4=
LagmAaEoyqS7g9Op6GSKnkBorFtlRHlfnssn3Icn9+89H59RErkuJHINgm7mCtKGipeb3Z1EAmi=
b2qXJl1JFLigXHKESNS4gffN0T+E9N8eHo9NXNbvFl4uo2ZXbDTeYBOm3h+LT347kH7z+rd/e/1=
p6vdf7b6dbiWnWntNiI4esaLFgxoWjDV0S0014aaqwYI01jFzTxGy7xUQXUNW4cCc/8QNgqSsEr=
YIhvz7v6PvmM3D/ff2obpjl90dtsg7CL/o6SIL9bO4mf8xJ1d9FzzekJ2Un64sUhua1IiTXTOga=
opYbIr5LfRrEYg4SKjAbYgn+VLByfHRTtHz7s1J5IgZHknpGizJkWmDNadUwV8ekKevt0LMHMMZ=
hMW7TKFAmSmbWZVwGcN1eyrYGUugXyCgXVF0k2W2FWUFj6FHoNek0bR/nbJ9rUcEdyptrWcCp2D=
a3rfboVjOeqmLKmWnP0jQjOmIammZiBFJfkvoUUnP3mw5n0qHsfDGYOLoMyFBmWQ0lK0Mg2D4uJ=
hG5PBMkbEZE7EZEwRkxlz2wCiNIq2bZiGZMwW2lO3iIzx8UIyHTQhpW63IlXpvVtRu3JBiJU3DP=
F0LPvRckHyA3qqWw1a/Zc92IK0ECZlQ5OyF04kWxTRhmAz9YcorFiRPgE7swCraq+bUWkbO/I8q=
ZQaqVZrEmnWpIWXSLVS6Z1j2zTm/o/P/3q4e7qd3T00Ci/Wi1jmrt4szlgzeJm7fqN46+C1mEP1=
hiEN6YY/o1nBarE/DJOSO+78Xv2HdC2rKCGhCSRKSoUKdMmkOF+N0iyJ/sgJKkfJqXPj/q/uwtn=
G7YXijIGk7/06brvToDV75IPydntE1c7zxl00ALP9ElviNb/DDqOu8Scgf/LrkgZOcwexTNz5P+=
12hH97sH/Ff5a/I3kkWaOApqW2X+9unuPG/c83X/54/GeThBH3ZZJOIiDvaZOtXSxgtl5Y60Hef=
P3xeDtrT265sz5MX31KzXEPpDNViJk0hkWbFAKVw6imQv2uPFwnDhUe93Z3Jp1UIzqMwUgAvA/i=
6v+4s1fgoCeL6CSWdwt351B6ks3t5AMxMtAOcf1M95TQX+m3rO0g+xlJ97LWTQXIrMXo4NPVw+f=
bp+c/b7/PfkSdAaaFwz8em03LEFttoK2m6hrZ9Z/akQyqdPE+lG+QmRnc2qJtEU09bt5+jLpqSB=
ksT199zhK2YTmDd+FtX6ZItXACKfwdXpz7jlG7LdL/BiEllEfrhqgMRTygTYfwEbI4moxk/Oj9H=
HBqf/XQxdEajNNvh70QbCUD5Ul9GSiwWBeLnMlAfOOcpfkEQYjMoenCXhxcAReZrsmyjKpWgxEg=
Qwk3nGFTSKUed/iNCcHHx6erp1uRL8xlvjCO9KpQskz5aA4lraCDDu8+Qr8nJz5TegJfHIAYmRc=
mUCXLKqw0kCltAGkzDZVeIhf0lYbM9TqgWnnNbipLsgyr1Lvo1b3ju+hXR8mrTSL5x9U8HtDYXn=
+DuAVNZSxfGS+Wf9K2GdBxnY0xjqZi2O42Ce/Hilkaws581vJ8725iJ/U+jKdM5wqX807vaEbKY=
WR1dNIh7pNebVKIUy3d6GNJzGextrdxM103eoXHXafxreQS+OsT7/r+EDVK3g7sV4fSuFf4n/vy=
P2d9pU4IYuo4DGswB9DxUuHO+2RQbTW/iMkSUvZpMopo6aKtE3q+6xAZOEg38+N9Zy8WvhdkGzX=
AOySwfyUXiJvFBzGY8QggvKVDJDCOasJiKw0WNdUP4VCs7Jg1d5M6lKqjVHoNOksdDOb3ouDxEI=
P7eYYvgj7YRykT8UynOq3zX5P2Gv3mVAXLJvlNdedspekPDe5W5Er1Y26Q7S8UnZa2cCxVarg9W=
Ok26a75uXG6Qm772fF9ldC6sd8dPziC8FQzy9Q9JI68fSxS0IUDN9Et39ZOhJON56VZWYlmiR6V=
HcnT09rah4HzMCIGyERijkqL11F76g9WRVSj9K4ruuP/RFk1CRJf3NU+W+Ai8hNEOkGAnrFrbxK=
Tws8+1ljufLu6+XL3/XYAKTG7e3x6+CFkxPibysJ5rJnSRpEZKk1pG2xLDTptyonZOgiSOTeJVb=
H23iYnkl5TtwxS5pwp2mThNDY1ps72lwArYwkAcFA603Eo49FUkLX96huw1Poa2tiDo0srVy8t5=
dkVx0dGJ+VjGkceI+VhH49QQLIWjWK8UWvRhnqqNLXx7J4qWfUcDfij1C/QOkIO9mBp7T/P7sHK=
xIMFQKY8Vkp69mCPlZaZfX6Plai3MSCFX1mClaZen9tTBWpprCfUqXVMPT1a9NL3Ir0ne+8zehD=
rb97Sic74fw=3D=3D&lt;/diagram&gt;&lt;/mxfile&gt;" style=3D"background-color=
: rgb(255, 255, 255);"><defs><style type=3D"text/css">@import url(https://f=
onts.googleapis.com/css?family=3DLiberation+Sans);&#xa;</style></defs><g><r=
ect x=3D"9428" y=3D"2640" width=3D"1120" height=3D"600" rx=3D"90" ry=3D"90"=
 fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-dasharray=
=3D"12 12" pointer-events=3D"all"/><path d=3D"M 8868 3120.57 Q 8656.57 3120=
.57 8656.57 1980.33" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"=
4" stroke-miterlimit=3D"10" stroke-dasharray=3D"12 12" pointer-events=3D"st=
roke"/><path d=3D"M 8656.57 1959.33 L 8665.9 1987.33 L 8656.57 1980.33 L 86=
47.24 1987.33 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=
=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/><path d=3D"M 9228 3=
600 Q 9228 3760.57 9608 3760.57 Q 9988 3760.57 9988 3280.42" fill=3D"none" =
stroke=3D"#000000" stroke-width=3D"12" stroke-miterlimit=3D"10" pointer-eve=
nts=3D"stroke"/><path d=3D"M 9988 3253.42 L 10006 3289.42 L 9988 3280.42 L =
9970 3289.42 Z" fill=3D"#000000" stroke=3D"#000000" stroke-width=3D"12" str=
oke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"8868" y=3D"2640" w=
idth=3D"480" height=3D"960" rx=3D"72" ry=3D"72" fill=3D"none" stroke=3D"rgb=
(0, 0, 0)" stroke-width=3D"4" stroke-dasharray=3D"12 12" pointer-events=3D"=
all"/><rect x=3D"2868" y=3D"2640" width=3D"1080" height=3D"960" rx=3D"144" =
ry=3D"144" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-=
dasharray=3D"12 12" pointer-events=3D"all"/><rect x=3D"1082" y=3D"840" widt=
h=3D"1080" height=3D"440" rx=3D"66" ry=3D"66" fill=3D"none" stroke=3D"rgb(0=
, 0, 0)" stroke-width=3D"4" stroke-dasharray=3D"12 12" pointer-events=3D"al=
l"/><rect x=3D"2148" y=3D"2640" width=3D"560" height=3D"960" rx=3D"84" ry=
=3D"84" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-das=
harray=3D"12 12" pointer-events=3D"all"/><path d=3D"M 4928 160 L 4928 360" =
fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=
=3D"10" pointer-events=3D"stroke"/><path d=3D"M 4928.57 160 L 4928.57 200.5=
7 Q 4928.57 240.57 4888.57 240.57 L 1662.29 240.57 Q 1622.29 240.57 1622.19=
 280.57 L 1622.06 334.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-widt=
h=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 16=
22.01 355.53 L 1608.08 327.49 L 1622.06 334.53 L 1636.08 327.56 Z" fill=3D"=
rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=
=3D"10" pointer-events=3D"all"/><path d=3D"M 4928.57 160 L 4928.57 200.57 Q=
 4928.57 240.57 4968.57 240.57 L 5808.57 240.57 Q 5848.57 240.57 5848.38 28=
0.57 L 5848.12 334.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=
=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 584=
8.02 355.53 L 5834.16 327.46 L 5848.12 334.53 L 5862.16 327.6 Z" fill=3D"rg=
b(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D=
"10" pointer-events=3D"all"/><path d=3D"M 4928.57 160 L 4928.57 200.57 Q 49=
28.57 240.57 4968.57 240.57 L 7273.71 240.57 Q 7313.71 240.57 7313.81 280.5=
7 L 7313.94 334.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4=
" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 7313.99 =
355.53 L 7299.92 327.56 L 7313.94 334.53 L 7327.92 327.49 Z" fill=3D"rgb(0,=
 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10"=
 pointer-events=3D"all"/><path d=3D"M 4928.57 160 L 4928.57 200.57 Q 4928.5=
7 240.57 4888.57 240.57 L 2620 240.57 Q 2580 240.57 2580.01 280.57 L 2580.0=
2 334.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-m=
iterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 2580.02 355.53 L 2=
566.01 327.53 L 2580.02 334.53 L 2594.01 327.53 Z" fill=3D"rgb(0, 0, 0)" st=
roke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-e=
vents=3D"all"/><rect x=3D"4788" y=3D"0" width=3D"280" height=3D"160" rx=3D"=
24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-wi=
dth=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale=
(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" height=
=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibil=
ity" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://ww=
w.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; ju=
stify-content: unsafe center; width: 68px; height: 1px; padding-top: 20px; =
margin-left: 1198px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " sty=
le=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div sty=
le=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation=
 Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; wh=
ite-space: normal; overflow-wrap: normal;"><font data-font-src=3D"https://f=
onts.googleapis.com/css?family=3DArchitects+Daughter">tmp</font></div></div=
></div></foreignObject><text x=3D"1232" y=3D"24" fill=3D"rgb(0, 0, 0)" font=
-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">tmp</=
text></switch></g><path d=3D"M 4928 520 L 4928 1040" fill=3D"none" stroke=
=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-event=
s=3D"stroke"/><rect x=3D"4788" y=3D"360" width=3D"280" height=3D"160" rx=3D=
"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-w=
idth=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scal=
e(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" height=
=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibil=
ity" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://ww=
w.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; ju=
stify-content: unsafe center; width: 68px; height: 1px; padding-top: 110px;=
 margin-left: 1198px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " st=
yle=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div st=
yle=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberatio=
n Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; w=
hite-space: normal; overflow-wrap: normal;"><font data-font-src=3D"https://=
fonts.googleapis.com/css?family=3DArchitects+Daughter">work</font></div></d=
iv></div></foreignObject><text x=3D"1232" y=3D"114" fill=3D"rgb(0, 0, 0)" f=
ont-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">wo=
rk</text></switch></g><path d=3D"M 4928 1200 L 4928.29 1240.57 Q 4928.57 12=
80.57 4968.57 1280.57 L 5648.57 1280.57 Q 5688.57 1280.57 5688.57 1320.29 L=
 5688.57 1360" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" str=
oke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 4928 1200 L 4=
928.29 1240.57 Q 4928.57 1280.57 4888.57 1280.57 L 3156 1280.57 Q 3116 1280=
.57 3115.98 1320.29 L 3115.96 1360" fill=3D"none" stroke=3D"rgb(0, 0, 0)" s=
troke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path=
 d=3D"M 4588 1120 Q 4398.29 1120.57 4398.24 1334.53" fill=3D"none" stroke=
=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" stroke-dashar=
ray=3D"12 12" pointer-events=3D"stroke"/><path d=3D"M 4398.24 1355.53 L 438=
8.91 1327.53 L 4398.24 1334.53 L 4407.58 1327.53 Z" fill=3D"rgb(0, 0, 0)" s=
troke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-=
events=3D"all"/><rect x=3D"4588" y=3D"1040" width=3D"680" height=3D"160" rx=
=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" strok=
e-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)s=
cale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" heig=
ht=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensib=
ility" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://=
www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; =
justify-content: unsafe center; width: 168px; height: 1px; padding-top: 280=
px; margin-left: 1148px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); "=
 style=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div=
 style=3D"display: inline-block; font-size: 12px; font-family: &quot;Libera=
tion Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all=
; white-space: normal; overflow-wrap: normal;"><font data-font-src=3D"https=
://fonts.googleapis.com/css?family=3DArchitects+Daughter"><b>${MULTIMACH_TA=
RGET_OS}</b></font></div></div></div></foreignObject><text x=3D"1232" y=3D"=
284" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12p=
x" text-anchor=3D"middle">${MULTIMACH_TARGET_OS}</text></switch></g><path d=
=3D"M 3115.96 1520 L 3116 1680" fill=3D"none" stroke=3D"rgb(0, 0, 0)" strok=
e-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><rect x=
=3D"2975.96" y=3D"1360" width=3D"280" height=3D"160" rx=3D"24" ry=3D"24" fi=
ll=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" pointe=
r-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><fo=
reignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" required=
Features=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"over=
flow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtm=
l" style=3D"display: flex; align-items: unsafe center; justify-content: uns=
afe center; width: 68px; height: 1px; padding-top: 360px; margin-left: 745p=
x;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: =
border-box; font-size: 0px; text-align: center;"><div style=3D"display: inl=
ine-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color=
: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal;=
 overflow-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.co=
m/css?family=3DArchitects+Daughter">libhello</font></div></div></div></fore=
ignObject><text x=3D"779" y=3D"364" fill=3D"rgb(0, 0, 0)" font-family=3D"Li=
beration Sans" font-size=3D"12px" text-anchor=3D"middle">libhello</text></s=
witch></g><path d=3D"M 5688.57 1520 L 5688.57 1560.57 Q 5688.57 1600.57 568=
8.57 1570.29 L 5688.57 1555.14 Q 5688.57 1540 5688.29 1580 L 5688 1620" fil=
l=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"=
10" pointer-events=3D"stroke"/><rect x=3D"5548" y=3D"1360" width=3D"280" he=
ight=3D"160" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(=
0, 0, 0)" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"transl=
ate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" widt=
h=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/f=
eature#Extensibility" style=3D"overflow: visible; text-align: left;"><div x=
mlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: =
unsafe center; justify-content: unsafe center; width: 68px; height: 1px; pa=
dding-top: 360px; margin-left: 1388px;"><div data-drawio-colors=3D"color: r=
gb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-align:=
 center;"><div style=3D"display: inline-block; font-size: 12px; font-family=
: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; point=
er-events: all; white-space: normal; overflow-wrap: normal;"><font data-fon=
t-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">say=
hello</font></div></div></div></foreignObject><text x=3D"1422" y=3D"364" fi=
ll=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text=
-anchor=3D"middle">sayhello</text></switch></g><path d=3D"M 3116 1840 L 311=
6 1960.57 Q 3116 2000.57 3076 2000.57 L 2036 2000.57 Q 1996 2000.57 1996 20=
40.57 L 1996 2134.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D=
"4" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 1996 2=
155.53 L 1986.67 2127.53 L 1996 2134.53 L 2005.33 2127.53 Z" fill=3D"rgb(0,=
 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10"=
 pointer-events=3D"all"/><path d=3D"M 3116 1840 L 3116 1960.57 Q 3116 2000.=
57 3076 2000.57 L 2468 2000.57 Q 2428 2000.57 2428 2040.57 L 2428 2134.53" =
fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=
=3D"10" pointer-events=3D"stroke"/><path d=3D"M 2428 2155.53 L 2418.67 2127=
.53 L 2428 2134.53 L 2437.33 2127.53 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb=
(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"al=
l"/><path d=3D"M 3116 1840 L 3115.96 2134.53" fill=3D"none" stroke=3D"rgb(0=
, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"stro=
ke"/><path d=3D"M 3115.96 2155.53 L 3101.96 2127.53 L 3115.96 2134.53 L 312=
9.96 2127.53 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=
=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/><path d=3D"M 3116 1=
840 L 3116 1960.57 Q 3116 2000.57 3156 2000.57 L 4268 2000.57 Q 4308 2000.5=
7 4308 2040.57 L 4308 2134.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke=
-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D=
"M 4308 2155.53 L 4294 2127.53 L 4308 2134.53 L 4322 2127.53 Z" fill=3D"rgb=
(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"=
10" pointer-events=3D"all"/><path d=3D"M 3116 1840 L 3116 1960.57 Q 3116 20=
00.57 3076 2000.57 L 1508 2000.57 Q 1468 2000.57 1468 2040.57 L 1468 2134.5=
3" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlim=
it=3D"10" pointer-events=3D"stroke"/><path d=3D"M 1468 2155.53 L 1458.67 21=
27.53 L 1468 2134.53 L 1477.33 2127.53 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"r=
gb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"=
all"/><rect x=3D"2976" y=3D"1680" width=3D"280" height=3D"160" rx=3D"24" ry=
=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D=
"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><=
switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%=
" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" sty=
le=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org=
/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-co=
ntent: unsafe center; width: 68px; height: 1px; padding-top: 440px; margin-=
left: 745px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"bo=
x-sizing: border-box; font-size: 0px; text-align: center;"><div style=3D"di=
splay: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&qu=
ot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-spac=
e: normal; overflow-wrap: normal;"><font data-font-src=3D"https://fonts.goo=
gleapis.com/css?family=3DArchitects+Daughter">0.1-r0</font></div></div></di=
v></foreignObject><text x=3D"779" y=3D"444" fill=3D"rgb(0, 0, 0)" font-fami=
ly=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">0.1-r0</te=
xt></switch></g><path d=3D"M 5688.57 1780 L 5688.57 1960.57 Q 5688.57 2000.=
57 5648.57 2000.57 L 5568.57 2000.57 Q 5528.57 2000.57 5528.43 2040.57 L 55=
28.09 2134.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" str=
oke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 5528.02 2155.=
53 L 5514.12 2127.48 L 5528.09 2134.53 L 5542.12 2127.58 Z" fill=3D"rgb(0, =
0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" =
pointer-events=3D"all"/><path d=3D"M 5688.57 1780 L 5688.57 1960.57 Q 5688.=
57 2000.57 5728.57 2000.57 L 6988 2000.57 Q 7028 2000.57 7028 2040.57 L 702=
8 2134.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-=
miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 7028 2155.53 L 70=
14 2127.53 L 7028 2134.53 L 7042 2127.53 Z" fill=3D"rgb(0, 0, 0)" stroke=3D=
"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=
=3D"all"/><path d=3D"M 5688.57 1780 L 5688.57 1960.57 Q 5688.57 2000.57 572=
8.57 2000.57 L 7676 2000.57 Q 7716 2000.57 7715.99 2040.57 L 7715.97 2134.5=
3" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlim=
it=3D"10" pointer-events=3D"stroke"/><path d=3D"M 7715.96 2155.53 L 7701.97=
 2127.52 L 7715.97 2134.53 L 7729.97 2127.53 Z" fill=3D"rgb(0, 0, 0)" strok=
e=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-even=
ts=3D"all"/><path d=3D"M 5688.57 1780 L 5688.57 1960.57 Q 5688.57 2000.57 5=
728.57 2000.57 L 8313.71 2000.57 Q 8353.71 2000.57 8353.79 2040.57 L 8353.9=
5 2134.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-=
miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 8353.99 2155.53 L=
 8339.94 2127.55 L 8353.95 2134.53 L 8367.94 2127.5 Z" fill=3D"rgb(0, 0, 0)=
" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" point=
er-events=3D"all"/><path d=3D"M 5688.57 1780 L 5688.57 1960.57 Q 5688.57 20=
00.57 5728.57 2000.57 L 9068 2000.57 Q 9108 2000.57 9108 2040.57 L 9108 213=
4.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miter=
limit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 9108 2155.53 L 9094 21=
27.53 L 9108 2134.53 L 9122 2127.53 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(=
0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all=
"/><path d=3D"M 5688.57 1780 L 5688.57 1960.57 Q 5688.57 2000.57 5728.57 20=
00.57 L 9948 2000.57 Q 9988 2000.57 9988 2040.57 L 9988 2134.53" fill=3D"no=
ne" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" poi=
nter-events=3D"stroke"/><path d=3D"M 9988 2155.53 L 9974 2127.53 L 9988 213=
4.53 L 10002 2127.53 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" strok=
e-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"5=
548" y=3D"1620" width=3D"280" height=3D"160" rx=3D"24" ry=3D"24" fill=3D"rg=
b(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" pointer-events=
=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObj=
ect pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=
=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: vi=
sible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 68px; height: 1px; padding-top: 425px; margin-left: 1388px;"><di=
v data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-=
box; font-size: 0px; text-align: center;"><div style=3D"display: inline-blo=
ck; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0=
, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overfl=
ow-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.com/css?f=
amily=3DArchitects+Daughter">0.1-r0</font></div></div></div></foreignObject=
><text x=3D"1422" y=3D"429" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation=
 Sans" font-size=3D"12px" text-anchor=3D"middle">0.1-r0</text></switch></g>=
<path d=3D"M 1622.29 520 L 1622.29 560.57 Q 1622.29 600.57 1622.29 560.57 L=
 1622.29 540.57 Q 1622.29 520.57 1622.29 560.29 L 1622.29 600" fill=3D"none=
" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" point=
er-events=3D"stroke"/><path d=3D"M 1762 440 Q 2215.43 440.57 2215.04 205.47=
" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimi=
t=3D"10" stroke-dasharray=3D"12 12" pointer-events=3D"stroke"/><path d=3D"M=
 2215.01 184.47 L 2224.39 212.46 L 2215.04 205.47 L 2205.72 212.49 Z" fill=
=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterli=
mit=3D"10" pointer-events=3D"all"/><rect x=3D"1482" y=3D"360" width=3D"280"=
 height=3D"160" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"r=
gb(0, 0, 0)" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"tra=
nslate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" w=
idth=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG1=
1/feature#Extensibility" style=3D"overflow: visible; text-align: left;"><di=
v xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-item=
s: unsafe center; justify-content: unsafe center; width: 68px; height: 1px;=
 padding-top: 110px; margin-left: 371px;"><div data-drawio-colors=3D"color:=
 rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-alig=
n: center;"><div style=3D"display: inline-block; font-size: 12px; font-fami=
ly: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; poi=
nter-events: all; white-space: normal; overflow-wrap: normal;"><font data-f=
ont-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">d=
ownloads</font></div></div></div></foreignObject><text x=3D"405" y=3D"114" =
fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" te=
xt-anchor=3D"middle">downloads</text></switch></g><path d=3D"M 1622 760 L 1=
622.14 800.57 Q 1622.29 840.57 1622.29 800.57 L 1622.29 780.57 Q 1622.29 76=
0.57 1622.29 800.29 L 1622.29 840" fill=3D"none" stroke=3D"rgb(0, 0, 0)" st=
roke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><rect =
x=3D"1482" y=3D"600" width=3D"280" height=3D"160" rx=3D"24" ry=3D"24" fill=
=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" pointer-=
events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><fore=
ignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFe=
atures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overfl=
ow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml"=
 style=3D"display: flex; align-items: unsafe center; justify-content: unsaf=
e center; width: 68px; height: 1px; padding-top: 170px; margin-left: 371px;=
"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: bo=
rder-box; font-size: 0px; text-align: center;"><div style=3D"display: inlin=
e-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: =
rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; o=
verflow-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.com/=
css?family=3DArchitects+Daughter">git2</font></div></div></div></foreignObj=
ect><text x=3D"405" y=3D"174" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberati=
on Sans" font-size=3D"12px" text-anchor=3D"middle">git2</text></switch></g>=
<path d=3D"M 2082 1160 L 2628 1160.53 Q 2668 1160.57 2668 1200.57 L 2668 22=
00.57 Q 2668 2240.57 2628 2240.41 L 2568.42 2240.16" fill=3D"none" stroke=
=3D"#000000" stroke-width=3D"12" stroke-miterlimit=3D"10" pointer-events=3D=
"stroke"/><path d=3D"M 2541.42 2240.05 L 2577.49 2222.2 L 2568.42 2240.16 L=
 2577.34 2258.2 Z" fill=3D"#000000" stroke=3D"#000000" stroke-width=3D"12" =
stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"1162" y=3D"880"=
 width=3D"920" height=3D"160" rx=3D"24" ry=3D"24" fill=3D"#eeeeee" stroke=
=3D"#36393d" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"tra=
nslate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" w=
idth=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG1=
1/feature#Extensibility" style=3D"overflow: visible; text-align: left;"><di=
v xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-item=
s: unsafe center; justify-content: unsafe center; width: 228px; height: 1px=
; padding-top: 240px; margin-left: 291px;"><div data-drawio-colors=3D"color=
: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-ali=
gn: center;"><div style=3D"display: inline-block; font-size: 12px; font-fam=
ily: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; po=
inter-events: all; white-space: normal; overflow-wrap: normal;">github.com.=
&lt;username&gt;.sayhello</div></div></div></foreignObject><text x=3D"405" =
y=3D"244" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=
=3D"12px" text-anchor=3D"middle">github.com.&lt;username&gt;.sayhello</text=
></switch></g><path d=3D"M 2082 960 L 6628 960.57 Q 6668 960.57 6668 1000.5=
7 L 6668 2200.57 Q 6668 2240.57 6708 2240.48 L 6887.58 2240.09" fill=3D"non=
e" stroke=3D"#000000" stroke-width=3D"12" stroke-miterlimit=3D"10" pointer-=
events=3D"stroke"/><path d=3D"M 6914.58 2240.03 L 6878.62 2258.11 L 6887.58=
 2240.09 L 6878.54 2222.11 Z" fill=3D"#000000" stroke=3D"#000000" stroke-wi=
dth=3D"12" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"1162=
" y=3D"1080" width=3D"920" height=3D"160" rx=3D"24" ry=3D"24" fill=3D"#eeee=
ee" stroke=3D"#36393d" stroke-width=3D"4" pointer-events=3D"all"/><g transf=
orm=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=
=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.=
org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-align:=
 left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex;=
 align-items: unsafe center; justify-content: unsafe center; width: 228px; =
height: 1px; padding-top: 290px; margin-left: 291px;"><div data-drawio-colo=
rs=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0p=
x; text-align: center;"><div style=3D"display: inline-block; font-size: 12p=
x; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-heig=
ht: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">=
github.com.&lt;username&gt;.libhello</div></div></div></foreignObject><text=
 x=3D"405" y=3D"294" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" =
font-size=3D"12px" text-anchor=3D"middle">github.com.&lt;username&gt;.libhe=
llo</text></switch></g><path d=3D"M 2428 2320 Q 2428 2320 2428 2614.53" fil=
l=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"=
10" pointer-events=3D"stroke"/><path d=3D"M 2428 2635.53 L 2414 2607.53 L 2=
428 2614.53 L 2442 2607.53 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)"=
 stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect =
x=3D"2328" y=3D"2160" width=3D"200" height=3D"160" rx=3D"24" ry=3D"24" fill=
=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" pointer-=
events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><fore=
ignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFe=
atures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overfl=
ow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml"=
 style=3D"display: flex; align-items: unsafe center; justify-content: unsaf=
e center; width: 48px; height: 1px; padding-top: 560px; margin-left: 583px;=
"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: bo=
rder-box; font-size: 0px; text-align: center;"><div style=3D"display: inlin=
e-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: =
rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; o=
verflow-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.com/=
css?family=3DArchitects+Daughter">git</font></div></div></div></foreignObje=
ct><text x=3D"607" y=3D"564" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberatio=
n Sans" font-size=3D"12px" text-anchor=3D"middle">git</text></switch></g><r=
ect x=3D"2212" y=3D"2720" width=3D"456" height=3D"80" rx=3D"12" ry=3D"12" f=
ill=3D"#f5f5f5" stroke=3D"#666666" stroke-width=3D"4" pointer-events=3D"all=
"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject poi=
nter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"htt=
p://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; =
text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"dis=
play: flex; align-items: unsafe center; justify-content: unsafe center; wid=
th: 112px; height: 1px; padding-top: 690px; margin-left: 554px;"><div data-=
drawio-colors=3D"color: #333333; " style=3D"box-sizing: border-box; font-si=
ze: 0px; text-align: center;"><div style=3D"display: inline-block; font-siz=
e: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(51, 51, 51); =
line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: =
normal;">Makefile</div></div></div></foreignObject><text x=3D"610" y=3D"694=
" fill=3D"#333333" font-family=3D"Liberation Sans" font-size=3D"12px" text-=
anchor=3D"middle">Makefile</text></switch></g><path d=3D"M 2212 2880.57 L 2=
117.14 2880.57 Q 2077.14 2880.57 2077.14 2840.57 L 2077.14 2714.86 Q 2077.1=
4 2674.86 2037.14 2674.9 L 1966.47 2674.97" fill=3D"none" stroke=3D"rgb(0, =
0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" stroke-dasharray=3D"12 1=
2" pointer-events=3D"stroke"/><path d=3D"M 1945.47 2675 L 1973.46 2665.63 L=
 1966.47 2674.97 L 1973.48 2684.3 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0,=
 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/=
><rect x=3D"2212" y=3D"2840" width=3D"456" height=3D"80" rx=3D"12" ry=3D"12=
" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" pointer-events=3D"=
all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject =
pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"=
http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visibl=
e; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"=
display: flex; align-items: unsafe center; justify-content: unsafe center; =
width: 112px; height: 1px; padding-top: 720px; margin-left: 554px;"><div da=
ta-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box;=
 font-size: 0px; text-align: center;"><div style=3D"display: inline-block; =
font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0,=
 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-w=
rap: normal;">LICENSE</div></div></div></foreignObject><text x=3D"610" y=3D=
"724" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12=
px" text-anchor=3D"middle">LICENSE</text></switch></g><path d=3D"M 2212 300=
0 Q 2028 3000.57 2028 3060.57 Q 2028 3120.57 2171.58 3120.13" fill=3D"none"=
 stroke=3D"#000000" stroke-width=3D"12" stroke-miterlimit=3D"10" pointer-ev=
ents=3D"stroke"/><path d=3D"M 2198.58 3120.04 L 2162.62 3132.15 L 2171.58 3=
120.13 L 2162.55 3108.15 Z" fill=3D"#000000" stroke=3D"#000000" stroke-widt=
h=3D"12" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"2212" =
y=3D"2960" width=3D"456" height=3D"80" rx=3D"12" ry=3D"12" fill=3D"#f5f5f5"=
 stroke=3D"#666666" stroke-width=3D"4" pointer-events=3D"all"/><g transform=
=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"=
none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/=
TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-align: lef=
t;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; ali=
gn-items: unsafe center; justify-content: unsafe center; width: 112px; heig=
ht: 1px; padding-top: 750px; margin-left: 554px;"><div data-drawio-colors=
=3D"color: #333333; " style=3D"box-sizing: border-box; font-size: 0px; text=
-align: center;"><div style=3D"display: inline-block; font-size: 12px; font=
-family: &quot;Liberation Sans&quot;; color: rgb(51, 51, 51); line-height: =
1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">fix.=
patch</div></div></div></foreignObject><text x=3D"610" y=3D"754" fill=3D"#3=
33333" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"mi=
ddle">fix.patch</text></switch></g><path d=3D"M 2214.74 3151.44 Q 1988 3151=
.43 1988 3278.29 Q 1988 3405.14 2179.58 3405.02" fill=3D"none" stroke=3D"#0=
00000" stroke-width=3D"12" stroke-miterlimit=3D"10" pointer-events=3D"strok=
e"/><path d=3D"M 2206.58 3405.01 L 2170.6 3423.03 L 2179.58 3405.02 L 2170.=
57 3387.03 Z" fill=3D"#000000" stroke=3D"#000000" stroke-width=3D"12" strok=
e-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"2212" y=3D"3080" wid=
th=3D"456" height=3D"80" rx=3D"12" ry=3D"12" fill=3D"#f5f5f5" stroke=3D"#66=
6666" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(=
-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=3D=
"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/featu=
re#Extensibility" style=3D"overflow: visible; text-align: left;"><div xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsa=
fe center; justify-content: unsafe center; width: 112px; height: 1px; paddi=
ng-top: 780px; margin-left: 554px;"><div data-drawio-colors=3D"color: #3333=
33; " style=3D"box-sizing: border-box; font-size: 0px; text-align: center;"=
><div style=3D"display: inline-block; font-size: 12px; font-family: &quot;L=
iberation Sans&quot;; color: rgb(51, 51, 51); line-height: 1.2; pointer-eve=
nts: all; white-space: normal; overflow-wrap: normal;">hellolib.c</div></di=
v></div></foreignObject><text x=3D"610" y=3D"784" fill=3D"#333333" font-fam=
ily=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">hellolib.=
c</text></switch></g><rect x=3D"1896" y=3D"2160" width=3D"200" height=3D"16=
0" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" =
stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -=
0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%"=
 height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Ext=
ensibility" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"ht=
tp://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe cen=
ter; justify-content: unsafe center; width: 48px; height: 1px; padding-top:=
 560px; margin-left: 475px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0)=
; " style=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><=
div style=3D"display: inline-block; font-size: 12px; font-family: &quot;Lib=
eration Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: =
all; white-space: normal; overflow-wrap: normal;"><font data-font-src=3D"ht=
tps://fonts.googleapis.com/css?family=3DArchitects+Daughter">temp</font></d=
iv></div></div></foreignObject><text x=3D"499" y=3D"564" fill=3D"rgb(0, 0, =
0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middl=
e">temp</text></switch></g><path d=3D"M 4308 2320 L 4308 2640" fill=3D"none=
" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" point=
er-events=3D"stroke"/><rect x=3D"4068" y=3D"2160" width=3D"480" height=3D"1=
60" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)"=
 stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 =
-0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%=
" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Ex=
tensibility" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"h=
ttp://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe ce=
nter; justify-content: unsafe center; width: 118px; height: 1px; padding-to=
p: 560px; margin-left: 1018px;"><div data-drawio-colors=3D"color: rgb(0, 0,=
 0); " style=3D"box-sizing: border-box; font-size: 0px; text-align: center;=
"><div style=3D"display: inline-block; font-size: 12px; font-family: &quot;=
Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-event=
s: all; white-space: normal; overflow-wrap: normal;"><font data-font-src=3D=
"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">sysroot-des=
tdir</font></div></div></div></foreignObject><text x=3D"1077" y=3D"564" fil=
l=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-=
anchor=3D"middle">sysroot-destdir</text></switch></g><path d=3D"M 5528 2320=
 L 5528 2614.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" s=
troke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 5528 2635.5=
3 L 5518.67 2607.53 L 5528 2614.53 L 5537.33 2607.53 Z" fill=3D"rgb(0, 0, 0=
)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" poin=
ter-events=3D"all"/><rect x=3D"5308" y=3D"2160" width=3D"440" height=3D"160=
" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" s=
troke-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0=
.5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" =
height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Exte=
nsibility" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"htt=
p://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe cent=
er; justify-content: unsafe center; width: 108px; height: 1px; padding-top:=
 560px; margin-left: 1328px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0=
); " style=3D"box-sizing: border-box; font-size: 0px; text-align: center;">=
<div style=3D"display: inline-block; font-size: 12px; font-family: &quot;Li=
beration Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events:=
 all; white-space: normal; overflow-wrap: normal;"><font data-font-src=3D"h=
ttps://fonts.googleapis.com/css?family=3DArchitects+Daughter">recipe-sysroo=
t</font></div></div></div></foreignObject><text x=3D"1382" y=3D"564" fill=
=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-a=
nchor=3D"middle">recipe-sysroot</text></switch></g><path d=3D"M 3116 2320 L=
 3116 2694.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" str=
oke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 3116 2715.53 =
L 3106.67 2687.53 L 3116 2694.53 L 3125.33 2687.53 Z" fill=3D"rgb(0, 0, 0)"=
 stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointe=
r-events=3D"all"/><rect x=3D"2989.96" y=3D"2160" width=3D"252" height=3D"16=
0" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" =
stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -=
0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%"=
 height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Ext=
ensibility" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"ht=
tp://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe cen=
ter; justify-content: unsafe center; width: 61px; height: 1px; padding-top:=
 560px; margin-left: 748px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0)=
; " style=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><=
div style=3D"display: inline-block; font-size: 12px; font-family: &quot;Lib=
eration Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: =
all; white-space: normal; overflow-wrap: normal;"><font data-font-src=3D"ht=
tps://fonts.googleapis.com/css?family=3DArchitects+Daughter">image</font></=
div></div></div></foreignObject><text x=3D"779" y=3D"564" fill=3D"rgb(0, 0,=
 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"midd=
le">image</text></switch></g><path d=3D"M 3116 2880 L 3116 2920.57 Q 3116 2=
960.57 3115.99 2987.55 L 3115.99 3014.53" fill=3D"none" stroke=3D"rgb(0, 0,=
 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/=
><path d=3D"M 3115.98 3035.53 L 3106.65 3007.53 L 3115.99 3014.53 L 3125.32=
 3007.53 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4=
" stroke-miterlimit=3D"10" pointer-events=3D"all"/><path d=3D"M 3116 2880 Q=
 3116 2960.57 3354.86 2960.57 Q 3593.71 2960.57 3593.91 3014.53" fill=3D"no=
ne" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" poi=
nter-events=3D"stroke"/><path d=3D"M 3593.98 3035.53 L 3584.55 3007.56 L 35=
93.91 3014.53 L 3603.22 3007.49 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0=
, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/><=
rect x=3D"3029" y=3D"2720" width=3D"174" height=3D"160" rx=3D"24" ry=3D"24"=
 fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" poi=
nter-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch>=
<foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" requi=
redFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"o=
verflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/x=
html" style=3D"display: flex; align-items: unsafe center; justify-content: =
unsafe center; width: 42px; height: 1px; padding-top: 700px; margin-left: 7=
58px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizin=
g: border-box; font-size: 0px; text-align: center;"><div style=3D"display: =
inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; co=
lor: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: norm=
al; overflow-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis=
.com/css?family=3DArchitects+Daughter">usr</font></div></div></div></foreig=
nObject><text x=3D"779" y=3D"704" fill=3D"rgb(0, 0, 0)" font-family=3D"Libe=
ration Sans" font-size=3D"12px" text-anchor=3D"middle">usr</text></switch><=
/g><path d=3D"M 3115.98 3200 L 3116 3294.53" fill=3D"none" stroke=3D"rgb(0,=
 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"strok=
e"/><path d=3D"M 3116 3315.53 L 3106.66 3287.53 L 3116 3294.53 L 3125.33 32=
87.53 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" s=
troke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"3008.48" y=3D"30=
40" width=3D"215" height=3D"160" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, =
255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" pointer-events=3D"all"/><g=
 transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-=
events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://w=
ww.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-=
align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display:=
 flex; align-items: unsafe center; justify-content: unsafe center; width: 5=
2px; height: 1px; padding-top: 780px; margin-left: 753px;"><div data-drawio=
-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-siz=
e: 0px; text-align: center;"><div style=3D"display: inline-block; font-size=
: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line=
-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: norm=
al;"><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchi=
tects+Daughter">include</font></div></div></div></foreignObject><text x=3D"=
779" y=3D"784" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-s=
ize=3D"12px" text-anchor=3D"middle">include</text></switch></g><path d=3D"M=
 3593.71 3200 L 3593.71 3240.57 Q 3593.71 3280.57 3593.76 3287.55 L 3593.82=
 3294.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-m=
iterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 3593.97 3315.53 L =
3579.77 3287.63 L 3593.82 3294.53 L 3607.76 3287.43 Z" fill=3D"rgb(0, 0, 0)=
" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" point=
er-events=3D"all"/><rect x=3D"3507" y=3D"3040" width=3D"174" height=3D"160"=
 rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" st=
roke-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.=
5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" h=
eight=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Exten=
sibility" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http=
://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe cente=
r; justify-content: unsafe center; width: 42px; height: 1px; padding-top: 7=
80px; margin-left: 878px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); =
" style=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><di=
v style=3D"display: inline-block; font-size: 12px; font-family: &quot;Liber=
ation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: al=
l; white-space: normal; overflow-wrap: normal;"><font data-font-src=3D"http=
s://fonts.googleapis.com/css?family=3DArchitects+Daughter">lib</font></div>=
</div></div></foreignObject><text x=3D"899" y=3D"784" fill=3D"rgb(0, 0, 0)"=
 font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">=
lib</text></switch></g><rect x=3D"2956" y=3D"3320" width=3D"320" height=3D"=
100" rx=3D"15" ry=3D"15" fill=3D"#f5f5f5" stroke=3D"#666666" stroke-width=
=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)=
"><switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"1=
00%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" =
style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.=
org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify=
-content: unsafe center; width: 78px; height: 1px; padding-top: 843px; marg=
in-left: 740px;"><div data-drawio-colors=3D"color: #333333; " style=3D"box-=
sizing: border-box; font-size: 0px; text-align: center;"><div style=3D"disp=
lay: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot=
;; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-spa=
ce: normal; overflow-wrap: normal;">hellolib.h</div></div></div></foreignOb=
ject><text x=3D"779" y=3D"846" fill=3D"#333333" font-family=3D"Liberation S=
ans" font-size=3D"12px" text-anchor=3D"middle">hellolib.h</text></switch></=
g><rect x=3D"3348" y=3D"3350" width=3D"480" height=3D"80" rx=3D"12" ry=3D"1=
2" fill=3D"#f5f5f5" stroke=3D"#666666" stroke-width=3D"4" pointer-events=3D=
"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject=
 pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D=
"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visib=
le; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D=
"display: flex; align-items: unsafe center; justify-content: unsafe center;=
 width: 118px; height: 1px; padding-top: 848px; margin-left: 838px;"><div d=
ata-drawio-colors=3D"color: #333333; " style=3D"box-sizing: border-box; fon=
t-size: 0px; text-align: center;"><div style=3D"display: inline-block; font=
-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(51, 51, 5=
1); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wr=
ap: normal;">libhello.so.1</div></div></div></foreignObject><text x=3D"897"=
 y=3D"851" fill=3D"#333333" font-family=3D"Liberation Sans" font-size=3D"12=
px" text-anchor=3D"middle">libhello.so.1</text></switch></g><rect x=3D"3348=
" y=3D"3450" width=3D"480" height=3D"100" rx=3D"15" ry=3D"15" fill=3D"#f5f5=
f5" stroke=3D"#666666" stroke-width=3D"4" pointer-events=3D"all"/><g transf=
orm=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=
=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.=
org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-align:=
 left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex;=
 align-items: unsafe center; justify-content: unsafe center; width: 118px; =
height: 1px; padding-top: 875px; margin-left: 838px;"><div data-drawio-colo=
rs=3D"color: #333333; " style=3D"box-sizing: border-box; font-size: 0px; te=
xt-align: center;"><div style=3D"display: inline-block; font-size: 12px; fo=
nt-family: &quot;Liberation Sans&quot;; color: rgb(51, 51, 51); line-height=
: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">li=
bhello.so.1.0</div></div></div></foreignObject><text x=3D"897" y=3D"879" fi=
ll=3D"#333333" font-family=3D"Liberation Sans" font-size=3D"12px" text-anch=
or=3D"middle">libhello.so.1.0</text></switch></g><rect x=3D"3320" y=3D"3320=
" width=3D"548" height=3D"250" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke=
-width=3D"4" stroke-dasharray=3D"12 12" pointer-events=3D"all"/><path d=3D"=
M 4428 3600 Q 4428 3760.57 4978.29 3760.57 Q 5528.57 3760.57 5528.14 3640.4=
2" fill=3D"none" stroke=3D"#000000" stroke-width=3D"12" stroke-miterlimit=
=3D"10" pointer-events=3D"stroke"/><path d=3D"M 5528.05 3613.42 L 5546.18 3=
649.35 L 5528.14 3640.42 L 5510.18 3649.48 Z" fill=3D"#000000" stroke=3D"#0=
00000" stroke-width=3D"12" stroke-miterlimit=3D"10" pointer-events=3D"all"/=
><rect x=3D"4068" y=3D"2640" width=3D"480" height=3D"960" rx=3D"72" ry=3D"7=
2" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" stroke-dasharray=
=3D"12 12" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scal=
e(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" height=
=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibil=
ity" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://ww=
w.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; ju=
stify-content: unsafe center; width: 118px; height: 1px; padding-top: 780px=
; margin-left: 1018px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " s=
tyle=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div s=
tyle=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberati=
on Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; =
white-space: normal; overflow-wrap: normal;">Everything in <b>image</b> fol=
der that is present in <b>SYSROOT_DIRS</b> will be copied here.</div></div>=
</div></foreignObject><text x=3D"1077" y=3D"784" fill=3D"rgb(0, 0, 0)" font=
-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">Every=
thing in image...</text></switch></g><path d=3D"M 3678 3600 Q 3678.29 3760.=
57 3993.14 3760.57 Q 4308 3760.57 4308 3640.42" fill=3D"none" stroke=3D"#00=
0000" stroke-width=3D"12" stroke-miterlimit=3D"10" pointer-events=3D"stroke=
"/><path d=3D"M 4308 3613.42 L 4326 3649.42 L 4308 3640.42 L 4290 3649.42 Z=
" fill=3D"#000000" stroke=3D"#000000" stroke-width=3D"12" stroke-miterlimit=
=3D"10" pointer-events=3D"all"/><path d=3D"M 2428 3600 Q 2428 3760.57 2941.=
14 3760.57 Q 3454.29 3760.57 3454.4 3639.46" fill=3D"none" stroke=3D"#00000=
0" stroke-width=3D"12" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/>=
<path d=3D"M 3454.43 3612.46 L 3472.39 3648.47 L 3454.4 3639.46 L 3436.39 3=
648.44 Z" fill=3D"#000000" stroke=3D"#000000" stroke-width=3D"12" stroke-mi=
terlimit=3D"10" pointer-events=3D"all"/><rect x=3D"2748" y=3D"3680" width=
=3D"360" height=3D"120" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D=
"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><=
switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%=
" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" sty=
le=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org=
/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-co=
ntent: unsafe center; width: 1px; height: 1px; padding-top: 935px; margin-l=
eft: 732px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box=
-sizing: border-box; font-size: 0px; text-align: center;"><div style=3D"dis=
play: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quo=
t;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space=
: nowrap;"><font data-font-src=3D"https://fonts.googleapis.com/css?family=
=3DArchitects+Daughter">do_install</font></div></div></div></foreignObject>=
<text x=3D"732" y=3D"939" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation S=
ans" font-size=3D"12px" text-anchor=3D"middle">do_install</text></switch></=
g><rect x=3D"2220" y=3D"3350" width=3D"456" height=3D"110" rx=3D"16.5" ry=
=3D"16.5" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" pointer-ev=
ents=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreig=
nObject pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeat=
ures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow=
: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" s=
tyle=3D"display: flex; align-items: unsafe center; justify-content: unsafe =
center; width: 112px; height: 1px; padding-top: 851px; margin-left: 556px;"=
><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: bor=
der-box; font-size: 0px; text-align: center;"><div style=3D"display: inline=
-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: r=
gb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; ov=
erflow-wrap: normal;">libhello.so.1.0</div></div></div></foreignObject><tex=
t x=3D"612" y=3D"855" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans"=
 font-size=3D"12px" text-anchor=3D"middle">libhello.so.1.0</text></switch><=
/g><rect x=3D"1668" y=3D"3180" width=3D"440" height=3D"120" fill=3D"#eeeeee=
" stroke=3D"#36393d" stroke-width=3D"4" pointer-events=3D"all"/><g transfor=
m=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D=
"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org=
/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-align: le=
ft;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; al=
ign-items: unsafe center; justify-content: unsafe center; width: 1px; heigh=
t: 1px; padding-top: 810px; margin-left: 472px;"><div data-drawio-colors=3D=
"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; te=
xt-align: center;"><div style=3D"display: inline-block; font-size: 12px; fo=
nt-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1=
.2; pointer-events: all; white-space: nowrap;"><font data-font-src=3D"https=
://fonts.googleapis.com/css?family=3DArchitects+Daughter">do_configure<br /=
></font></div></div></div></foreignObject><text x=3D"472" y=3D"814" fill=3D=
"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-anch=
or=3D"middle">do_configure&#xa;</text></switch></g><rect x=3D"2212" y=3D"32=
00" width=3D"456" height=3D"80" rx=3D"12" ry=3D"12" fill=3D"#f5f5f5" stroke=
=3D"#666666" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"tra=
nslate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" w=
idth=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG1=
1/feature#Extensibility" style=3D"overflow: visible; text-align: left;"><di=
v xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-item=
s: unsafe center; justify-content: unsafe center; width: 112px; height: 1px=
; padding-top: 810px; margin-left: 554px;"><div data-drawio-colors=3D"color=
: #333333; " style=3D"box-sizing: border-box; font-size: 0px; text-align: c=
enter;"><div style=3D"display: inline-block; font-size: 12px; font-family: =
&quot;Liberation Sans&quot;; color: rgb(51, 51, 51); line-height: 1.2; poin=
ter-events: all; white-space: normal; overflow-wrap: normal;">hellolib.h</d=
iv></div></div></foreignObject><text x=3D"610" y=3D"814" fill=3D"#333333" f=
ont-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">he=
llolib.h</text></switch></g><rect x=3D"1788" y=3D"3000" width=3D"320" heigh=
t=3D"120" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" pointer-ev=
ents=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreig=
nObject pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeat=
ures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow=
: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" s=
tyle=3D"display: flex; align-items: unsafe center; justify-content: unsafe =
center; width: 1px; height: 1px; padding-top: 765px; margin-left: 487px;"><=
div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: borde=
r-box; font-size: 0px; text-align: center;"><div style=3D"display: inline-b=
lock; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb=
(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: nowrap;"><fo=
nt data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Da=
ughter">do_patch<br /></font></div></div></div></foreignObject><text x=3D"4=
87" y=3D"769" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-si=
ze=3D"12px" text-anchor=3D"middle">do_patch&#xa;</text></switch></g><rect x=
=3D"2494" y=3D"1620" width=3D"360" height=3D"120" fill=3D"#eeeeee" stroke=
=3D"#36393d" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"tra=
nslate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" w=
idth=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG1=
1/feature#Extensibility" style=3D"overflow: visible; text-align: left;"><di=
v xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-item=
s: unsafe center; justify-content: unsafe center; width: 1px; height: 1px; =
padding-top: 420px; margin-left: 669px;"><div data-drawio-colors=3D"color: =
rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-align=
: center;"><div style=3D"display: inline-block; font-size: 12px; font-famil=
y: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; poin=
ter-events: all; white-space: nowrap;"><font data-font-src=3D"https://fonts=
.googleapis.com/css?family=3DArchitects+Daughter">do_unpack<br /></font></d=
iv></div></div></foreignObject><text x=3D"669" y=3D"424" fill=3D"rgb(0, 0, =
0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middl=
e">do_unpack&#xa;</text></switch></g><ellipse cx=3D"2434" cy=3D"1680" rx=3D=
"60.00000000000001" ry=3D"60.00000000000001" fill=3D"#000000" stroke=3D"#56=
517e" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(=
-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=3D=
"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/featu=
re#Extensibility" style=3D"overflow: visible; text-align: left;"><div xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsa=
fe center; justify-content: unsafe center; width: 28px; height: 1px; paddin=
g-top: 420px; margin-left: 595px;"><div data-drawio-colors=3D"color: rgb(0,=
 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-align: cent=
er;"><div style=3D"display: inline-block; font-size: 12px; font-family: &qu=
ot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-ev=
ents: all; white-space: normal; overflow-wrap: normal;"><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter" color=3D=
"#ffffff" size=3D"1"><b style=3D"font-size: 15px;">6</b></font></div></div>=
</div></foreignObject><text x=3D"609" y=3D"424" fill=3D"rgb(0, 0, 0)" font-=
family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">6</tex=
t></switch></g><ellipse cx=3D"1728" cy=3D"3060" rx=3D"60.00000000000001" ry=
=3D"60.00000000000001" fill=3D"#000000" stroke=3D"#56517e" stroke-width=3D"=
4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><s=
witch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%"=
 requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" styl=
e=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-con=
tent: unsafe center; width: 28px; height: 1px; padding-top: 765px; margin-l=
eft: 418px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box=
-sizing: border-box; font-size: 0px; text-align: center;"><div style=3D"dis=
play: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quo=
t;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space=
: normal; overflow-wrap: normal;"><font data-font-src=3D"https://fonts.goog=
leapis.com/css?family=3DArchitects+Daughter" color=3D"#ffffff" size=3D"1"><=
b style=3D"font-size: 15px;">7</b></font></div></div></div></foreignObject>=
<text x=3D"432" y=3D"769" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation S=
ans" font-size=3D"12px" text-anchor=3D"middle">7</text></switch></g><ellips=
e cx=3D"1608" cy=3D"3240" rx=3D"60.00000000000001" ry=3D"60.00000000000001"=
 fill=3D"#000000" stroke=3D"#56517e" stroke-width=3D"4" pointer-events=3D"a=
ll"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject p=
ointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"h=
ttp://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible=
; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"d=
isplay: flex; align-items: unsafe center; justify-content: unsafe center; w=
idth: 28px; height: 1px; padding-top: 810px; margin-left: 388px;"><div data=
-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; f=
ont-size: 0px; text-align: center;"><div style=3D"display: inline-block; fo=
nt-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0=
); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wra=
p: normal;"><font data-font-src=3D"https://fonts.googleapis.com/css?family=
=3DArchitects+Daughter" color=3D"#ffffff" size=3D"1"><b style=3D"font-size:=
 15px;">8</b></font></div></div></div></foreignObject><text x=3D"402" y=3D"=
814" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12p=
x" text-anchor=3D"middle">8</text></switch></g><rect x=3D"1748" y=3D"3310" =
width=3D"360" height=3D"120" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-wid=
th=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(=
4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D=
"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility=
" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w=
3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justi=
fy-content: unsafe center; width: 1px; height: 1px; padding-top: 843px; mar=
gin-left: 482px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=
=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div style=
=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation S=
ans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; whit=
e-space: nowrap;"><font data-font-src=3D"https://fonts.googleapis.com/css?f=
amily=3DArchitects+Daughter">do_compile<br /></font></div></div></div></for=
eignObject><text x=3D"482" y=3D"846" fill=3D"rgb(0, 0, 0)" font-family=3D"L=
iberation Sans" font-size=3D"12px" text-anchor=3D"middle">do_compile&#xa;</=
text></switch></g><ellipse cx=3D"1688" cy=3D"3370" rx=3D"60.00000000000001"=
 ry=3D"60.00000000000001" fill=3D"#000000" stroke=3D"#56517e" stroke-width=
=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)=
"><switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"1=
00%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" =
style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.=
org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify=
-content: unsafe center; width: 28px; height: 1px; padding-top: 843px; marg=
in-left: 408px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D=
"box-sizing: border-box; font-size: 0px; text-align: center;"><div style=3D=
"display: inline-block; font-size: 12px; font-family: &quot;Liberation Sans=
&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-s=
pace: normal; overflow-wrap: normal;"><font data-font-src=3D"https://fonts.=
googleapis.com/css?family=3DArchitects+Daughter" color=3D"#ffffff" size=3D"=
1"><b style=3D"font-size: 15px;">9</b></font></div></div></div></foreignObj=
ect><text x=3D"422" y=3D"846" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberati=
on Sans" font-size=3D"12px" text-anchor=3D"middle">9</text></switch></g><el=
lipse cx=3D"2688" cy=3D"3740" rx=3D"60.00000000000001" ry=3D"60.00000000000=
001" fill=3D"#000000" stroke=3D"#56517e" stroke-width=3D"4" pointer-events=
=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObj=
ect pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=
=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: vi=
sible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 28px; height: 1px; padding-top: 935px; margin-left: 658px;"><div=
 data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-b=
ox; font-size: 0px; text-align: center;"><div style=3D"display: inline-bloc=
k; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0,=
 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflo=
w-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.com/css?fa=
mily=3DArchitects+Daughter" color=3D"#ffffff" size=3D"1"><b style=3D"font-s=
ize: 15px;">10</b></font></div></div></div></foreignObject><text x=3D"672" =
y=3D"939" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=
=3D"12px" text-anchor=3D"middle">10</text></switch></g><rect x=3D"3728" y=
=3D"3680" width=3D"640" height=3D"120" fill=3D"#eeeeee" stroke=3D"#36393d" =
stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -=
0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%"=
 height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Ext=
ensibility" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"ht=
tp://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe cen=
ter; justify-content: unsafe center; width: 1px; height: 1px; padding-top: =
935px; margin-left: 1012px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0)=
; " style=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><=
div style=3D"display: inline-block; font-size: 12px; font-family: &quot;Lib=
eration Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: =
all; white-space: nowrap;"><font data-font-src=3D"https://fonts.googleapis.=
com/css?family=3DArchitects+Daughter">do_populate_sysroot</font></div></div=
></div></foreignObject><text x=3D"1012" y=3D"939" fill=3D"rgb(0, 0, 0)" fon=
t-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">do_p=
opulate_sysroot</text></switch></g><ellipse cx=3D"3668" cy=3D"3740" rx=3D"6=
0.00000000000001" ry=3D"60.00000000000001" fill=3D"#000000" stroke=3D"#5651=
7e" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0=
.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"1=
00%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature=
#Extensibility" style=3D"overflow: visible; text-align: left;"><div xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsa=
fe center; justify-content: unsafe center; width: 28px; height: 1px; paddin=
g-top: 935px; margin-left: 903px;"><div data-drawio-colors=3D"color: rgb(0,=
 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-align: cent=
er;"><div style=3D"display: inline-block; font-size: 12px; font-family: &qu=
ot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-ev=
ents: all; white-space: normal; overflow-wrap: normal;"><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter" color=3D=
"#ffffff" size=3D"1"><b style=3D"font-size: 15px;">11</b></font></div></div=
></div></foreignObject><text x=3D"917" y=3D"939" fill=3D"rgb(0, 0, 0)" font=
-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">11</t=
ext></switch></g><path d=3D"M 7028 3280 Q 7028 3760.57 7372 3760.57 Q 7716 =
3760.57 7715.97 3640.42" fill=3D"none" stroke=3D"#000000" stroke-width=3D"1=
2" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 7715.96=
 3613.42 L 7733.97 3649.41 L 7715.97 3640.42 L 7697.97 3649.42 Z" fill=3D"#=
000000" stroke=3D"#000000" stroke-width=3D"12" stroke-miterlimit=3D"10" poi=
nter-events=3D"all"/><rect x=3D"6748" y=3D"2640" width=3D"560" height=3D"64=
0" rx=3D"84" ry=3D"84" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=
=3D"4" stroke-dasharray=3D"12 12" pointer-events=3D"all"/><path d=3D"M 7028=
 2320 Q 7028 2320 7028 2614.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" strok=
e-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=
=3D"M 7028 2635.53 L 7014 2607.53 L 7028 2614.53 L 7042 2607.53 Z" fill=3D"=
rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=
=3D"10" pointer-events=3D"all"/><rect x=3D"6928" y=3D"2160" width=3D"200" h=
eight=3D"160" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb=
(0, 0, 0)" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"trans=
late(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" wid=
th=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/=
feature#Extensibility" style=3D"overflow: visible; text-align: left;"><div =
xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items:=
 unsafe center; justify-content: unsafe center; width: 48px; height: 1px; p=
adding-top: 560px; margin-left: 1733px;"><div data-drawio-colors=3D"color: =
rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-align=
: center;"><div style=3D"display: inline-block; font-size: 12px; font-famil=
y: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; poin=
ter-events: all; white-space: normal; overflow-wrap: normal;"><font data-fo=
nt-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">gi=
t</font></div></div></div></foreignObject><text x=3D"1757" y=3D"564" fill=
=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-a=
nchor=3D"middle">git</text></switch></g><rect x=3D"6800" y=3D"2720" width=
=3D"456" height=3D"80" rx=3D"12" ry=3D"12" fill=3D"#f5f5f5" stroke=3D"#6666=
66" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0=
.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"1=
00%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature=
#Extensibility" style=3D"overflow: visible; text-align: left;"><div xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsa=
fe center; justify-content: unsafe center; width: 112px; height: 1px; paddi=
ng-top: 690px; margin-left: 1701px;"><div data-drawio-colors=3D"color: #333=
333; " style=3D"box-sizing: border-box; font-size: 0px; text-align: center;=
"><div style=3D"display: inline-block; font-size: 12px; font-family: &quot;=
Liberation Sans&quot;; color: rgb(51, 51, 51); line-height: 1.2; pointer-ev=
ents: all; white-space: normal; overflow-wrap: normal;">Makefile</div></div=
></div></foreignObject><text x=3D"1757" y=3D"694" fill=3D"#333333" font-fam=
ily=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">Makefile<=
/text></switch></g><rect x=3D"6800" y=3D"2840" width=3D"456" height=3D"80" =
rx=3D"12" ry=3D"12" fill=3D"#f5f5f5" stroke=3D"#666666" stroke-width=3D"4" =
pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><swit=
ch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" re=
quiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=
=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1=
999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-cont=
ent: unsafe center; width: 112px; height: 1px; padding-top: 720px; margin-l=
eft: 1701px;"><div data-drawio-colors=3D"color: #333333; " style=3D"box-siz=
ing: border-box; font-size: 0px; text-align: center;"><div style=3D"display=
: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; =
color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space:=
 normal; overflow-wrap: normal;">LICENSE</div></div></div></foreignObject><=
text x=3D"1757" y=3D"724" fill=3D"#333333" font-family=3D"Liberation Sans" =
font-size=3D"12px" text-anchor=3D"middle">LICENSE</text></switch></g><path =
d=3D"M 6800 3000 Q 6588 3000.57 6588 3088 Q 6588 3175.43 6759.58 3175.08" f=
ill=3D"none" stroke=3D"#000000" stroke-width=3D"12" stroke-miterlimit=3D"10=
" pointer-events=3D"stroke"/><path d=3D"M 6786.58 3175.03 L 6750.62 3193.1 =
L 6759.58 3175.08 L 6750.55 3157.1 Z" fill=3D"#000000" stroke=3D"#000000" s=
troke-width=3D"12" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=
=3D"6800" y=3D"2960" width=3D"456" height=3D"80" rx=3D"12" ry=3D"12" fill=
=3D"#f5f5f5" stroke=3D"#666666" stroke-width=3D"4" pointer-events=3D"all"/>=
<g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointe=
r-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http:/=
/www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; tex=
t-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"displa=
y: flex; align-items: unsafe center; justify-content: unsafe center; width:=
 112px; height: 1px; padding-top: 750px; margin-left: 1701px;"><div data-dr=
awio-colors=3D"color: #333333; " style=3D"box-sizing: border-box; font-size=
: 0px; text-align: center;"><div style=3D"display: inline-block; font-size:=
 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(51, 51, 51); li=
ne-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: no=
rmal;">sayhello.c</div></div></div></foreignObject><text x=3D"1757" y=3D"75=
4" fill=3D"#333333" font-family=3D"Liberation Sans" font-size=3D"12px" text=
-anchor=3D"middle">sayhello.c</text></switch></g><rect x=3D"6800" y=3D"3120=
" width=3D"456" height=3D"110" rx=3D"16.5" ry=3D"16.5" fill=3D"#eeeeee" str=
oke=3D"#36393d" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"=
translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none=
" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/S=
VG11/feature#Extensibility" style=3D"overflow: visible; text-align: left;">=
<div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-i=
tems: unsafe center; justify-content: unsafe center; width: 112px; height: =
1px; padding-top: 794px; margin-left: 1701px;"><div data-drawio-colors=3D"c=
olor: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text=
-align: center;"><div style=3D"display: inline-block; font-size: 12px; font=
-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2=
; pointer-events: all; white-space: normal; overflow-wrap: normal;">sayhell=
o</div></div></div></foreignObject><text x=3D"1757" y=3D"797" fill=3D"rgb(0=
, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"=
middle">sayhello</text></switch></g><path d=3D"M 7835.96 3600 Q 7828 3760.5=
7 8090.86 3760.57 Q 8353.71 3760.57 8353.94 3640.42" fill=3D"none" stroke=
=3D"#000000" stroke-width=3D"12" stroke-miterlimit=3D"10" pointer-events=3D=
"stroke"/><path d=3D"M 8353.99 3613.42 L 8371.93 3649.45 L 8353.94 3640.42 =
L 8335.93 3649.38 Z" fill=3D"#000000" stroke=3D"#000000" stroke-width=3D"12=
" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"7475.96" y=3D=
"2640" width=3D"480" height=3D"960" rx=3D"72" ry=3D"72" fill=3D"none" strok=
e=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-dasharray=3D"12 12" pointer-ev=
ents=3D"all"/><path d=3D"M 7715.96 2320 L 7715.96 2614.53" fill=3D"none" st=
roke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-e=
vents=3D"stroke"/><path d=3D"M 7715.96 2635.53 L 7706.63 2607.53 L 7715.96 =
2614.53 L 7725.29 2607.53 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" =
stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=
=3D"7589.96" y=3D"2160" width=3D"252" height=3D"160" rx=3D"24" ry=3D"24" fi=
ll=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" pointe=
r-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><fo=
reignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" required=
Features=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"over=
flow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtm=
l" style=3D"display: flex; align-items: unsafe center; justify-content: uns=
afe center; width: 61px; height: 1px; padding-top: 560px; margin-left: 1898=
px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing:=
 border-box; font-size: 0px; text-align: center;"><div style=3D"display: in=
line-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; colo=
r: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal=
; overflow-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.c=
om/css?family=3DArchitects+Daughter">image</font></div></div></div></foreig=
nObject><text x=3D"1929" y=3D"564" fill=3D"rgb(0, 0, 0)" font-family=3D"Lib=
eration Sans" font-size=3D"12px" text-anchor=3D"middle">image</text></switc=
h></g><path d=3D"M 7716 2880 L 7716 2940 Q 7716 2980 7716.01 3017.26 L 7716=
.01 3054.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" strok=
e-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 7716.02 3075.53=
 L 7706.68 3047.53 L 7716.01 3054.53 L 7725.35 3047.53 Z" fill=3D"rgb(0, 0,=
 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" po=
inter-events=3D"all"/><rect x=3D"7629" y=3D"2720" width=3D"174" height=3D"1=
60" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)"=
 stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 =
-0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%=
" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Ex=
tensibility" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"h=
ttp://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe ce=
nter; justify-content: unsafe center; width: 42px; height: 1px; padding-top=
: 700px; margin-left: 1908px;"><div data-drawio-colors=3D"color: rgb(0, 0, =
0); " style=3D"box-sizing: border-box; font-size: 0px; text-align: center;"=
><div style=3D"display: inline-block; font-size: 12px; font-family: &quot;L=
iberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events=
: all; white-space: normal; overflow-wrap: normal;"><font data-font-src=3D"=
https://fonts.googleapis.com/css?family=3DArchitects+Daughter">usr</font></=
div></div></div></foreignObject><text x=3D"1929" y=3D"704" fill=3D"rgb(0, 0=
, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"mid=
dle">usr</text></switch></g><path d=3D"M 7716.02 3240 L 7716 3394.53" fill=
=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"1=
0" pointer-events=3D"stroke"/><path d=3D"M 7716 3415.53 L 7706.67 3387.53 L=
 7716 3394.53 L 7725.34 3387.53 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0=
, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/><=
rect x=3D"7608.52" y=3D"3080" width=3D"215" height=3D"160" rx=3D"24" ry=3D"=
24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" =
pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><swit=
ch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" re=
quiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=
=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1=
999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-cont=
ent: unsafe center; width: 52px; height: 1px; padding-top: 790px; margin-le=
ft: 1903px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box=
-sizing: border-box; font-size: 0px; text-align: center;"><div style=3D"dis=
play: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quo=
t;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space=
: normal; overflow-wrap: normal;"><font data-font-src=3D"https://fonts.goog=
leapis.com/css?family=3DArchitects+Daughter">bin</font></div></div></div></=
foreignObject><text x=3D"1929" y=3D"794" fill=3D"rgb(0, 0, 0)" font-family=
=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">bin</text></=
switch></g><rect x=3D"1268" y=3D"2160" width=3D"400" height=3D"160" rx=3D"2=
4" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-wid=
th=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(=
4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D=
"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility=
" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w=
3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justi=
fy-content: unsafe center; width: 98px; height: 1px; padding-top: 560px; ma=
rgin-left: 318px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=
=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div style=
=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation S=
ans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; whit=
e-space: normal; overflow-wrap: normal;"><font data-font-src=3D"https://fon=
ts.googleapis.com/css?family=3DArchitects+Daughter">libhello-0.1</font></di=
v></div></div></foreignObject><text x=3D"367" y=3D"564" fill=3D"rgb(0, 0, 0=
)" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle=
">libhello-0.1</text></switch></g><path d=3D"M 1241 2160 Q 1241.71 2220 124=
5.14 2050.29 Q 1248.57 1880.57 1785.14 1880.57 Q 2321.71 1880.57 2321.08 21=
27.06" fill=3D"none" stroke=3D"#000000" stroke-width=3D"8" stroke-miterlimi=
t=3D"10" stroke-dasharray=3D"8 16" pointer-events=3D"stroke"/><path d=3D"M =
2321.02 2151.06 L 2310.44 2119.03 L 2321.08 2127.06 L 2331.77 2119.08 Z" fi=
ll=3D"#000000" stroke=3D"#000000" stroke-width=3D"8" stroke-miterlimit=3D"1=
0" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><s=
witch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%"=
 requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" styl=
e=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-con=
tent: unsafe center; width: 1px; height: 1px; padding-top: 472px; margin-le=
ft: 435px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255); border-color: rgb(0, 0, 0); " style=3D"box-sizing: b=
order-box; font-size: 0px; text-align: center;"><div style=3D"display: inli=
ne-block; font-size: 11px; font-family: &quot;Liberation Sans&quot;; color:=
 rgb(0, 0, 0); line-height: 1.2; pointer-events: all; background-color: rgb=
(255, 255, 255); border: 1px solid rgb(0, 0, 0); white-space: nowrap;"><fon=
t data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Dau=
ghter" style=3D"font-size: 14px;">S =3D "${WORKDIR}/git"</font></div></div>=
</div></foreignObject><text x=3D"435" y=3D"475" fill=3D"rgb(0, 0, 0)" font-=
family=3D"Liberation Sans" font-size=3D"11px" text-anchor=3D"middle">S =3D =
"${WORKDIR}/git"</text></switch></g><rect x=3D"3203" y=3D"1620" width=3D"25=
2" height=3D"100" rx=3D"15" ry=3D"15" fill=3D"#000000" stroke=3D"none" poin=
ter-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><=
foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" requir=
edFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"ov=
erflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xh=
tml" style=3D"display: flex; align-items: unsafe center; justify-content: u=
nsafe center; width: 61px; height: 1px; padding-top: 418px; margin-left: 80=
2px;"><div data-drawio-colors=3D"color: #ffffff; " style=3D"box-sizing: bor=
der-box; font-size: 0px; text-align: center;"><div style=3D"display: inline=
-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: r=
gb(255, 255, 255); line-height: 1.2; pointer-events: all; font-weight: bold=
; white-space: normal; overflow-wrap: normal;"><font data-font-src=3D"https=
://fonts.googleapis.com/css?family=3DArchitects+Daughter">WORKDIR</font></d=
iv></div></div></foreignObject><text x=3D"832" y=3D"421" fill=3D"#ffffff" f=
ont-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle" fo=
nt-weight=3D"bold">WORKDIR</text></switch></g><rect x=3D"2923" y=3D"2160" w=
idth=3D"106" height=3D"100" rx=3D"15" ry=3D"15" fill=3D"#000000" stroke=3D"=
none" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"=
><switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"10=
0%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" s=
tyle=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.o=
rg/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-=
content: unsafe center; width: 24px; height: 1px; padding-top: 553px; margi=
n-left: 732px;"><div data-drawio-colors=3D"color: #ffffff; " style=3D"box-s=
izing: border-box; font-size: 0px; text-align: center;"><div style=3D"displ=
ay: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;=
; color: rgb(255, 255, 255); line-height: 1.2; pointer-events: all; font-we=
ight: bold; white-space: normal; overflow-wrap: normal;"><font data-font-sr=
c=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">D</font=
></div></div></div></foreignObject><text x=3D"744" y=3D"556" fill=3D"#fffff=
f" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle=
" font-weight=3D"bold">D</text></switch></g><rect x=3D"2268" y=3D"2160" wid=
th=3D"106" height=3D"100" rx=3D"15" ry=3D"15" fill=3D"#000000" stroke=3D"no=
ne" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><=
switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%=
" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" sty=
le=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org=
/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-co=
ntent: unsafe center; width: 24px; height: 1px; padding-top: 553px; margin-=
left: 568px;"><div data-drawio-colors=3D"color: #ffffff; " style=3D"box-siz=
ing: border-box; font-size: 0px; text-align: center;"><div style=3D"display=
: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; =
color: rgb(255, 255, 255); line-height: 1.2; pointer-events: all; font-weig=
ht: bold; white-space: normal; overflow-wrap: normal;"><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">S</font>=
</div></div></div></foreignObject><text x=3D"580" y=3D"556" fill=3D"#ffffff=
" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle"=
 font-weight=3D"bold">S</text></switch></g><rect x=3D"2162" y=3D"2160" widt=
h=3D"106" height=3D"100" rx=3D"15" ry=3D"15" fill=3D"#000000" stroke=3D"non=
e" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><s=
witch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%"=
 requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" styl=
e=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-con=
tent: unsafe center; width: 24px; height: 1px; padding-top: 553px; margin-l=
eft: 542px;"><div data-drawio-colors=3D"color: #ffffff; " style=3D"box-sizi=
ng: border-box; font-size: 0px; text-align: center;"><div style=3D"display:=
 inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; c=
olor: rgb(255, 255, 255); line-height: 1.2; pointer-events: all; font-weigh=
t: bold; white-space: normal; overflow-wrap: normal;"><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">B</font>=
</div></div></div></foreignObject><text x=3D"554" y=3D"556" fill=3D"#ffffff=
" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle"=
 font-weight=3D"bold">B</text></switch></g><rect x=3D"1188" y=3D"2160" widt=
h=3D"106" height=3D"100" rx=3D"15" ry=3D"15" fill=3D"#000000" stroke=3D"non=
e" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><s=
witch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%"=
 requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" styl=
e=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-con=
tent: unsafe center; width: 24px; height: 1px; padding-top: 553px; margin-l=
eft: 298px;"><div data-drawio-colors=3D"color: #ffffff; " style=3D"box-sizi=
ng: border-box; font-size: 0px; text-align: center;"><div style=3D"display:=
 inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; c=
olor: rgb(255, 255, 255); line-height: 1.2; pointer-events: all; font-weigh=
t: bold; white-space: normal; overflow-wrap: normal;"><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">S</font>=
</div></div></div></foreignObject><text x=3D"310" y=3D"556" fill=3D"#ffffff=
" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle"=
 font-weight=3D"bold">S</text></switch></g><rect x=3D"1835" y=3D"2160" widt=
h=3D"106" height=3D"100" rx=3D"15" ry=3D"15" fill=3D"#000000" stroke=3D"non=
e" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><s=
witch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%"=
 requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" styl=
e=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-con=
tent: unsafe center; width: 24px; height: 1px; padding-top: 553px; margin-l=
eft: 460px;"><div data-drawio-colors=3D"color: #ffffff; " style=3D"box-sizi=
ng: border-box; font-size: 0px; text-align: center;"><div style=3D"display:=
 inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; c=
olor: rgb(255, 255, 255); line-height: 1.2; pointer-events: all; font-weigh=
t: bold; white-space: normal; overflow-wrap: normal;"><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">T</font>=
</div></div></div></foreignObject><text x=3D"472" y=3D"556" fill=3D"#ffffff=
" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle"=
 font-weight=3D"bold">T</text></switch></g><rect x=3D"3628" y=3D"3160" widt=
h=3D"200" height=3D"100" rx=3D"15" ry=3D"15" fill=3D"#000000" stroke=3D"non=
e" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><s=
witch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%"=
 requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" styl=
e=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-con=
tent: unsafe center; width: 48px; height: 1px; padding-top: 803px; margin-l=
eft: 908px;"><div data-drawio-colors=3D"color: #ffffff; " style=3D"box-sizi=
ng: border-box; font-size: 0px; text-align: center;"><div style=3D"display:=
 inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; c=
olor: rgb(255, 255, 255); line-height: 1.2; pointer-events: all; font-weigh=
t: bold; white-space: normal; overflow-wrap: normal;"><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">libdir</=
font></div></div></div></foreignObject><text x=3D"932" y=3D"806" fill=3D"#f=
fffff" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"mi=
ddle" font-weight=3D"bold">libdir</text></switch></g><rect x=3D"3135" y=3D"=
3160" width=3D"320" height=3D"100" rx=3D"15" ry=3D"15" fill=3D"#000000" str=
oke=3D"none" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)sc=
ale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" heigh=
t=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibi=
lity" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://w=
ww.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; j=
ustify-content: unsafe center; width: 78px; height: 1px; padding-top: 803px=
; margin-left: 785px;"><div data-drawio-colors=3D"color: #ffffff; " style=
=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div style=
=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation S=
ans&quot;; color: rgb(255, 255, 255); line-height: 1.2; pointer-events: all=
; font-weight: bold; white-space: normal; overflow-wrap: normal;"><font dat=
a-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter=
">includedir</font></div></div></div></foreignObject><text x=3D"824" y=3D"8=
06" fill=3D"#ffffff" font-family=3D"Liberation Sans" font-size=3D"12px" tex=
t-anchor=3D"middle" font-weight=3D"bold">includedir</text></switch></g><rec=
t x=3D"5603.48" y=3D"2280" width=3D"464.52" height=3D"100" rx=3D"15" ry=3D"=
15" fill=3D"#000000" stroke=3D"none" pointer-events=3D"all"/><g transform=
=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"=
none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/=
TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-align: lef=
t;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; ali=
gn-items: unsafe center; justify-content: unsafe center; width: 114px; heig=
ht: 1px; padding-top: 583px; margin-left: 1402px;"><div data-drawio-colors=
=3D"color: #ffffff; " style=3D"box-sizing: border-box; font-size: 0px; text=
-align: center;"><div style=3D"display: inline-block; font-size: 12px; font=
-family: &quot;Liberation Sans&quot;; color: rgb(255, 255, 255); line-heigh=
t: 1.2; pointer-events: all; font-weight: bold; white-space: normal; overfl=
ow-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.com/css?f=
amily=3DArchitects+Daughter">RECIPE_SYSROOT</font></div></div></div></forei=
gnObject><text x=3D"1459" y=3D"586" fill=3D"#ffffff" font-family=3D"Liberat=
ion Sans" font-size=3D"12px" text-anchor=3D"middle" font-weight=3D"bold">RE=
CIPE_SYSROOT</text></switch></g><path d=3D"M 7226.86 2260 Q 7226.86 2110.29=
 7197.14 2110.29 Q 7167.43 2110.29 7167.49 1985.47" fill=3D"none" stroke=3D=
"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" stroke-dasharray=
=3D"12 12" pointer-events=3D"stroke"/><path d=3D"M 7167.5 1964.47 L 7176.82=
 1992.48 L 7167.49 1985.47 L 7158.15 1992.47 Z" fill=3D"rgb(0, 0, 0)" strok=
e=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-even=
ts=3D"all"/><rect x=3D"7174" y=3D"2260" width=3D"106" height=3D"100" rx=3D"=
15" ry=3D"15" fill=3D"#000000" stroke=3D"none" pointer-events=3D"all"/><g t=
ransform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-ev=
ents=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www=
.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-al=
ign: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: f=
lex; align-items: unsafe center; justify-content: unsafe center; width: 24p=
x; height: 1px; padding-top: 578px; margin-left: 1795px;"><div data-drawio-=
colors=3D"color: #ffffff; " style=3D"box-sizing: border-box; font-size: 0px=
; text-align: center;"><div style=3D"display: inline-block; font-size: 12px=
; font-family: &quot;Liberation Sans&quot;; color: rgb(255, 255, 255); line=
-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; =
overflow-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.com=
/css?family=3DArchitects+Daughter">S</font></div></div></div></foreignObjec=
t><text x=3D"1807" y=3D"581" fill=3D"#ffffff" font-family=3D"Liberation San=
s" font-size=3D"12px" text-anchor=3D"middle" font-weight=3D"bold">S</text><=
/switch></g><rect x=3D"7068" y=3D"2260" width=3D"106" height=3D"100" rx=3D"=
15" ry=3D"15" fill=3D"#000000" stroke=3D"none" pointer-events=3D"all"/><g t=
ransform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-ev=
ents=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www=
.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-al=
ign: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: f=
lex; align-items: unsafe center; justify-content: unsafe center; width: 24p=
x; height: 1px; padding-top: 578px; margin-left: 1768px;"><div data-drawio-=
colors=3D"color: #ffffff; " style=3D"box-sizing: border-box; font-size: 0px=
; text-align: center;"><div style=3D"display: inline-block; font-size: 12px=
; font-family: &quot;Liberation Sans&quot;; color: rgb(255, 255, 255); line=
-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; =
overflow-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.com=
/css?family=3DArchitects+Daughter">B</font></div></div></div></foreignObjec=
t><text x=3D"1780" y=3D"581" fill=3D"#ffffff" font-family=3D"Liberation San=
s" font-size=3D"12px" text-anchor=3D"middle" font-weight=3D"bold">B</text><=
/switch></g><rect x=3D"7803" y=3D"2260" width=3D"106" height=3D"100" rx=3D"=
15" ry=3D"15" fill=3D"#000000" stroke=3D"none" pointer-events=3D"all"/><g t=
ransform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-ev=
ents=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www=
.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-al=
ign: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: f=
lex; align-items: unsafe center; justify-content: unsafe center; width: 24p=
x; height: 1px; padding-top: 578px; margin-left: 1952px;"><div data-drawio-=
colors=3D"color: #ffffff; " style=3D"box-sizing: border-box; font-size: 0px=
; text-align: center;"><div style=3D"display: inline-block; font-size: 12px=
; font-family: &quot;Liberation Sans&quot;; color: rgb(255, 255, 255); line=
-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; =
overflow-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.com=
/css?family=3DArchitects+Daughter">D</font></div></div></div></foreignObjec=
t><text x=3D"1964" y=3D"581" fill=3D"#ffffff" font-family=3D"Liberation San=
s" font-size=3D"12px" text-anchor=3D"middle" font-weight=3D"bold">D</text><=
/switch></g><rect x=3D"5788" y=3D"1580" width=3D"252" height=3D"100" rx=3D"=
15" ry=3D"15" fill=3D"#000000" stroke=3D"none" pointer-events=3D"all"/><g t=
ransform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-ev=
ents=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www=
.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-al=
ign: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: f=
lex; align-items: unsafe center; justify-content: unsafe center; width: 61p=
x; height: 1px; padding-top: 408px; margin-left: 1448px;"><div data-drawio-=
colors=3D"color: #ffffff; " style=3D"box-sizing: border-box; font-size: 0px=
; text-align: center;"><div style=3D"display: inline-block; font-size: 12px=
; font-family: &quot;Liberation Sans&quot;; color: rgb(255, 255, 255); line=
-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; =
overflow-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.com=
/css?family=3DArchitects+Daughter">WORKDIR</font></div></div></div></foreig=
nObject><text x=3D"1479" y=3D"411" fill=3D"#ffffff" font-family=3D"Liberati=
on Sans" font-size=3D"12px" text-anchor=3D"middle" font-weight=3D"bold">WOR=
KDIR</text></switch></g><rect x=3D"4640" y=3D"3680" width=3D"800" height=3D=
"120" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" pointer-events=
=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObj=
ect pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=
=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: vi=
sible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 1px; height: 1px; padding-top: 935px; margin-left: 1260px;"><div=
 data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-b=
ox; font-size: 0px; text-align: center;"><div style=3D"display: inline-bloc=
k; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0,=
 0, 0); line-height: 1.2; pointer-events: all; white-space: nowrap;"><font =
data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daugh=
ter">do_prepare_recipe_sysroot</font></div></div></div></foreignObject><tex=
t x=3D"1260" y=3D"939" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans=
" font-size=3D"12px" text-anchor=3D"middle">do_prepare_recipe_sysroot</text=
></switch></g><rect x=3D"7536" y=3D"3420" width=3D"360" height=3D"110" rx=
=3D"16.5" ry=3D"16.5" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4=
" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><sw=
itch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" =
requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=
=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1=
999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-cont=
ent: unsafe center; width: 88px; height: 1px; padding-top: 869px; margin-le=
ft: 1885px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box=
-sizing: border-box; font-size: 0px; text-align: center;"><div style=3D"dis=
play: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quo=
t;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space=
: normal; overflow-wrap: normal;">sayhello</div></div></div></foreignObject=
><text x=3D"1929" y=3D"872" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation=
 Sans" font-size=3D"12px" text-anchor=3D"middle">sayhello</text></switch></=
g><rect x=3D"4988" y=3D"2640" width=3D"1080" height=3D"960" rx=3D"144" ry=
=3D"144" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-da=
sharray=3D"12 12" pointer-events=3D"all"/><path d=3D"M 5236 2880 Q 5236 296=
0.57 5235.99 3014.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D=
"4" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 5235.9=
8 3035.53 L 5226.65 3007.53 L 5235.99 3014.53 L 5245.32 3007.53 Z" fill=3D"=
rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=
=3D"10" pointer-events=3D"all"/><path d=3D"M 5236 2880 Q 5236 2960.57 5474.=
86 2960.57 Q 5713.71 2960.57 5713.91 3014.53" fill=3D"none" stroke=3D"rgb(0=
, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"stro=
ke"/><path d=3D"M 5713.98 3035.53 L 5704.55 3007.56 L 5713.91 3014.53 L 572=
3.22 3007.49 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=
=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"5149" y=
=3D"2720" width=3D"174" height=3D"160" rx=3D"24" ry=3D"24" fill=3D"rgb(255,=
 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" pointer-events=3D"al=
l"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject po=
inter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"ht=
tp://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible;=
 text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"di=
splay: flex; align-items: unsafe center; justify-content: unsafe center; wi=
dth: 42px; height: 1px; padding-top: 700px; margin-left: 1288px;"><div data=
-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; f=
ont-size: 0px; text-align: center;"><div style=3D"display: inline-block; fo=
nt-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0=
); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wra=
p: normal;"><font data-font-src=3D"https://fonts.googleapis.com/css?family=
=3DArchitects+Daughter">usr</font></div></div></div></foreignObject><text x=
=3D"1309" y=3D"704" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" f=
ont-size=3D"12px" text-anchor=3D"middle">usr</text></switch></g><path d=3D"=
M 5235.98 3200 L 5236 3294.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke=
-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D=
"M 5236 3315.53 L 5226.66 3287.53 L 5236 3294.53 L 5245.33 3287.53 Z" fill=
=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterli=
mit=3D"10" pointer-events=3D"all"/><rect x=3D"5128.48" y=3D"3040" width=3D"=
215" height=3D"160" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=
=3D"rgb(0, 0, 0)" stroke-width=3D"4" pointer-events=3D"all"/><g transform=
=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"=
none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/=
TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-align: lef=
t;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; ali=
gn-items: unsafe center; justify-content: unsafe center; width: 52px; heigh=
t: 1px; padding-top: 780px; margin-left: 1283px;"><div data-drawio-colors=
=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px;=
 text-align: center;"><div style=3D"display: inline-block; font-size: 12px;=
 font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height=
: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;"><f=
ont data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+D=
aughter">include</font></div></div></div></foreignObject><text x=3D"1309" y=
=3D"784" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D=
"12px" text-anchor=3D"middle">include</text></switch></g><path d=3D"M 5713.=
71 3200 L 5713.71 3240.57 Q 5713.71 3280.57 5713.76 3287.55 L 5713.82 3294.=
53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterli=
mit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 5713.97 3315.53 L 5704.4=
3 3287.6 L 5713.82 3294.53 L 5723.1 3287.46 Z" fill=3D"rgb(0, 0, 0)" stroke=
=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-event=
s=3D"all"/><rect x=3D"5627" y=3D"3040" width=3D"174" height=3D"160" rx=3D"2=
4" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-wid=
th=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(=
4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D=
"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility=
" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w=
3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justi=
fy-content: unsafe center; width: 42px; height: 1px; padding-top: 780px; ma=
rgin-left: 1408px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=
=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div style=
=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation S=
ans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; whit=
e-space: normal; overflow-wrap: normal;"><font data-font-src=3D"https://fon=
ts.googleapis.com/css?family=3DArchitects+Daughter">lib</font></div></div><=
/div></foreignObject><text x=3D"1429" y=3D"784" fill=3D"rgb(0, 0, 0)" font-=
family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">lib</t=
ext></switch></g><rect x=3D"5076" y=3D"3320" width=3D"320" height=3D"100" r=
x=3D"15" ry=3D"15" fill=3D"#f5f5f5" stroke=3D"#666666" stroke-width=3D"4" p=
ointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switc=
h><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" req=
uiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D=
"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999=
/xhtml" style=3D"display: flex; align-items: unsafe center; justify-content=
: unsafe center; width: 78px; height: 1px; padding-top: 843px; margin-left:=
 1270px;"><div data-drawio-colors=3D"color: #333333; " style=3D"box-sizing:=
 border-box; font-size: 0px; text-align: center;"><div style=3D"display: in=
line-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; colo=
r: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: nor=
mal; overflow-wrap: normal;">hellolib.h</div></div></div></foreignObject><t=
ext x=3D"1309" y=3D"846" fill=3D"#333333" font-family=3D"Liberation Sans" f=
ont-size=3D"12px" text-anchor=3D"middle">hellolib.h</text></switch></g><rec=
t x=3D"5468" y=3D"3350" width=3D"480" height=3D"80" rx=3D"12" ry=3D"12" fil=
l=3D"#f5f5f5" stroke=3D"#666666" stroke-width=3D"4" pointer-events=3D"all"/=
><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject point=
er-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http:=
//www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; te=
xt-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"displ=
ay: flex; align-items: unsafe center; justify-content: unsafe center; width=
: 118px; height: 1px; padding-top: 848px; margin-left: 1368px;"><div data-d=
rawio-colors=3D"color: #333333; " style=3D"box-sizing: border-box; font-siz=
e: 0px; text-align: center;"><div style=3D"display: inline-block; font-size=
: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(51, 51, 51); l=
ine-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: n=
ormal;">libhello.so.1</div></div></div></foreignObject><text x=3D"1427" y=
=3D"851" fill=3D"#333333" font-family=3D"Liberation Sans" font-size=3D"12px=
" text-anchor=3D"middle">libhello.so.1</text></switch></g><rect x=3D"5468" =
y=3D"3450" width=3D"480" height=3D"100" rx=3D"15" ry=3D"15" fill=3D"#f5f5f5=
" stroke=3D"#666666" stroke-width=3D"4" pointer-events=3D"all"/><g transfor=
m=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D=
"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org=
/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-align: le=
ft;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; al=
ign-items: unsafe center; justify-content: unsafe center; width: 118px; hei=
ght: 1px; padding-top: 875px; margin-left: 1368px;"><div data-drawio-colors=
=3D"color: #333333; " style=3D"box-sizing: border-box; font-size: 0px; text=
-align: center;"><div style=3D"display: inline-block; font-size: 12px; font=
-family: &quot;Liberation Sans&quot;; color: rgb(51, 51, 51); line-height: =
1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">libh=
ello.so.1.0</div></div></div></foreignObject><text x=3D"1427" y=3D"879" fil=
l=3D"#333333" font-family=3D"Liberation Sans" font-size=3D"12px" text-ancho=
r=3D"middle">libhello.so.1.0</text></switch></g><rect x=3D"5440" y=3D"3320"=
 width=3D"548" height=3D"250" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-=
width=3D"4" stroke-dasharray=3D"12 12" pointer-events=3D"all"/><rect x=3D"3=
880" y=3D"1680" width=3D"1560" height=3D"280" fill=3D"none" stroke=3D"#3639=
3d" stroke-width=3D"4" stroke-dasharray=3D"12 12" pointer-events=3D"all"/><=
g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer=
-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://=
www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text=
-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display=
: flex; align-items: unsafe center; justify-content: unsafe center; width: =
1px; height: 1px; padding-top: 455px; margin-left: 1165px;"><div data-drawi=
o-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-si=
ze: 0px; text-align: center;"><div style=3D"display: inline-block; font-siz=
e: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); lin=
e-height: 1.2; pointer-events: all; white-space: nowrap;"><font data-font-s=
rc=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter" style=
=3D"font-size: 15px;">This also contains other files from other=C2=A0<br />=
dependencies. Default dependencies are:<br />basically <b style=3D""><u>gcc=
</u></b>, <b style=3D""><u>compilerlibs</u></b> and <b style=3D""><u style=
=3D"">libc</u></b></font></div></div></div></foreignObject><text x=3D"1165"=
 y=3D"459" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=
=3D"12px" text-anchor=3D"middle">This also contains other files from other.=
..</text></switch></g><rect x=3D"4368" y=3D"2280" width=3D"510" height=3D"1=
00" rx=3D"15" ry=3D"15" fill=3D"#000000" stroke=3D"none" pointer-events=3D"=
all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject =
pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"=
http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visibl=
e; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"=
display: flex; align-items: unsafe center; justify-content: unsafe center; =
width: 126px; height: 1px; padding-top: 583px; margin-left: 1093px;"><div d=
ata-drawio-colors=3D"color: #ffffff; " style=3D"box-sizing: border-box; fon=
t-size: 0px; text-align: center;"><div style=3D"display: inline-block; font=
-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(255, 255,=
 255); line-height: 1.2; pointer-events: all; font-weight: bold; white-spac=
e: normal; overflow-wrap: normal;"><font data-font-src=3D"https://fonts.goo=
gleapis.com/css?family=3DArchitects+Daughter">SYSROOT_DESTDIR</font></div><=
/div></div></foreignObject><text x=3D"1156" y=3D"586" fill=3D"#ffffff" font=
-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle" font-=
weight=3D"bold">SYSROOT_DESTDIR</text></switch></g><path d=3D"M 330 960 L 1=
121.58 960" fill=3D"none" stroke=3D"#000000" stroke-width=3D"12" stroke-mit=
erlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 1148.58 960 L 1112.5=
8 978 L 1121.58 960 L 1112.58 942 Z" fill=3D"#000000" stroke=3D"#000000" st=
roke-width=3D"12" stroke-miterlimit=3D"10" pointer-events=3D"all"/><path d=
=3D"M 330 1160 L 1121.58 1160" fill=3D"none" stroke=3D"#000000" stroke-widt=
h=3D"12" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 1=
148.58 1160 L 1112.58 1178 L 1121.58 1160 L 1112.58 1142 Z" fill=3D"#000000=
" stroke=3D"#000000" stroke-width=3D"12" stroke-miterlimit=3D"10" pointer-e=
vents=3D"all"/><rect x=3D"2" y=3D"860" width=3D"328" height=3D"400" rx=3D"4=
9.2" ry=3D"49.2" fill=3D"#000000" stroke=3D"#23445d" stroke-width=3D"4" poi=
nter-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch>=
<foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" requi=
redFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"o=
verflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/x=
html" style=3D"display: flex; align-items: unsafe center; justify-content: =
unsafe center; width: 80px; height: 1px; padding-top: 265px; margin-left: 1=
px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing:=
 border-box; font-size: 0px; text-align: center;"><div style=3D"display: in=
line-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; colo=
r: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal=
; overflow-wrap: normal;"><font color=3D"#fcfcfc">Github</font></div></div>=
</div></foreignObject><text x=3D"41" y=3D"269" fill=3D"rgb(0, 0, 0)" font-f=
amily=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">Github<=
/text></switch></g><rect x=3D"535" y=3D"900" width=3D"320" height=3D"120" f=
ill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" pointer-events=3D"all=
"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject poi=
nter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"htt=
p://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; =
text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"dis=
play: flex; align-items: unsafe center; justify-content: unsafe center; wid=
th: 1px; height: 1px; padding-top: 240px; margin-left: 174px;"><div data-dr=
awio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font=
-size: 0px; text-align: center;"><div style=3D"display: inline-block; font-=
size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); =
line-height: 1.2; pointer-events: all; white-space: nowrap;"><font data-fon=
t-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">do_=
fetch<br /></font></div></div></div></foreignObject><text x=3D"174" y=3D"24=
4" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px"=
 text-anchor=3D"middle">do_fetch&#xa;</text></switch></g><ellipse cx=3D"475=
" cy=3D"960" rx=3D"60.00000000000001" ry=3D"60.00000000000001" fill=3D"#000=
000" stroke=3D"#56517e" stroke-width=3D"4" pointer-events=3D"all"/><g trans=
form=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=
=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.=
org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-align:=
 left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex;=
 align-items: unsafe center; justify-content: unsafe center; width: 28px; h=
eight: 1px; padding-top: 240px; margin-left: 105px;"><div data-drawio-color=
s=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px=
; text-align: center;"><div style=3D"display: inline-block; font-size: 12px=
; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-heigh=
t: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;"><=
font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+=
Daughter" color=3D"#ffffff" size=3D"1"><b style=3D"font-size: 15px;">1</b><=
/font></div></div></div></foreignObject><text x=3D"119" y=3D"244" fill=3D"r=
gb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=
=3D"middle">1</text></switch></g><rect x=3D"535" y=3D"1100" width=3D"320" h=
eight=3D"120" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" pointe=
r-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><fo=
reignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" required=
Features=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"over=
flow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtm=
l" style=3D"display: flex; align-items: unsafe center; justify-content: uns=
afe center; width: 1px; height: 1px; padding-top: 290px; margin-left: 174px=
;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: b=
order-box; font-size: 0px; text-align: center;"><div style=3D"display: inli=
ne-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color:=
 rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: nowrap;"=
><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitect=
s+Daughter">do_fetch<br /></font></div></div></div></foreignObject><text x=
=3D"174" y=3D"294" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" fo=
nt-size=3D"12px" text-anchor=3D"middle">do_fetch&#xa;</text></switch></g><e=
llipse cx=3D"475" cy=3D"1160" rx=3D"60.00000000000001" ry=3D"60.00000000000=
001" fill=3D"#000000" stroke=3D"#56517e" stroke-width=3D"4" pointer-events=
=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObj=
ect pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=
=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: vi=
sible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 28px; height: 1px; padding-top: 290px; margin-left: 105px;"><div=
 data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-b=
ox; font-size: 0px; text-align: center;"><div style=3D"display: inline-bloc=
k; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0,=
 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflo=
w-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.com/css?fa=
mily=3DArchitects+Daughter" color=3D"#ffffff" size=3D"1"><b style=3D"font-s=
ize: 15px;">5</b></font></div></div></div></foreignObject><text x=3D"119" y=
=3D"294" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D=
"12px" text-anchor=3D"middle">5</text></switch></g><rect x=3D"6228" y=3D"29=
80" width=3D"440" height=3D"120" fill=3D"#eeeeee" stroke=3D"#36393d" stroke=
-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)sc=
ale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" heigh=
t=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibi=
lity" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://w=
ww.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; j=
ustify-content: unsafe center; width: 1px; height: 1px; padding-top: 760px;=
 margin-left: 1612px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " st=
yle=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div st=
yle=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberatio=
n Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; w=
hite-space: nowrap;"><font data-font-src=3D"https://fonts.googleapis.com/cs=
s?family=3DArchitects+Daughter">do_configure<br /></font></div></div></div>=
</foreignObject><text x=3D"1612" y=3D"764" fill=3D"rgb(0, 0, 0)" font-famil=
y=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">do_configur=
e&#xa;</text></switch></g><ellipse cx=3D"6168" cy=3D"3040" rx=3D"60.0000000=
0000001" ry=3D"60.00000000000001" fill=3D"#000000" stroke=3D"#56517e" strok=
e-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)s=
cale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" heig=
ht=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensib=
ility" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://=
www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; =
justify-content: unsafe center; width: 28px; height: 1px; padding-top: 760p=
x; margin-left: 1528px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " =
style=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div =
style=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberat=
ion Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all;=
 white-space: normal; overflow-wrap: normal;"><font data-font-src=3D"https:=
//fonts.googleapis.com/css?family=3DArchitects+Daughter" color=3D"#ffffff" =
size=3D"1"><b style=3D"font-size: 15px;">12</b></font></div></div></div></f=
oreignObject><text x=3D"1542" y=3D"764" fill=3D"rgb(0, 0, 0)" font-family=
=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">12</text></s=
witch></g><rect x=3D"6308" y=3D"3110" width=3D"360" height=3D"120" fill=3D"=
#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" pointer-events=3D"all"/><g t=
ransform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-ev=
ents=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www=
.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-al=
ign: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: f=
lex; align-items: unsafe center; justify-content: unsafe center; width: 1px=
; height: 1px; padding-top: 793px; margin-left: 1622px;"><div data-drawio-c=
olors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size:=
 0px; text-align: center;"><div style=3D"display: inline-block; font-size: =
12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-h=
eight: 1.2; pointer-events: all; white-space: nowrap;"><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">do_compi=
le<br /></font></div></div></div></foreignObject><text x=3D"1622" y=3D"796"=
 fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" t=
ext-anchor=3D"middle">do_compile&#xa;</text></switch></g><ellipse cx=3D"624=
8" cy=3D"3170" rx=3D"60.00000000000001" ry=3D"60.00000000000001" fill=3D"#0=
00000" stroke=3D"#56517e" stroke-width=3D"4" pointer-events=3D"all"/><g tra=
nsform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-even=
ts=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w=
3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-alig=
n: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: fle=
x; align-items: unsafe center; justify-content: unsafe center; width: 28px;=
 height: 1px; padding-top: 793px; margin-left: 1548px;"><div data-drawio-co=
lors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: =
0px; text-align: center;"><div style=3D"display: inline-block; font-size: 1=
2px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-he=
ight: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;=
"><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitec=
ts+Daughter" color=3D"#ffffff" size=3D"1"><b style=3D"font-size: 15px;">13<=
/b></font></div></div></div></foreignObject><text x=3D"1562" y=3D"796" fill=
=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-a=
nchor=3D"middle">13</text></switch></g><rect x=3D"2508" y=3D"900" width=3D"=
360" height=3D"120" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" =
pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><swit=
ch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" re=
quiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=
=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1=
999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-cont=
ent: unsafe center; width: 1px; height: 1px; padding-top: 240px; margin-lef=
t: 672px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-s=
izing: border-box; font-size: 0px; text-align: center;"><div style=3D"displ=
ay: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;=
; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: =
nowrap;"><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DA=
rchitects+Daughter">do_unpack<br /></font></div></div></div></foreignObject=
><text x=3D"672" y=3D"244" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation =
Sans" font-size=3D"12px" text-anchor=3D"middle">do_unpack&#xa;</text></swit=
ch></g><ellipse cx=3D"2448" cy=3D"960" rx=3D"60.00000000000001" ry=3D"60.00=
000000000001" fill=3D"#000000" stroke=3D"#56517e" stroke-width=3D"4" pointe=
r-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><fo=
reignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" required=
Features=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"over=
flow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtm=
l" style=3D"display: flex; align-items: unsafe center; justify-content: uns=
afe center; width: 28px; height: 1px; padding-top: 240px; margin-left: 598p=
x;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: =
border-box; font-size: 0px; text-align: center;"><div style=3D"display: inl=
ine-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color=
: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal;=
 overflow-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.co=
m/css?family=3DArchitects+Daughter" color=3D"#ffffff" size=3D"1"><b style=
=3D"font-size: 15px;">2</b></font></div></div></div></foreignObject><text x=
=3D"612" y=3D"244" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" fo=
nt-size=3D"12px" text-anchor=3D"middle">2</text></switch></g><path d=3D"M 5=
848.57 520 Q 5848.57 600.57 5849.05 594.61" fill=3D"none" stroke=3D"rgb(0, =
0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"stroke=
"/><path d=3D"M 5847.36 615.54 L 5835.66 586.51 L 5849.05 594.61 L 5863.57 =
588.76 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" =
stroke-miterlimit=3D"10" pointer-events=3D"all"/><path d=3D"M 5848.57 520 Q=
 5848.57 560.57 5593.14 560.57 Q 5337.71 560.57 5337.31 594.53" fill=3D"non=
e" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" poin=
ter-events=3D"stroke"/><path d=3D"M 5337.05 615.53 L 5323.39 587.36 L 5337.=
31 594.53 L 5351.39 587.7 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" =
stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/><path d=
=3D"M 5848.57 520 Q 5848.57 560.57 6108.57 560.57 Q 6368.57 560.57 6368.24 =
594.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-mit=
erlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 6368.04 615.53 L 635=
4.31 587.39 L 6368.24 594.53 L 6382.31 587.66 Z" fill=3D"rgb(0, 0, 0)" stro=
ke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-eve=
nts=3D"all"/><rect x=3D"5708" y=3D"360" width=3D"280" height=3D"160" rx=3D"=
24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-wi=
dth=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale=
(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" height=
=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibil=
ity" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://ww=
w.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; ju=
stify-content: unsafe center; width: 68px; height: 1px; padding-top: 110px;=
 margin-left: 1428px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " st=
yle=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div st=
yle=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberatio=
n Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; w=
hite-space: normal; overflow-wrap: normal;"><font data-font-src=3D"https://=
fonts.googleapis.com/css?family=3DArchitects+Daughter">conf</font></div></d=
iv></div></foreignObject><text x=3D"1462" y=3D"114" fill=3D"rgb(0, 0, 0)" f=
ont-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">co=
nf</text></switch></g><path d=3D"M 5149 660 Q 5108 660 5108 510.29 Q 5108 3=
60.57 5252 360.57 Q 5396 360.57 5396 205.47" fill=3D"none" stroke=3D"rgb(0,=
 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" stroke-dasharray=3D"12 =
12" pointer-events=3D"stroke"/><path d=3D"M 5396 184.47 L 5405.33 212.47 L =
5396 205.47 L 5386.67 212.47 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0=
)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rec=
t x=3D"5149" y=3D"620" width=3D"376" height=3D"80" rx=3D"12" ry=3D"12" fill=
=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" pointer-events=3D"all"/>=
<g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointe=
r-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http:/=
/www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; tex=
t-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"displa=
y: flex; align-items: unsafe center; justify-content: unsafe center; width:=
 92px; height: 1px; padding-top: 165px; margin-left: 1288px;"><div data-dra=
wio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-=
size: 0px; text-align: center;"><div style=3D"display: inline-block; font-s=
ize: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); l=
ine-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: n=
ormal;">local.conf</div></div></div></foreignObject><text x=3D"1334" y=3D"1=
69" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px=
" text-anchor=3D"middle">local.conf</text></switch></g><path d=3D"M 5847.43=
 700 Q 5847.43 860 6048 860 Q 6248.57 860 6248.09 994.53" fill=3D"none" str=
oke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" stroke-das=
harray=3D"12 12" pointer-events=3D"stroke"/><path d=3D"M 6248.02 1015.53 L =
6238.78 987.49 L 6248.09 994.53 L 6257.45 987.56 Z" fill=3D"rgb(0, 0, 0)" s=
troke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-=
events=3D"all"/><rect x=3D"5627" y=3D"620" width=3D"440" height=3D"80" rx=
=3D"12" ry=3D"12" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" po=
inter-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch=
><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" requ=
iredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"=
overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/=
xhtml" style=3D"display: flex; align-items: unsafe center; justify-content:=
 unsafe center; width: 108px; height: 1px; padding-top: 165px; margin-left:=
 1408px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-si=
zing: border-box; font-size: 0px; text-align: center;"><div style=3D"displa=
y: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;;=
 color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: n=
ormal; overflow-wrap: normal;">bblayers.conf</div></div></div></foreignObje=
ct><text x=3D"1462" y=3D"169" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberati=
on Sans" font-size=3D"12px" text-anchor=3D"middle">bblayers.conf</text></sw=
itch></g><rect x=3D"6707" y=3D"1360" width=3D"921" height=3D"600" fill=3D"r=
gb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-dashar=
ray=3D"12 12" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)s=
cale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" heig=
ht=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensib=
ility" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://=
www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; =
justify-content: unsafe center; width: 228px; height: 1px; padding-top: 415=
px; margin-left: 1678px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); "=
 style=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div=
 style=3D"display: inline-block; font-size: 12px; font-family: &quot;Libera=
tion Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all=
; white-space: normal; overflow-wrap: normal;"><font style=3D"font-size: 15=
px;"><b><u>S</u></b> defaults generally to <b><u>${WORKDIR}/${BPN}-${PV}</u=
></b><br />In <b>git</b> recipes change it to <b><u>${WORKDIR}/git</u></b><=
/font></div></div></div></foreignObject><text x=3D"1792" y=3D"419" fill=3D"=
rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-ancho=
r=3D"middle">S defaults generally to ${WORKDIR}/${B...</text></switch></g><=
rect x=3D"6228" y=3D"2700" width=3D"440" height=3D"160" fill=3D"#eeeeee" st=
roke=3D"#36393d" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D=
"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"non=
e" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/=
SVG11/feature#Extensibility" style=3D"overflow: visible; text-align: left;"=
><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-=
items: unsafe center; justify-content: unsafe center; width: 1px; height: 1=
px; padding-top: 695px; margin-left: 1612px;"><div data-drawio-colors=3D"co=
lor: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-=
align: center;"><div style=3D"display: inline-block; font-size: 12px; font-=
family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2;=
 pointer-events: all; white-space: nowrap;"><font data-font-src=3D"https://=
fonts.googleapis.com/css?family=3DArchitects+Daughter">do_patch<br /><i>(No=
 patches)</i><br /></font></div></div></div></foreignObject><text x=3D"1612=
" y=3D"699" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=
=3D"12px" text-anchor=3D"middle">do_patch...</text></switch></g><ellipse cx=
=3D"6168" cy=3D"2780" rx=3D"60.00000000000001" ry=3D"60.00000000000001" fil=
l=3D"#000000" stroke=3D"#56517e" stroke-width=3D"4" pointer-events=3D"all"/=
><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject point=
er-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http:=
//www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; te=
xt-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"displ=
ay: flex; align-items: unsafe center; justify-content: unsafe center; width=
: 28px; height: 1px; padding-top: 695px; margin-left: 1528px;"><div data-dr=
awio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font=
-size: 0px; text-align: center;"><div style=3D"display: inline-block; font-=
size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); =
line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: =
normal;"><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DA=
rchitects+Daughter" color=3D"#ffffff" size=3D"1"><b style=3D"font-size: 15p=
x;">3</b></font></div></div></div></foreignObject><text x=3D"1542" y=3D"699=
" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" =
text-anchor=3D"middle">3</text></switch></g><ellipse cx=3D"4580" cy=3D"3740=
" rx=3D"60.00000000000001" ry=3D"60.00000000000001" fill=3D"#000000" stroke=
=3D"#56517e" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"tra=
nslate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" w=
idth=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG1=
1/feature#Extensibility" style=3D"overflow: visible; text-align: left;"><di=
v xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-item=
s: unsafe center; justify-content: unsafe center; width: 28px; height: 1px;=
 padding-top: 935px; margin-left: 1131px;"><div data-drawio-colors=3D"color=
: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-ali=
gn: center;"><div style=3D"display: inline-block; font-size: 12px; font-fam=
ily: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; po=
inter-events: all; white-space: normal; overflow-wrap: normal;"><font data-=
font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter" =
color=3D"#ffffff" size=3D"1"><b style=3D"font-size: 15px;">4</b></font></di=
v></div></div></foreignObject><text x=3D"1145" y=3D"939" fill=3D"rgb(0, 0, =
0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middl=
e">4</text></switch></g><rect x=3D"6927" y=3D"3560" width=3D"360" height=3D=
"120" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" pointer-events=
=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObj=
ect pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=
=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: vi=
sible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 1px; height: 1px; padding-top: 905px; margin-left: 1777px;"><div=
 data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-b=
ox; font-size: 0px; text-align: center;"><div style=3D"display: inline-bloc=
k; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0,=
 0, 0); line-height: 1.2; pointer-events: all; white-space: nowrap;"><font =
data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daugh=
ter">do_install<br /></font></div></div></div></foreignObject><text x=3D"17=
77" y=3D"909" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-si=
ze=3D"12px" text-anchor=3D"middle">do_install&#xa;</text></switch></g><elli=
pse cx=3D"6868" cy=3D"3620" rx=3D"60.00000000000001" ry=3D"60.0000000000000=
1" fill=3D"#000000" stroke=3D"#56517e" stroke-width=3D"4" pointer-events=3D=
"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject=
 pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D=
"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visib=
le; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D=
"display: flex; align-items: unsafe center; justify-content: unsafe center;=
 width: 28px; height: 1px; padding-top: 905px; margin-left: 1703px;"><div d=
ata-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box=
; font-size: 0px; text-align: center;"><div style=3D"display: inline-block;=
 font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0=
, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-=
wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.com/css?fami=
ly=3DArchitects+Daughter" color=3D"#ffffff" size=3D"1"><b style=3D"font-siz=
e: 15px;">14</b></font></div></div></div></foreignObject><text x=3D"1717" y=
=3D"909" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D=
"12px" text-anchor=3D"middle">14</text></switch></g><path d=3D"M 8354.02 23=
20 L 8354.02 2614.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D=
"4" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 8354.0=
2 2635.53 L 8344.69 2607.53 L 8354.02 2614.53 L 8363.35 2607.53 Z" fill=3D"=
rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=
=3D"10" pointer-events=3D"all"/><rect x=3D"8228" y=3D"2160" width=3D"252" h=
eight=3D"160" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb=
(0, 0, 0)" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"trans=
late(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" wid=
th=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/=
feature#Extensibility" style=3D"overflow: visible; text-align: left;"><div =
xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items:=
 unsafe center; justify-content: unsafe center; width: 61px; height: 1px; p=
adding-top: 560px; margin-left: 2058px;"><div data-drawio-colors=3D"color: =
rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-align=
: center;"><div style=3D"display: inline-block; font-size: 12px; font-famil=
y: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; poin=
ter-events: all; white-space: normal; overflow-wrap: normal;"><font data-fo=
nt-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">pa=
ckage</font></div></div></div></foreignObject><text x=3D"2089" y=3D"564" fi=
ll=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text=
-anchor=3D"middle">package</text></switch></g><rect x=3D"8441.04" y=3D"2260=
" width=3D"146.96" height=3D"100" rx=3D"15" ry=3D"15" fill=3D"#000000" stro=
ke=3D"none" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)sca=
le(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" height=
=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibil=
ity" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://ww=
w.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; ju=
stify-content: unsafe center; width: 35px; height: 1px; padding-top: 578px;=
 margin-left: 2111px;"><div data-drawio-colors=3D"color: #ffffff; " style=
=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div style=
=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation S=
ans&quot;; color: rgb(255, 255, 255); line-height: 1.2; pointer-events: all=
; font-weight: bold; white-space: normal; overflow-wrap: normal;"><font dat=
a-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter=
">PKGD</font></div></div></div></foreignObject><text x=3D"2129" y=3D"581" f=
ill=3D"#ffffff" font-family=3D"Liberation Sans" font-size=3D"12px" text-anc=
hor=3D"middle" font-weight=3D"bold">PKGD</text></switch></g><path d=3D"M 84=
61.77 3600 Q 8461.14 3760.57 8784.57 3760.57 Q 9108 3760.57 9108 3640.42" f=
ill=3D"none" stroke=3D"#000000" stroke-width=3D"12" stroke-miterlimit=3D"10=
" pointer-events=3D"stroke"/><path d=3D"M 9108 3613.42 L 9126 3649.42 L 910=
8 3640.42 L 9090 3649.42 Z" fill=3D"#000000" stroke=3D"#000000" stroke-widt=
h=3D"12" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"8138.5=
2" y=3D"2640" width=3D"431" height=3D"960" rx=3D"64.65" ry=3D"64.65" fill=
=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" stroke-dasharray=3D"12 1=
2" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><s=
witch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%"=
 requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" styl=
e=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-con=
tent: unsafe center; width: 106px; height: 1px; padding-top: 780px; margin-=
left: 2036px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"b=
ox-sizing: border-box; font-size: 0px; text-align: center;"><div style=3D"d=
isplay: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&q=
uot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-spa=
ce: normal; overflow-wrap: normal;">A copy of=C2=A0<b>${D}<br /></b>excludi=
ng<br /><b>/sysroot-only</b></div></div></div></foreignObject><text x=3D"20=
89" y=3D"784" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-si=
ze=3D"12px" text-anchor=3D"middle">A copy of=C2=A0${D}...</text></switch></=
g><rect x=3D"7960.96" y=3D"3680" width=3D"360" height=3D"120" fill=3D"#eeee=
ee" stroke=3D"#36393d" stroke-width=3D"4" pointer-events=3D"all"/><g transf=
orm=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=
=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.=
org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-align:=
 left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex;=
 align-items: unsafe center; justify-content: unsafe center; width: 1px; he=
ight: 1px; padding-top: 935px; margin-left: 2035px;"><div data-drawio-color=
s=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px=
; text-align: center;"><div style=3D"display: inline-block; font-size: 12px=
; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-heigh=
t: 1.2; pointer-events: all; white-space: nowrap;"><font data-font-src=3D"h=
ttps://fonts.googleapis.com/css?family=3DArchitects+Daughter">do_package<br=
 /></font></div></div></div></foreignObject><text x=3D"2035" y=3D"939" fill=
=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-a=
nchor=3D"middle">do_package&#xa;</text></switch></g><ellipse cx=3D"7901.96"=
 cy=3D"3740" rx=3D"60.00000000000001" ry=3D"60.00000000000001" fill=3D"#000=
000" stroke=3D"#56517e" stroke-width=3D"4" pointer-events=3D"all"/><g trans=
form=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=
=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.=
org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-align:=
 left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex;=
 align-items: unsafe center; justify-content: unsafe center; width: 28px; h=
eight: 1px; padding-top: 935px; margin-left: 1961px;"><div data-drawio-colo=
rs=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0p=
x; text-align: center;"><div style=3D"display: inline-block; font-size: 12p=
x; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-heig=
ht: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">=
<font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects=
+Daughter" color=3D"#ffffff" size=3D"1"><b style=3D"font-size: 15px;">15</b=
></font></div></div></div></foreignObject><text x=3D"1975" y=3D"939" fill=
=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-a=
nchor=3D"middle">15</text></switch></g><path d=3D"M 9108 2320 L 9108 2614.5=
3" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlim=
it=3D"10" pointer-events=3D"stroke"/><path d=3D"M 9108 2635.53 L 9098.67 26=
07.53 L 9108 2614.53 L 9117.33 2607.53 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"r=
gb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"=
all"/><rect x=3D"8868" y=3D"2160" width=3D"480" height=3D"160" rx=3D"24" ry=
=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D=
"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><=
switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%=
" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" sty=
le=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org=
/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-co=
ntent: unsafe center; width: 118px; height: 1px; padding-top: 560px; margin=
-left: 2218px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"=
box-sizing: border-box; font-size: 0px; text-align: center;"><div style=3D"=
display: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&=
quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-sp=
ace: normal; overflow-wrap: normal;"><font data-font-src=3D"https://fonts.g=
oogleapis.com/css?family=3DArchitects+Daughter">packages-split</font></div>=
</div></div></foreignObject><text x=3D"2277" y=3D"564" fill=3D"rgb(0, 0, 0)=
" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle"=
>packages-split</text></switch></g><rect x=3D"9308" y=3D"2260" width=3D"240=
" height=3D"100" rx=3D"15" ry=3D"15" fill=3D"#000000" stroke=3D"none" point=
er-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><f=
oreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" require=
dFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"ove=
rflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xht=
ml" style=3D"display: flex; align-items: unsafe center; justify-content: un=
safe center; width: 58px; height: 1px; padding-top: 578px; margin-left: 232=
8px;"><div data-drawio-colors=3D"color: #ffffff; " style=3D"box-sizing: bor=
der-box; font-size: 0px; text-align: center;"><div style=3D"display: inline=
-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: r=
gb(255, 255, 255); line-height: 1.2; pointer-events: all; font-weight: bold=
; white-space: normal; overflow-wrap: normal;"><font data-font-src=3D"https=
://fonts.googleapis.com/css?family=3DArchitects+Daughter">PKGDEST</font></d=
iv></div></div></foreignObject><text x=3D"2357" y=3D"581" fill=3D"#ffffff" =
font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle" f=
ont-weight=3D"bold">PKGDEST</text></switch></g><path d=3D"M 9108 2840 L 910=
8 2895.1" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-m=
iterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 9108 2916.1 L 9098=
.67 2888.1 L 9108 2895.1 L 9117.33 2888.1 Z" fill=3D"rgb(0, 0, 0)" stroke=
=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-event=
s=3D"all"/><rect x=3D"8982" y=3D"2680" width=3D"252" height=3D"160" rx=3D"2=
4" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-wid=
th=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(=
4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D=
"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility=
" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w=
3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justi=
fy-content: unsafe center; width: 61px; height: 1px; padding-top: 690px; ma=
rgin-left: 2247px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=
=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div style=
=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation S=
ans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; whit=
e-space: normal; overflow-wrap: normal;"><font data-font-src=3D"https://fon=
ts.googleapis.com/css?family=3DArchitects+Daughter">sayhello</font></div></=
div></div></foreignObject><text x=3D"2277" y=3D"694" fill=3D"rgb(0, 0, 0)" =
font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">s=
ayhello</text></switch></g><path d=3D"M 9108 3080 L 9108 3120.57 Q 9108 316=
0.57 9108 3162.55 L 9108 3164.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" str=
oke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=
=3D"M 9107.98 3185.53 L 9098.67 3157.52 L 9108 3164.53 L 9117.34 3157.53 Z"=
 fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-mi=
terlimit=3D"10" pointer-events=3D"all"/><rect x=3D"9021" y=3D"2920" width=
=3D"174" height=3D"160" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" str=
oke=3D"rgb(0, 0, 0)" stroke-width=3D"4" pointer-events=3D"all"/><g transfor=
m=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D=
"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org=
/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-align: le=
ft;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; al=
ign-items: unsafe center; justify-content: unsafe center; width: 42px; heig=
ht: 1px; padding-top: 750px; margin-left: 2256px;"><div data-drawio-colors=
=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px;=
 text-align: center;"><div style=3D"display: inline-block; font-size: 12px;=
 font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height=
: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;"><f=
ont data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+D=
aughter">usr</font></div></div></div></foreignObject><text x=3D"2277" y=3D"=
754" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12p=
x" text-anchor=3D"middle">usr</text></switch></g><path d=3D"M 9107.98 3350 =
L 9107.97 3414.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4"=
 stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 9107.96 3=
435.53 L 9098.63 3407.53 L 9107.97 3414.53 L 9117.3 3407.53 Z" fill=3D"rgb(=
0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"1=
0" pointer-events=3D"all"/><rect x=3D"9000.48" y=3D"3190" width=3D"215" hei=
ght=3D"160" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0=
, 0, 0)" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"transla=
te(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=
=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/fe=
ature#Extensibility" style=3D"overflow: visible; text-align: left;"><div xm=
lns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: u=
nsafe center; justify-content: unsafe center; width: 52px; height: 1px; pad=
ding-top: 818px; margin-left: 2251px;"><div data-drawio-colors=3D"color: rg=
b(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-align: =
center;"><div style=3D"display: inline-block; font-size: 12px; font-family:=
 &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointe=
r-events: all; white-space: normal; overflow-wrap: normal;"><font data-font=
-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">bin<=
/font></div></div></div></foreignObject><text x=3D"2277" y=3D"821" fill=3D"=
rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-ancho=
r=3D"middle">bin</text></switch></g><rect x=3D"7689.48" y=3D"1360" width=3D=
"1287" height=3D"595" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" s=
troke-width=3D"4" stroke-dasharray=3D"12 12" pointer-events=3D"all"/><g tra=
nsform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-even=
ts=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w=
3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-alig=
n: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: fle=
x; align-items: unsafe center; justify-content: unsafe center; width: 320px=
; height: 1px; padding-top: 414px; margin-left: 1923px;"><div data-drawio-c=
olors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size:=
 0px; text-align: center;"><div style=3D"display: inline-block; font-size: =
12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-h=
eight: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal=
;"><span style=3D"font-size: 15px;">Folders created here are present in <b>=
<u>PACKAGES</u></b> variable, BitBake knows what and where to put things us=
ing the <b><u>FILES</u></b> variable, example: <b><u>FILES:${PN}</u></b> fi=
les will go to <b><u>${PN}</u></b>=C2=A0folder which is in <b><u>PACKAGES</=
u></b></span></div></div></div></foreignObject><text x=3D"2083" y=3D"418" f=
ill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" tex=
t-anchor=3D"middle">Folders created here are present in PACKAGES variable..=
.</text></switch></g><rect x=3D"8640.48" y=3D"3680" width=3D"360" height=3D=
"120" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" pointer-events=
=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObj=
ect pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=
=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: vi=
sible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 1px; height: 1px; padding-top: 935px; margin-left: 2205px;"><div=
 data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-b=
ox; font-size: 0px; text-align: center;"><div style=3D"display: inline-bloc=
k; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0,=
 0, 0); line-height: 1.2; pointer-events: all; white-space: nowrap;"><font =
data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daugh=
ter">do_package<br /></font></div></div></div></foreignObject><text x=3D"22=
05" y=3D"939" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-si=
ze=3D"12px" text-anchor=3D"middle">do_package&#xa;</text></switch></g><elli=
pse cx=3D"8581.48" cy=3D"3740" rx=3D"60.00000000000001" ry=3D"60.0000000000=
0001" fill=3D"#000000" stroke=3D"#56517e" stroke-width=3D"4" pointer-events=
=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObj=
ect pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=
=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: vi=
sible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 28px; height: 1px; padding-top: 935px; margin-left: 2131px;"><di=
v data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-=
box; font-size: 0px; text-align: center;"><div style=3D"display: inline-blo=
ck; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0=
, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overfl=
ow-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis.com/css?f=
amily=3DArchitects+Daughter" color=3D"#ffffff" size=3D"1"><b style=3D"font-=
size: 15px;">16</b></font></div></div></div></foreignObject><text x=3D"2145=
" y=3D"939" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=
=3D"12px" text-anchor=3D"middle">16</text></switch></g><path d=3D"M 9988 23=
20 L 9988 2674.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4"=
 stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 9988 2695=
.53 L 9978.67 2667.53 L 9988 2674.53 L 9997.33 2667.53 Z" fill=3D"rgb(0, 0,=
 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" po=
inter-events=3D"all"/><rect x=3D"9748" y=3D"2160" width=3D"480" height=3D"1=
60" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)"=
 stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 =
-0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%=
" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Ex=
tensibility" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"h=
ttp://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe ce=
nter; justify-content: unsafe center; width: 118px; height: 1px; padding-to=
p: 560px; margin-left: 2438px;"><div data-drawio-colors=3D"color: rgb(0, 0,=
 0); " style=3D"box-sizing: border-box; font-size: 0px; text-align: center;=
"><div style=3D"display: inline-block; font-size: 12px; font-family: &quot;=
Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-event=
s: all; white-space: normal; overflow-wrap: normal;"><font data-font-src=3D=
"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">deploy-<b><=
i>pkg</i></b></font></div></div></div></foreignObject><text x=3D"2497" y=3D=
"564" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12=
px" text-anchor=3D"middle">deploy-pkg</text></switch></g><path d=3D"M 9988 =
2860 L 9988 3014.53" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"=
4" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 9988 30=
35.53 L 9978.67 3007.53 L 9988 3014.53 L 9997.33 3007.53 Z" fill=3D"rgb(0, =
0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" =
pointer-events=3D"all"/><rect x=3D"9748" y=3D"2700" width=3D"480" height=3D=
"160" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0=
)" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.=
5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"10=
0%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#=
Extensibility" style=3D"overflow: visible; text-align: left;"><div xmlns=3D=
"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe =
center; justify-content: unsafe center; width: 118px; height: 1px; padding-=
top: 695px; margin-left: 2438px;"><div data-drawio-colors=3D"color: rgb(0, =
0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-align: cente=
r;"><div style=3D"display: inline-block; font-size: 12px; font-family: &quo=
t;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-eve=
nts: all; white-space: normal; overflow-wrap: normal;"><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter"><b>${PAC=
KAGE_ARCH}</b></font></div></div></div></foreignObject><text x=3D"2497" y=
=3D"699" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D=
"12px" text-anchor=3D"middle">${PACKAGE_ARCH}</text></switch></g><rect x=3D=
"9028" y=3D"1360" width=3D"1640" height=3D"595" fill=3D"rgb(255, 255, 255)"=
 stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-dasharray=3D"12 12" poin=
ter-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><=
foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" requir=
edFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"ov=
erflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xh=
tml" style=3D"display: flex; align-items: unsafe center; justify-content: u=
nsafe center; width: 408px; height: 1px; padding-top: 414px; margin-left: 2=
258px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizi=
ng: border-box; font-size: 0px; text-align: center;"><div style=3D"display:=
 inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; c=
olor: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: nor=
mal; overflow-wrap: normal;"><font style=3D"font-size: 15px;">This can be <=
b><u>rpms</u></b>, <b><u>debs</u></b> or <b><u>ipks</u></b>.<br />These are=
 provided by<br /><b><u>package_rpm</u></b>, <b><u>package_deb</u></b> and =
<b><u>package_ipk</u></b> classes respectively, use <b><u>PACKAGE_CLASSES</=
u></b> for that as<br />content of <b><u>PACKAGE_CLASSES</u></b> will be ap=
pended<br />to <b><u>INHERIT</u></b><br /></font></div></div></div></foreig=
nObject><text x=3D"2462" y=3D"418" fill=3D"rgb(0, 0, 0)" font-family=3D"Lib=
eration Sans" font-size=3D"12px" text-anchor=3D"middle">This can be rpms, d=
ebs or ipks....</text></switch></g><path d=3D"M 10522 3105 L 10708 3105.59 =
Q 10748 3105.71 10748 3065.71 L 10748 1320.57 Q 10748 1280.57 10708 1280.57=
 L 7353.71 1280.57 Q 7313.71 1280.57 7313.8 1240.57 L 7313.92 1180.42" fill=
=3D"none" stroke=3D"#000000" stroke-width=3D"12" stroke-miterlimit=3D"10" p=
ointer-events=3D"stroke"/><path d=3D"M 7313.97 1153.42 L 7331.9 1189.45 L 7=
313.92 1180.42 L 7295.9 1189.38 Z" fill=3D"#000000" stroke=3D"#000000" stro=
ke-width=3D"12" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D=
"9454" y=3D"3040" width=3D"1068" height=3D"130" rx=3D"19.5" ry=3D"19.5" fil=
l=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" pointer-events=3D"all"/=
><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject point=
er-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http:=
//www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; te=
xt-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"displ=
ay: flex; align-items: unsafe center; justify-content: unsafe center; width=
: 265px; height: 1px; padding-top: 776px; margin-left: 2365px;"><div data-d=
rawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; fon=
t-size: 0px; text-align: center;"><div style=3D"display: inline-block; font=
-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0);=
 line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap:=
 normal;">sayhello-0.1-r0.${PACKAGE_ARCH}.<i>pkg</i></div></div></div></for=
eignObject><text x=3D"2497" y=3D"780" fill=3D"rgb(0, 0, 0)" font-family=3D"=
Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">sayhello-0.1-r0.=
${PACKAGE_ARCH}.pkg</text></switch></g><rect x=3D"10788" y=3D"2640" width=
=3D"1480" height=3D"680" fill=3D"none" stroke=3D"#36393d" stroke-width=3D"4=
" stroke-dasharray=3D"12 12" pointer-events=3D"all"/><g transform=3D"transl=
ate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" widt=
h=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/f=
eature#Extensibility" style=3D"overflow: visible; text-align: left;"><div x=
mlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: =
unsafe center; justify-content: unsafe center; width: 368px; height: 1px; p=
adding-top: 745px; margin-left: 2698px;"><div data-drawio-colors=3D"color: =
rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-align=
: center;"><div style=3D"display: inline-block; font-size: 12px; font-famil=
y: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; poin=
ter-events: all; white-space: normal; overflow-wrap: normal;"><font style=
=3D"font-size: 15px;">This task also depends on <b><u>PACKAGE_CLASSES</u></=
b>,<br /><b><u><i>pkg</i></u></b>=C2=A0can be <b><u>rpm</u></b>, <b><u>deb<=
/u></b> or <b><u>ipk</u></b> for <b><u>package_rpm</u></b>,<br /><b><u>pack=
age_deb</u></b> or <u style=3D"font-weight: bold;">package_ipk</u>=C2=A0res=
pectively.<br />The generated package generally named using:<br /><b><u>${P=
N}</u></b>, <b><u>${PR}</u></b>, <b><u>${PACKAGE_ARCH}</u></b> and=C2=A0<b>=
<u><i>pkg</i></u></b><br /></font></div></div></div></foreignObject><text x=
=3D"2882" y=3D"749" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" f=
ont-size=3D"12px" text-anchor=3D"middle">This task also depends on PACKAGE_=
CLASSES,...</text></switch></g><path d=3D"M 7314 520 L 7314 654.53" fill=3D=
"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" =
pointer-events=3D"stroke"/><path d=3D"M 7314 675.53 L 7300 647.53 L 7314 65=
4.53 L 7328 647.53 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-=
width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/><path d=3D"M 7=
454 440 Q 7454 440 7742.53 440" fill=3D"none" stroke=3D"rgb(0, 0, 0)" strok=
e-width=3D"4" stroke-miterlimit=3D"10" stroke-dasharray=3D"12 12" pointer-e=
vents=3D"stroke"/><path d=3D"M 7763.53 440 L 7735.53 449.33 L 7742.53 440 L=
 7735.53 430.67 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-wid=
th=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"7174" =
y=3D"360" width=3D"280" height=3D"160" rx=3D"24" ry=3D"24" fill=3D"rgb(255,=
 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" pointer-events=3D"al=
l"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject po=
inter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"ht=
tp://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible;=
 text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"di=
splay: flex; align-items: unsafe center; justify-content: unsafe center; wi=
dth: 68px; height: 1px; padding-top: 110px; margin-left: 1795px;"><div data=
-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; f=
ont-size: 0px; text-align: center;"><div style=3D"display: inline-block; fo=
nt-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0=
); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wra=
p: normal;"><font data-font-src=3D"https://fonts.googleapis.com/css?family=
=3DArchitects+Daughter">deploy</font></div></div></div></foreignObject><tex=
t x=3D"1829" y=3D"114" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans=
" font-size=3D"12px" text-anchor=3D"middle">deploy</text></switch></g><path=
 d=3D"M 7313.71 840 L 7313.71 880.57 Q 7313.71 920.57 7313.71 910.29 L 7313=
.71 905.14 Q 7313.71 900 7313.81 927.26 L 7313.91 954.53" fill=3D"none" str=
oke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-ev=
ents=3D"stroke"/><path d=3D"M 7313.98 975.53 L 7299.88 947.58 L 7313.91 954=
.53 L 7327.88 947.48 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" strok=
e-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"7=
054.48" y=3D"680" width=3D"519" height=3D"160" rx=3D"24" ry=3D"24" fill=3D"=
rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" pointer-even=
ts=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignO=
bject pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatur=
es=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: =
visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" sty=
le=3D"display: flex; align-items: unsafe center; justify-content: unsafe ce=
nter; width: 128px; height: 1px; padding-top: 190px; margin-left: 1765px;">=
<div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: bord=
er-box; font-size: 0px; text-align: center;"><div style=3D"display: inline-=
block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rg=
b(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; ove=
rflow-wrap: normal;"><b>${DEPLOY_DIR_<i>pkg</i>}</b></div></div></div></for=
eignObject><text x=3D"1828" y=3D"194" fill=3D"rgb(0, 0, 0)" font-family=3D"=
Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">${DEPLOY_DIR_pkg=
}</text></switch></g><rect x=3D"9488" y=3D"3680" width=3D"600" height=3D"12=
0" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" pointer-events=3D=
"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject=
 pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D=
"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visib=
le; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D=
"display: flex; align-items: unsafe center; justify-content: unsafe center;=
 width: 1px; height: 1px; padding-top: 935px; margin-left: 2447px;"><div da=
ta-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box;=
 font-size: 0px; text-align: center;"><div style=3D"display: inline-block; =
font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0,=
 0); line-height: 1.2; pointer-events: all; white-space: nowrap;"><font dat=
a-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter=
">do_package_write_<i>pkg</i><br /></font></div></div></div></foreignObject=
><text x=3D"2447" y=3D"939" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation=
 Sans" font-size=3D"12px" text-anchor=3D"middle">do_package_write_pkg&#xa;<=
/text></switch></g><ellipse cx=3D"9408" cy=3D"3740" rx=3D"60.00000000000001=
" ry=3D"60.00000000000001" fill=3D"#000000" stroke=3D"#56517e" stroke-width=
=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)=
"><switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"1=
00%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" =
style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.=
org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify=
-content: unsafe center; width: 28px; height: 1px; padding-top: 935px; marg=
in-left: 2338px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=
=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div style=
=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation S=
ans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; whit=
e-space: normal; overflow-wrap: normal;"><font data-font-src=3D"https://fon=
ts.googleapis.com/css?family=3DArchitects+Daughter" color=3D"#ffffff" size=
=3D"1"><b style=3D"font-size: 15px;">17</b></font></div></div></div></forei=
gnObject><text x=3D"2352" y=3D"939" fill=3D"rgb(0, 0, 0)" font-family=3D"Li=
beration Sans" font-size=3D"12px" text-anchor=3D"middle">17</text></switch>=
</g><path d=3D"M 10048 3740 Q 11528.57 3740 11528.03 3345.47" fill=3D"none"=
 stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" stroke=
-dasharray=3D"12 12" pointer-events=3D"stroke"/><path d=3D"M 11528.01 3324.=
47 L 11537.38 3352.46 L 11528.03 3345.47 L 11518.71 3352.48 Z" fill=3D"rgb(=
0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"1=
0" pointer-events=3D"all"/><rect x=3D"7074" y=3D"980" width=3D"480" height=
=3D"160" rx=3D"24" ry=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0=
, 0)" stroke-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(=
-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" width=3D=
"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/featu=
re#Extensibility" style=3D"overflow: visible; text-align: left;"><div xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsa=
fe center; justify-content: unsafe center; width: 118px; height: 1px; paddi=
ng-top: 265px; margin-left: 1770px;"><div data-drawio-colors=3D"color: rgb(=
0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-align: ce=
nter;"><div style=3D"display: inline-block; font-size: 12px; font-family: &=
quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-=
events: all; white-space: normal; overflow-wrap: normal;">${PACKAGE_ARCH}</=
div></div></div></foreignObject><text x=3D"1829" y=3D"269" fill=3D"rgb(0, 0=
, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"mid=
dle">${PACKAGE_ARCH}</text></switch></g><rect x=3D"7768" y=3D"672.52" width=
=3D"1660" height=3D"167.48" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0,=
 0)" stroke-width=3D"4" stroke-dasharray=3D"12 12" pointer-events=3D"all"/>=
<g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointe=
r-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http:/=
/www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; tex=
t-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"displa=
y: flex; align-items: unsafe center; justify-content: unsafe center; width:=
 413px; height: 1px; padding-top: 189px; margin-left: 1943px;"><div data-dr=
awio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font=
-size: 0px; text-align: center;"><div style=3D"display: inline-block; font-=
size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); =
line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: =
normal;"><font style=3D"font-size: 15px;">For packages, this can be <b><u>I=
PK</u></b>, <b><u>RPM</u></b> or <b><u>DEB</u></b> (<i>check step 17</i>)</=
font></div></div></div></foreignObject><text x=3D"2150" y=3D"193" fill=3D"r=
gb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=
=3D"middle">For packages, this can be IPK, RPM or DEB (check step 17)</text=
></switch></g><rect x=3D"7369.48" y=3D"480" width=3D"320" height=3D"100" rx=
=3D"15" ry=3D"15" fill=3D"#000000" stroke=3D"none" pointer-events=3D"all"/>=
<g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointe=
r-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http:/=
/www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; tex=
t-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"displa=
y: flex; align-items: unsafe center; justify-content: unsafe center; width:=
 78px; height: 1px; padding-top: 133px; margin-left: 1843px;"><div data-dra=
wio-colors=3D"color: #ffffff; " style=3D"box-sizing: border-box; font-size:=
 0px; text-align: center;"><div style=3D"display: inline-block; font-size: =
12px; font-family: &quot;Liberation Sans&quot;; color: rgb(255, 255, 255); =
line-height: 1.2; pointer-events: all; font-weight: bold; white-space: norm=
al; overflow-wrap: normal;"><font data-font-src=3D"https://fonts.googleapis=
.com/css?family=3DArchitects+Daughter">DEPLOY_DIR</font></div></div></div><=
/foreignObject><text x=3D"1882" y=3D"136" fill=3D"#ffffff" font-family=3D"L=
iberation Sans" font-size=3D"12px" text-anchor=3D"middle" font-weight=3D"bo=
ld">DEPLOY_DIR</text></switch></g><rect x=3D"4988" y=3D"80" width=3D"240" h=
eight=3D"100" rx=3D"15" ry=3D"15" fill=3D"#000000" stroke=3D"none" pointer-=
events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><fore=
ignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFe=
atures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overfl=
ow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml"=
 style=3D"display: flex; align-items: unsafe center; justify-content: unsaf=
e center; width: 58px; height: 1px; padding-top: 33px; margin-left: 1248px;=
"><div data-drawio-colors=3D"color: #ffffff; " style=3D"box-sizing: border-=
box; font-size: 0px; text-align: center;"><div style=3D"display: inline-blo=
ck; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(2=
55, 255, 255); line-height: 1.2; pointer-events: all; font-weight: bold; wh=
ite-space: normal; overflow-wrap: normal;"><font data-font-src=3D"https://f=
onts.googleapis.com/css?family=3DArchitects+Daughter">TMPDIR</font></div></=
div></div></foreignObject><text x=3D"1277" y=3D"36" fill=3D"#ffffff" font-f=
amily=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle" font-we=
ight=3D"bold">TMPDIR</text></switch></g><rect x=3D"1668" y=3D"480" width=3D=
"250.72" height=3D"100" rx=3D"15" ry=3D"15" fill=3D"#000000" stroke=3D"none=
" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><sw=
itch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" =
requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=
=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1=
999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-cont=
ent: unsafe center; width: 61px; height: 1px; padding-top: 133px; margin-le=
ft: 418px;"><div data-drawio-colors=3D"color: #ffffff; " style=3D"box-sizin=
g: border-box; font-size: 0px; text-align: center;"><div style=3D"display: =
inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; co=
lor: rgb(255, 255, 255); line-height: 1.2; pointer-events: all; font-weight=
: bold; white-space: normal; overflow-wrap: normal;"><font data-font-src=3D=
"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">DL_DIR</fon=
t></div></div></div></foreignObject><text x=3D"448" y=3D"136" fill=3D"#ffff=
ff" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middl=
e" font-weight=3D"bold">DL_DIR</text></switch></g><path d=3D"M 7573.48 760 =
L 7630.29 760.34 Q 7670.29 760.57 7706.42 758.98 L 7742.55 757.38" fill=3D"=
none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" s=
troke-dasharray=3D"12 12" pointer-events=3D"stroke"/><path d=3D"M 7763.53 7=
56.46 L 7735.97 767.02 L 7742.55 757.38 L 7735.15 748.37 Z" fill=3D"rgb(0, =
0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" =
pointer-events=3D"all"/><rect x=3D"10488" y=3D"2380" width=3D"600" height=
=3D"120" fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" pointer-eve=
nts=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreign=
Object pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatu=
res=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow:=
 visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" st=
yle=3D"display: flex; align-items: unsafe center; justify-content: unsafe c=
enter; width: 1px; height: 1px; padding-top: 610px; margin-left: 2697px;"><=
div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: borde=
r-box; font-size: 0px; text-align: center;"><div style=3D"display: inline-b=
lock; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb=
(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: nowrap;"><fo=
nt data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Da=
ughter">do_package_write_<i>pkg</i><br /></font></div></div></div></foreign=
Object><text x=3D"2697" y=3D"614" fill=3D"rgb(0, 0, 0)" font-family=3D"Libe=
ration Sans" font-size=3D"12px" text-anchor=3D"middle">do_package_write_pkg=
&#xa;</text></switch></g><ellipse cx=3D"10408" cy=3D"2440" rx=3D"60.0000000=
0000001" ry=3D"60.00000000000001" fill=3D"#000000" stroke=3D"#56517e" strok=
e-width=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)s=
cale(4)"><switch><foreignObject pointer-events=3D"none" width=3D"100%" heig=
ht=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensib=
ility" style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://=
www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; =
justify-content: unsafe center; width: 28px; height: 1px; padding-top: 610p=
x; margin-left: 2588px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " =
style=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div =
style=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberat=
ion Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all;=
 white-space: normal; overflow-wrap: normal;"><font data-font-src=3D"https:=
//fonts.googleapis.com/css?family=3DArchitects+Daughter" color=3D"#ffffff" =
size=3D"1"><b style=3D"font-size: 15px;">18</b></font></div></div></div></f=
oreignObject><text x=3D"2602" y=3D"614" fill=3D"rgb(0, 0, 0)" font-family=
=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">18</text></s=
witch></g><path d=3D"M 10268 2310.29 Q 10879.43 2310.29 10879.43 1999.43 Q =
10879.43 1688.57 10878.68 1140.47" fill=3D"none" stroke=3D"rgb(0, 0, 0)" st=
roke-width=3D"4" stroke-miterlimit=3D"10" stroke-dasharray=3D"12 12" pointe=
r-events=3D"stroke"/><path d=3D"M 10878.65 1119.47 L 10888.02 1147.46 L 108=
78.68 1140.47 L 10869.35 1147.48 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, =
0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/>=
<rect x=3D"10148" y=3D"2260" width=3D"120" height=3D"100" rx=3D"15" ry=3D"1=
5" fill=3D"#000000" stroke=3D"none" pointer-events=3D"all"/><path d=3D"M 10=
088 2200 Q 10088.57 2077.14 10173.14 2077.14 Q 10257.71 2077.14 10257.94 19=
80.47" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-mite=
rlimit=3D"10" stroke-dasharray=3D"12 12" pointer-events=3D"stroke"/><path d=
=3D"M 10257.99 1959.47 L 10267.26 1987.49 L 10257.94 1980.47 L 10248.59 198=
7.45 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" st=
roke-miterlimit=3D"10" pointer-events=3D"all"/><rect x=3D"9628" y=3D"805" w=
idth=3D"1667.52" height=3D"310" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0=
, 0, 0)" stroke-width=3D"4" stroke-dasharray=3D"12 12" pointer-events=3D"al=
l"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject po=
inter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"ht=
tp://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible;=
 text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"di=
splay: flex; align-items: unsafe center; justify-content: unsafe center; wi=
dth: 415px; height: 1px; padding-top: 240px; margin-left: 2408px;"><div dat=
a-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; =
font-size: 0px; text-align: center;"><div style=3D"display: inline-block; f=
ont-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, =
0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wr=
ap: normal;"><font style=3D"font-size: 15px;">This can be <b><u>PKGWRITEDIR=
RPM</u></b>, <b><u>PKGWRITEDIRDEB</u></b> or <b><u>PKGWRITEDIRIPK</u></b> f=
or <b><u>package_rpm</u></b>, <b><u>package_deb</u></b><br />or <b><u>packa=
ge_ipk</u></b> respectively<br /></font></div></div></div></foreignObject><=
text x=3D"2615" y=3D"244" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation S=
ans" font-size=3D"12px" text-anchor=3D"middle">This can be PKGWRITEDIRRPM, =
PKGWRITEDIRDEB or PKGWRITEDIRIPK for pack...</text></switch></g><rect x=3D"=
628" y=3D"2470" width=3D"1313" height=3D"410" fill=3D"none" stroke=3D"rgb(0=
, 0, 0)" stroke-width=3D"4" stroke-dasharray=3D"12 12" pointer-events=3D"al=
l"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject po=
inter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"ht=
tp://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible;=
 text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"di=
splay: flex; align-items: unsafe center; justify-content: unsafe center; wi=
dth: 326px; height: 1px; padding-top: 669px; margin-left: 158px;"><div data=
-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; f=
ont-size: 0px; text-align: center;"><div style=3D"display: inline-block; fo=
nt-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0=
); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wra=
p: normal;"><span style=3D"font-size: 15px;">License checking happens in <b=
><u>do_populate_lic</u></b> after <b><u>do_patch<br /></u></b>and before th=
at a checksum check<br />happends on=C2=A0<b><u>LIC_FILES_CHKSUM</u></b> if=
 the<br />license is not <b><u>CLOSED</u></b><br /></span></div></div></div=
></foreignObject><text x=3D"321" y=3D"672" fill=3D"rgb(0, 0, 0)" font-famil=
y=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">License che=
cking happens in do_populate_lic after do_pa...</text></switch></g><rect x=
=3D"3528.48" y=3D"1360" width=3D"1739.52" height=3D"280" fill=3D"none" stro=
ke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-dasharray=3D"12 12" pointer-e=
vents=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><forei=
gnObject pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFea=
tures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflo=
w: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" =
style=3D"display: flex; align-items: unsafe center; justify-content: unsafe=
 center; width: 433px; height: 1px; padding-top: 375px; margin-left: 883px;=
"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: bo=
rder-box; font-size: 0px; text-align: center;"><div style=3D"display: inlin=
e-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: =
rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; o=
verflow-wrap: normal;"><span style=3D"font-size: 15px;">This variable is us=
ed to separate recipes<br />based on their target. This has value of<br /><=
b><u>${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}</u></b><br /></span></div=
></div></div></foreignObject><text x=3D"1100" y=3D"379" fill=3D"rgb(0, 0, 0=
)" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle=
">This variable is used to separate recipes...</text></switch></g><path d=
=3D"M 6588 660 Q 6863.43 660 6863.4 505.47" fill=3D"none" stroke=3D"rgb(0, =
0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" stroke-dasharray=3D"12 1=
2" pointer-events=3D"stroke"/><path d=3D"M 6863.39 484.47 L 6872.73 512.47 =
L 6863.4 505.47 L 6854.06 512.47 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, =
0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/>=
<rect x=3D"6148" y=3D"620" width=3D"440" height=3D"80" rx=3D"12" ry=3D"12" =
fill=3D"#eeeeee" stroke=3D"#36393d" stroke-width=3D"4" pointer-events=3D"al=
l"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject po=
inter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"ht=
tp://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible;=
 text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"di=
splay: flex; align-items: unsafe center; justify-content: unsafe center; wi=
dth: 108px; height: 1px; padding-top: 165px; margin-left: 1538px;"><div dat=
a-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; =
font-size: 0px; text-align: center;"><div style=3D"display: inline-block; f=
ont-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, =
0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wr=
ap: normal;">conf-notes.txt</div></div></div></foreignObject><text x=3D"159=
2" y=3D"169" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-siz=
e=3D"12px" text-anchor=3D"middle">conf-notes.txt</text></switch></g><path d=
=3D"M 2580.02 520 Q 2580 660 3042.53 660" fill=3D"none" stroke=3D"rgb(0, 0,=
 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" stroke-dasharray=3D"12 12"=
 pointer-events=3D"stroke"/><path d=3D"M 3063.53 660 L 3035.53 669.33 L 304=
2.53 660 L 3035.53 650.67 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rgb(0, 0, 0)" =
stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"all"/><path d=
=3D"M 2374 440 Q 2215.43 440.57 2215.04 205.47" fill=3D"none" stroke=3D"rgb=
(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" stroke-dasharray=3D"=
12 12" pointer-events=3D"stroke"/><path d=3D"M 2215.01 184.47 L 2224.39 212=
.46 L 2215.04 205.47 L 2205.72 212.49 Z" fill=3D"rgb(0, 0, 0)" stroke=3D"rg=
b(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-events=3D"a=
ll"/><rect x=3D"2374" y=3D"360" width=3D"412.04" height=3D"160" rx=3D"24" r=
y=3D"24" fill=3D"rgb(255, 255, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=
=3D"4" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)=
"><switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"1=
00%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" =
style=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.=
org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify=
-content: unsafe center; width: 101px; height: 1px; padding-top: 110px; mar=
gin-left: 595px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=
=3D"box-sizing: border-box; font-size: 0px; text-align: center;"><div style=
=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation S=
ans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; whit=
e-space: normal; overflow-wrap: normal;"><font data-font-src=3D"https://fon=
ts.googleapis.com/css?family=3DArchitects+Daughter">sstate-cache</font></di=
v></div></div></foreignObject><text x=3D"645" y=3D"114" fill=3D"rgb(0, 0, 0=
)" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle=
">sstate-cache</text></switch></g><rect x=3D"2643.92" y=3D"480" width=3D"33=
2.04" height=3D"100" rx=3D"15" ry=3D"15" fill=3D"#000000" stroke=3D"none" p=
ointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switc=
h><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" req=
uiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D=
"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999=
/xhtml" style=3D"display: flex; align-items: unsafe center; justify-content=
: unsafe center; width: 81px; height: 1px; padding-top: 133px; margin-left:=
 662px;"><div data-drawio-colors=3D"color: #ffffff; " style=3D"box-sizing: =
border-box; font-size: 0px; text-align: center;"><div style=3D"display: inl=
ine-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color=
: rgb(255, 255, 255); line-height: 1.2; pointer-events: all; font-weight: b=
old; white-space: normal; overflow-wrap: normal;"><font data-font-src=3D"ht=
tps://fonts.googleapis.com/css?family=3DArchitects+Daughter">SSTATE_DIR</fo=
nt></div></div></div></foreignObject><text x=3D"702" y=3D"136" fill=3D"#fff=
fff" font-family=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"midd=
le" font-weight=3D"bold">SSTATE_DIR</text></switch></g><rect x=3D"8927.96" =
y=3D"3440" width=3D"360" height=3D"110" rx=3D"16.5" ry=3D"16.5" fill=3D"#ee=
eeee" stroke=3D"#36393d" stroke-width=3D"4" pointer-events=3D"all"/><g tran=
sform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-event=
s=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3=
.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible; text-align=
: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex=
; align-items: unsafe center; justify-content: unsafe center; width: 88px; =
height: 1px; padding-top: 874px; margin-left: 2233px;"><div data-drawio-col=
ors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0=
px; text-align: center;"><div style=3D"display: inline-block; font-size: 12=
px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-hei=
ght: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;"=
>sayhello</div></div></div></foreignObject><text x=3D"2277" y=3D"877" fill=
=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" text-a=
nchor=3D"middle">sayhello</text></switch></g><path d=3D"M 4660 1960 Q 4660 =
2300 4904.57 2300 Q 5149.14 2300 5148.94 2611.65" fill=3D"none" stroke=3D"r=
gb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" stroke-dasharray=
=3D"12 12" pointer-events=3D"stroke"/><path d=3D"M 5148.92 2632.65 L 5139.6=
1 2604.64 L 5148.94 2611.65 L 5158.27 2604.65 Z" fill=3D"rgb(0, 0, 0)" stro=
ke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-miterlimit=3D"10" pointer-eve=
nts=3D"all"/><rect x=3D"3068" y=3D"480" width=3D"1640" height=3D"360" fill=
=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-dasharray=3D"12=
 12" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)">=
<switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100=
%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" st=
yle=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.or=
g/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-c=
ontent: unsafe center; width: 408px; height: 1px; padding-top: 165px; margi=
n-left: 768px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"=
box-sizing: border-box; font-size: 0px; text-align: center;"><div style=3D"=
display: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&=
quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-sp=
ace: normal; overflow-wrap: normal;"><span style=3D"font-size: 15px;">This =
folder contains cache for recipes build output, this is used by BitBake, if=
 the recipe checksum did not change it knows that the output to use is the =
same.<br /></span></div></div></div></foreignObject><text x=3D"972" y=3D"16=
9" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px"=
 text-anchor=3D"middle">This folder contains cache for recipes build output=
, this is used by...</text></switch></g><rect x=3D"1395" y=3D"0" width=3D"1=
640" height=3D"180" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4=
" stroke-dasharray=3D"12 12" pointer-events=3D"all"/><g transform=3D"transl=
ate(-0.5 -0.5)scale(4)"><switch><foreignObject pointer-events=3D"none" widt=
h=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/f=
eature#Extensibility" style=3D"overflow: visible; text-align: left;"><div x=
mlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: =
unsafe center; justify-content: unsafe center; width: 408px; height: 1px; p=
adding-top: 23px; margin-left: 350px;"><div data-drawio-colors=3D"color: rg=
b(0, 0, 0); " style=3D"box-sizing: border-box; font-size: 0px; text-align: =
center;"><div style=3D"display: inline-block; font-size: 12px; font-family:=
 &quot;Liberation Sans&quot;; color: rgb(0, 0, 0); line-height: 1.2; pointe=
r-events: all; white-space: normal; overflow-wrap: normal;"><span style=3D"=
font-size: 15px;"><font data-font-src=3D"https://fonts.googleapis.com/css?f=
amily=3DLiberation+Sans">These directories can be shared accross builds to =
save disk space and build time</font><br /></span></div></div></div></forei=
gnObject><text x=3D"554" y=3D"26" fill=3D"rgb(0, 0, 0)" font-family=3D"Libe=
ration Sans" font-size=3D"12px" text-anchor=3D"middle">These directories ca=
n be shared accross builds to save disk space an...</text></switch></g><rec=
t x=3D"7768" y=3D"350" width=3D"1667.52" height=3D"180" fill=3D"rgb(255, 25=
5, 255)" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-dasharray=3D"12 =
12" pointer-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><=
switch><foreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%=
" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" sty=
le=3D"overflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org=
/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-co=
ntent: unsafe center; width: 415px; height: 1px; padding-top: 110px; margin=
-left: 1943px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"=
box-sizing: border-box; font-size: 0px; text-align: center;"><div style=3D"=
display: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&=
quot;; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-sp=
ace: normal; overflow-wrap: normal;"><font style=3D"font-size: 15px;">This =
directory contains other output directories such as <b><u>images</u></b>, <=
b><u>sdk</u></b> and <b><u>licenses</u></b><br /></font></div></div></div><=
/foreignObject><text x=3D"2150" y=3D"114" fill=3D"rgb(0, 0, 0)" font-family=
=3D"Liberation Sans" font-size=3D"12px" text-anchor=3D"middle">This directo=
ry contains other output directories such as images, sdk...</text></switch>=
</g><rect x=3D"5908" y=3D"1020" width=3D"680" height=3D"520" fill=3D"none" =
stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-dasharray=3D"12 12" point=
er-events=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><f=
oreignObject pointer-events=3D"none" width=3D"100%" height=3D"100%" require=
dFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"ove=
rflow: visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xht=
ml" style=3D"display: flex; align-items: unsafe center; justify-content: un=
safe center; width: 168px; height: 1px; padding-top: 320px; margin-left: 14=
78px;"><div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizin=
g: border-box; font-size: 0px; text-align: center;"><div style=3D"display: =
inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; co=
lor: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: norm=
al; overflow-wrap: normal;"><font style=3D"font-size: 15px;">This file cont=
ains all <b>layers</b> that BitBake should consider when looking for metada=
ta.<br /></font></div></div></div></foreignObject><text x=3D"1562" y=3D"324=
" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" font-size=3D"12px" =
text-anchor=3D"middle">This file contains all layer...</text></switch></g><=
rect x=3D"5396" y=3D"20" width=3D"1760" height=3D"160" fill=3D"none" stroke=
=3D"rgb(0, 0, 0)" stroke-width=3D"4" stroke-dasharray=3D"12 12" pointer-eve=
nts=3D"all"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreign=
Object pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatu=
res=3D"http://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow:=
 visible; text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" st=
yle=3D"display: flex; align-items: unsafe center; justify-content: unsafe c=
enter; width: 438px; height: 1px; padding-top: 25px; margin-left: 1350px;">=
<div data-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: bord=
er-box; font-size: 0px; text-align: center;"><div style=3D"display: inline-=
block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rg=
b(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; ove=
rflow-wrap: normal;"><font style=3D"font-size: 15px;">This is base configur=
ation file containing essential user config such as <b><u>MACHINE</u></b> a=
nd <b><u>DISTRO</u></b><br /></font></div></div></div></foreignObject><text=
 x=3D"1569" y=3D"29" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation Sans" =
font-size=3D"12px" text-anchor=3D"middle">This is base configuration file c=
ontaining essential user config such as...</text></switch></g><rect x=3D"61=
40" y=3D"320" width=3D"964.52" height=3D"160" fill=3D"none" stroke=3D"rgb(0=
, 0, 0)" stroke-width=3D"4" stroke-dasharray=3D"12 12" pointer-events=3D"al=
l"/><g transform=3D"translate(-0.5 -0.5)scale(4)"><switch><foreignObject po=
inter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"ht=
tp://www.w3.org/TR/SVG11/feature#Extensibility" style=3D"overflow: visible;=
 text-align: left;"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"di=
splay: flex; align-items: unsafe center; justify-content: unsafe center; wi=
dth: 239px; height: 1px; padding-top: 100px; margin-left: 1536px;"><div dat=
a-drawio-colors=3D"color: rgb(0, 0, 0); " style=3D"box-sizing: border-box; =
font-size: 0px; text-align: center;"><div style=3D"display: inline-block; f=
ont-size: 12px; font-family: &quot;Liberation Sans&quot;; color: rgb(0, 0, =
0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wr=
ap: normal;"><font style=3D"font-size: 15px;">The message to show after <b>=
source oe-init-build-env</b><br /></font></div></div></div></foreignObject>=
<text x=3D"1656" y=3D"104" fill=3D"rgb(0, 0, 0)" font-family=3D"Liberation =
Sans" font-size=3D"12px" text-anchor=3D"middle">The message to show after s=
ource oe-init...</text></switch></g><rect x=3D"10948" y=3D"2400" width=3D"1=
20" height=3D"80" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" =
pointer-events=3D"all"/><rect x=3D"10348" y=3D"3065" width=3D"80" height=3D=
"80" fill=3D"none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" pointer-event=
s=3D"all"/><rect x=3D"9948" y=3D"3700" width=3D"100" height=3D"80" fill=3D"=
none" stroke=3D"rgb(0, 0, 0)" stroke-width=3D"4" pointer-events=3D"all"/><r=
ect x=3D"10028" y=3D"2200" width=3D"80" height=3D"80" fill=3D"none" stroke=
=3D"rgb(0, 0, 0)" stroke-width=3D"4" pointer-events=3D"all"/><rect x=3D"745=
4" y=3D"725" width=3D"80" height=3D"80" fill=3D"none" stroke=3D"rgb(0, 0, 0=
)" stroke-width=3D"4" pointer-events=3D"all"/></g><switch><g requiredFeatur=
es=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"/><a transform=3D"tr=
anslate(0,-5)" xlink:href=3D"https://www.drawio.com/doc/faq/svg-export-text=
-problems" target=3D"_blank"><text text-anchor=3D"middle" font-size=3D"10px=
" x=3D"50%" y=3D"100%">Text is not SVG - cannot display</text></a></switch>=
</svg>
\ No newline at end of file
+<svg xmlns=3D"http://www.w3.org/2000/svg" style=3D"background: transparent=
; background-color: transparent; color-scheme: light dark;" xmlns:xlink=3D"=
http://www.w3.org/1999/xlink" version=3D"1.1" width=3D"3068px" height=3D"95=
1px" viewBox=3D"-0.5 -0.5 3068 951" content=3D"&lt;mxfile host=3D&quot;app.=
diagrams.net&quot; agent=3D&quot;Mozilla/5.0 (X11; Linux x86_64; rv:128.0) =
Gecko/20100101 Firefox/128.0&quot; version=3D&quot;27.1.6&quot;&gt;&#xA;  &=
lt;diagram name=3D&quot;Page-1&quot; id=3D&quot;c7558073-3199-34d8-9f00-421=
11426c3f3&quot;&gt;&#xA;    &lt;mxGraphModel dx=3D&quot;2252&quot; dy=3D&qu=
ot;796&quot; grid=3D&quot;1&quot; gridSize=3D&quot;10&quot; guides=3D&quot;=
1&quot; tooltips=3D&quot;1&quot; connect=3D&quot;1&quot; arrows=3D&quot;1&q=
uot; fold=3D&quot;1&quot; page=3D&quot;1&quot; pageScale=3D&quot;1&quot; pa=
geWidth=3D&quot;826&quot; pageHeight=3D&quot;1169&quot; background=3D&quot;=
none&quot; math=3D&quot;0&quot; shadow=3D&quot;0&quot;&gt;&#xA;      &lt;ro=
ot&gt;&#xA;        &lt;mxCell id=3D&quot;0&quot; /&gt;&#xA;        &lt;mxCe=
ll id=3D&quot;1&quot; parent=3D&quot;0&quot; /&gt;&#xA;        &lt;mxCell i=
d=3D&quot;eV5wDCu3Df9HtTySJIbg-398&quot; value=3D&quot;&quot; style=3D&quot=
;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fillColor=3Dnone;dashed=3D1;fontFam=
ily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss=
%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;=
1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1940&quot; y=3D&quot;840=
&quot; width=3D&quot;280&quot; height=3D&quot;150&quot; as=3D&quot;geometry=
&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;=
eV5wDCu3Df9HtTySJIbg-383&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyl=
e;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.75;entryY=3D1;ent=
ryDx=3D0;entryDy=3D0;endArrow=3DclassicThin;endFill=3D1;dashed=3D1;curved=
=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleap=
is.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; sou=
rce=3D&quot;eV5wDCu3Df9HtTySJIbg-380&quot; target=3D&quot;eV5wDCu3Df9HtTySJ=
Ibg-382&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relativ=
e=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            &lt;Array a=
s=3D&quot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&quot;1747&quo=
t; y=3D&quot;960&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot;1747&q=
uot; y=3D&quot;669&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA;         =
 &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=
=3D&quot;eV5wDCu3Df9HtTySJIbg-407&quot; style=3D&quot;edgeStyle=3Dorthogona=
lEdgeStyle;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.75;exitY=
=3D1;exitDx=3D0;exitDy=3D0;entryX=3D0.5;entryY=3D1;entryDx=3D0;entryDy=3D0;=
curved=3D1;strokeWidth=3D3;fillColor=3D#d0cee2;strokeColor=3D#000000;fontFa=
mily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcs=
s%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot=
;eV5wDCu3Df9HtTySJIbg-380&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-398&quo=
t; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1=
&quot; as=3D&quot;geometry&quot;&gt;&#xA;            &lt;Array as=3D&quot;p=
oints&quot;&gt;&#xA;              &lt;mxPoint x=3D&quot;1890&quot; y=3D&quo=
t;1120&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot;2080&quot; y=3D&=
quot;1120&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA;          &lt;/mxG=
eometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;e=
V5wDCu3Df9HtTySJIbg-380&quot; value=3D&quot;&quot; style=3D&quot;rounded=3D=
1;whiteSpace=3Dwrap;html=3D1;fillColor=3Dnone;dashed=3D1;fontFamily=3DLiber=
ation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3=
DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;=
&#xA;          &lt;mxGeometry x=3D&quot;1800&quot; y=3D&quot;840&quot; widt=
h=3D&quot;120&quot; height=3D&quot;240&quot; as=3D&quot;geometry&quot; /&gt=
;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9=
HtTySJIbg-211&quot; value=3D&quot;&quot; style=3D&quot;rounded=3D1;whiteSpa=
ce=3Dwrap;html=3D1;fillColor=3Dnone;dashed=3D1;fontFamily=3DLiberation Sans=
;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberatio=
n%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;     =
     &lt;mxGeometry x=3D&quot;300&quot; y=3D&quot;840&quot; width=3D&quot;2=
70&quot; height=3D&quot;240&quot; as=3D&quot;geometry&quot; /&gt;&#xA;     =
   &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-1=
42&quot; value=3D&quot;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;h=
tml=3D1;fillColor=3Dnone;glass=3D0;dashed=3D1;fontFamily=3DLiberation Sans;=
fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation=
%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;      =
    &lt;mxGeometry x=3D&quot;-146.5&quot; y=3D&quot;390&quot; width=3D&quot=
;270&quot; height=3D&quot;110&quot; as=3D&quot;geometry&quot; /&gt;&#xA;   =
     &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg=
-162&quot; value=3D&quot;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap=
;html=3D1;fillColor=3Dnone;dashed=3D1;fontFamily=3DLiberation Sans;fontSour=
ce=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;=
&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;=
mxGeometry x=3D&quot;120&quot; y=3D&quot;840&quot; width=3D&quot;140&quot; =
height=3D&quot;240&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/m=
xCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-101&quot; =
style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D=
1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0;ent=
ryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3Dnone;endFill=3D0;fo=
ntFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%=
2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&=
quot;eV5wDCu3Df9HtTySJIbg-98&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-99&q=
uot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot=
;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;  =
      &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-338&quot; style=3D&quot;ed=
geStyle=3DorthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;=
entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;rounded=3D1;fontFamily=3DLi=
beration Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamil=
y%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3=
Df9HtTySJIbg-98&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-130&quot; edge=3D=
&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=
=3D&quot;geometry&quot;&gt;&#xA;            &lt;Array as=3D&quot;points&quo=
t;&gt;&#xA;              &lt;mxPoint x=3D&quot;815&quot; y=3D&quot;240&quot=
; /&gt;&#xA;              &lt;mxPoint x=3D&quot;-11&quot; y=3D&quot;240&quo=
t; /&gt;&#xA;            &lt;/Array&gt;&#xA;          &lt;/mxGeometry&gt;&#=
xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtT=
ySJIbg-344&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthogonalLo=
op=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryD=
y=3D0;rounded=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ff=
onts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quo=
t;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-98&quot; target=3D&quot;eV5wD=
Cu3Df9HtTySJIbg-343&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeom=
etry relative=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;           =
 &lt;Array as=3D&quot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&q=
uot;815&quot; y=3D&quot;240&quot; /&gt;&#xA;              &lt;mxPoint x=3D&=
quot;1045&quot; y=3D&quot;240&quot; /&gt;&#xA;            &lt;/Array&gt;&#x=
A;          &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt=
;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-402&quot; style=3D&quot;edgeStyle=
=3DorthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=
=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;rounded=3D1;fontFamily=3DLiberati=
on Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLi=
beration%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtT=
ySJIbg-98&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-401&quot; edge=3D&quot;=
1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quo=
t;geometry&quot;&gt;&#xA;            &lt;Array as=3D&quot;points&quot;&gt;&=
#xA;              &lt;mxPoint x=3D&quot;815&quot; y=3D&quot;240&quot; /&gt;=
&#xA;              &lt;mxPoint x=3D&quot;1411&quot; y=3D&quot;240&quot; /&g=
t;&#xA;            &lt;/Array&gt;&#xA;          &lt;/mxGeometry&gt;&#xA;   =
     &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;utO5BPZsFb6q0V3ioqD-=
-12&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthogonalLoop=3D1;=
jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;r=
ounded=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.go=
ogleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quo=
t; source=3D&quot;eV5wDCu3Df9HtTySJIbg-98&quot; target=3D&quot;eV5wDCu3Df9H=
tTySJIbg-440&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry re=
lative=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            &lt;Ar=
ray as=3D&quot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&quot;815=
&quot; y=3D&quot;240&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot;22=
8&quot; y=3D&quot;240&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA;      =
    &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell =
id=3D&quot;eV5wDCu3Df9HtTySJIbg-98&quot; value=3D&quot;&amp;lt;font data-fo=
nt-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchitects+Dau=
ghter&amp;quot;&amp;gt;tmp&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=
=3D1;whiteSpace=3Dwrap;html=3D1;fillStyle=3Dauto;glass=3D0;shadow=3D0;fontF=
amily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fc=
ss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quo=
t;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;780&quot; y=3D&quot;18=
0&quot; width=3D&quot;70&quot; height=3D&quot;40&quot; as=3D&quot;geometry&=
quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;e=
V5wDCu3Df9HtTySJIbg-102&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle=
;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;endArrow=3Dnone;e=
ndFill=3D0;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.go=
ogleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quo=
t; source=3D&quot;eV5wDCu3Df9HtTySJIbg-99&quot; target=3D&quot;eV5wDCu3Df9H=
tTySJIbg-100&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry re=
lative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxC=
ell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-99&quot; val=
ue=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis.=
com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;work&amp;lt;/font&amp=
;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=
=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3F=
family%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; par=
ent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry=
 x=3D&quot;780&quot; y=3D&quot;270&quot; width=3D&quot;70&quot; height=3D&q=
uot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#x=
A;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-106&quot; style=3D&quo=
t;edgeStyle=3DorthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Dauto;html=
=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0;endArrow=3Dnone;endFill=3D=
0;rounded=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts=
.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&=
quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-100&quot; target=3D&quot;eV5wDCu3=
Df9HtTySJIbg-105&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometr=
y relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;=
/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-155&quot=
; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=
=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0;=
entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3Dnone;endFill=3D0=
;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.c=
om%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=
=3D&quot;eV5wDCu3Df9HtTySJIbg-100&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg=
-103&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=
=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt=
;&#xA;        &lt;mxCell id=3D&quot;utO5BPZsFb6q0V3ioqD--14&quot; style=3D&=
quot;edgeStyle=3DorthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Dauto;ht=
ml=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;exitX=3D0;exitY=3D0.=
5;exitDx=3D0;exitDy=3D0;curved=3D1;dashed=3D1;endArrow=3DclassicThin;endFil=
l=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googlea=
pis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; so=
urce=3D&quot;eV5wDCu3Df9HtTySJIbg-100&quot; target=3D&quot;eV5wDCu3Df9HtTyS=
JIbg-434&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relati=
ve=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&=
gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-100&quot; value=
=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis.co=
m/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;&amp;lt;b&amp;gt;${MULT=
IMACH_TARGET_OS}&amp;lt;/b&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot=
;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSo=
urce=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSan=
s;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&quot; verte=
x=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;730&quot; y=3D=
&quot;440&quot; width=3D&quot;170&quot; height=3D&quot;40&quot; as=3D&quot;=
geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=
=3D&quot;eV5wDCu3Df9HtTySJIbg-110&quot; style=3D&quot;edgeStyle=3Dorthogona=
lEdgeStyle;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=
=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0;entryX=3D0.5;entryY=3D0;entryDx=3D0;=
entryDy=3D0;endArrow=3Dnone;endFill=3D0;fontFamily=3DLiberation Sans;fontSo=
urce=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSan=
s;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-103&quo=
t; target=3D&quot;eV5wDCu3Df9HtTySJIbg-108&quot; edge=3D&quot;1&quot;&gt;&#=
xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&qu=
ot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5=
wDCu3Df9HtTySJIbg-103&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp=
;quot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quo=
t;&amp;gt;libhello&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whi=
teSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%=
2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillStyle=3Dau=
to;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot=
;&gt;&#xA;          &lt;mxGeometry x=3D&quot;326.99&quot; y=3D&quot;520&quo=
t; width=3D&quot;70&quot; height=3D&quot;40&quot; as=3D&quot;geometry&quot;=
 /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDC=
u3Df9HtTySJIbg-111&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;roun=
ded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D=
0;entryDx=3D0;entryDy=3D0;endArrow=3Dnone;endFill=3D0;fontFamily=3DLiberati=
on Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLi=
beration%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtT=
ySJIbg-105&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-109&quot; edge=3D&quot=
;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&qu=
ot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell =
id=3D&quot;eV5wDCu3Df9HtTySJIbg-105&quot; value=3D&quot;&amp;lt;font data-f=
ont-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchitects+Da=
ughter&amp;quot;&amp;gt;sayhello&amp;lt;/font&amp;gt;&quot; style=3D&quot;r=
ounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSour=
ce=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;=
fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&quot; vertex=
=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;970&quot; y=3D&=
quot;520&quot; width=3D&quot;70&quot; height=3D&quot;40&quot; as=3D&quot;ge=
ometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D=
&quot;eV5wDCu3Df9HtTySJIbg-169&quot; style=3D&quot;edgeStyle=3DorthogonalEd=
geStyle;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0=
.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3DclassicThin;endFill=3D1;fo=
ntFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%=
2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&=
quot;eV5wDCu3Df9HtTySJIbg-108&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-166=
&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&qu=
ot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            &lt;Array as=3D&qu=
ot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&quot;362&quot; y=3D&=
quot;680&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot;82&quot; y=3D&=
quot;680&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA;          &lt;/mxGe=
ometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV=
5wDCu3Df9HtTySJIbg-170&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;=
rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entry=
Y=3D0;entryDx=3D0;entryDy=3D0;endArrow=3DclassicThin;endFill=3D1;fontFamily=
=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3F=
family%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5=
wDCu3Df9HtTySJIbg-108&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-156&quot; e=
dge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quo=
t; as=3D&quot;geometry&quot;&gt;&#xA;            &lt;Array as=3D&quot;point=
s&quot;&gt;&#xA;              &lt;mxPoint x=3D&quot;362&quot; y=3D&quot;680=
&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot;190&quot; y=3D&quot;68=
0&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA;          &lt;/mxGeometry&=
gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3D=
f9HtTySJIbg-179&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=
=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;e=
ntryDx=3D0;entryDy=3D0;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0;fontFami=
ly=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%=
3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;e=
V5wDCu3Df9HtTySJIbg-108&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-175&quot;=
 edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&q=
uot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;      =
  &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-197&quot; style=3D&quot;edgeSt=
yle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;h=
tml=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0;entryX=3D0.5;entryY=3D0=
;entryDx=3D0;entryDy=3D0;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A=
%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=
=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-108&quot; target=3D&qu=
ot;eV5wDCu3Df9HtTySJIbg-171&quot; edge=3D&quot;1&quot;&gt;&#xA;          &l=
t;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;   =
         &lt;Array as=3D&quot;points&quot;&gt;&#xA;              &lt;mxPoin=
t x=3D&quot;362&quot; y=3D&quot;680&quot; /&gt;&#xA;              &lt;mxPoi=
nt x=3D&quot;660&quot; y=3D&quot;680&quot; /&gt;&#xA;            &lt;/Array=
&gt;&#xA;          &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;    =
    &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-108&quot; value=3D&quot;&amp=
;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?family=
=3DArchitects+Daughter&amp;quot;&amp;gt;0.1-r0&amp;lt;/font&amp;gt;&quot; s=
tyle=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation=
 Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLibe=
ration%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1=
&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;32=
7&quot; y=3D&quot;600&quot; width=3D&quot;70&quot; height=3D&quot;40&quot; =
as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt=
;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-309&quot; style=3D&quot;edgeStyle=
=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=
=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;fontFamily=3DLiberatio=
n Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLib=
eration%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTy=
SJIbg-109&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-172&quot; edge=3D&quot;=
1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quo=
t;geometry&quot;&gt;&#xA;            &lt;Array as=3D&quot;points&quot;&gt;&=
#xA;              &lt;mxPoint x=3D&quot;1005&quot; y=3D&quot;680&quot; /&gt=
;&#xA;              &lt;mxPoint x=3D&quot;965&quot; y=3D&quot;680&quot; /&g=
t;&#xA;            &lt;/Array&gt;&#xA;          &lt;/mxGeometry&gt;&#xA;   =
     &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg=
-311&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthog=
onalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;=
entryDy=3D0;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.g=
oogleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&qu=
ot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-109&quot; target=3D&quot;eV5wDCu3Df=
9HtTySJIbg-240&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry =
relative=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            &lt;=
Array as=3D&quot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&quot;1=
005&quot; y=3D&quot;680&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot=
;1340&quot; y=3D&quot;680&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA;  =
        &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxC=
ell id=3D&quot;eV5wDCu3Df9HtTySJIbg-312&quot; style=3D&quot;edgeStyle=3Dort=
hogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;e=
ntryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;fontFamily=3DLiberation Sans=
;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberatio=
n%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-=
109&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-249&quot; edge=3D&quot;1&quot=
;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geom=
etry&quot;&gt;&#xA;            &lt;Array as=3D&quot;points&quot;&gt;&#xA;  =
            &lt;mxPoint x=3D&quot;1005&quot; y=3D&quot;680&quot; /&gt;&#xA;=
              &lt;mxPoint x=3D&quot;1512&quot; y=3D&quot;680&quot; /&gt;&#x=
A;            &lt;/Array&gt;&#xA;          &lt;/mxGeometry&gt;&#xA;        =
&lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-360&=
quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalL=
oop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entry=
Dy=3D0;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.google=
apis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; s=
ource=3D&quot;eV5wDCu3Df9HtTySJIbg-109&quot; target=3D&quot;eV5wDCu3Df9HtTy=
SJIbg-358&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relat=
ive=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            &lt;Array=
 as=3D&quot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&quot;1005&q=
uot; y=3D&quot;680&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot;1672=
&quot; y=3D&quot;680&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA;       =
   &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell i=
d=3D&quot;eV5wDCu3Df9HtTySJIbg-368&quot; style=3D&quot;edgeStyle=3Dorthogon=
alEdgeStyle;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=
=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;fontFamily=3DLiberation Sans;font=
Source=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BS=
ans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-109&q=
uot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-366&quot; edge=3D&quot;1&quot;&gt;=
&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&=
quot;&gt;&#xA;            &lt;Array as=3D&quot;points&quot;&gt;&#xA;       =
       &lt;mxPoint x=3D&quot;1005&quot; y=3D&quot;680&quot; /&gt;&#xA;     =
         &lt;mxPoint x=3D&quot;1860&quot; y=3D&quot;680&quot; /&gt;&#xA;   =
         &lt;/Array&gt;&#xA;          &lt;/mxGeometry&gt;&#xA;        &lt;/=
mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-388&quot;=
 style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=
=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=
=3D0;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleap=
is.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; sou=
rce=3D&quot;eV5wDCu3Df9HtTySJIbg-109&quot; target=3D&quot;eV5wDCu3Df9HtTySJ=
Ibg-387&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relativ=
e=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            &lt;Array a=
s=3D&quot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&quot;1005&quo=
t; y=3D&quot;680&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot;2080&q=
uot; y=3D&quot;680&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA;         =
 &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=
=3D&quot;eV5wDCu3Df9HtTySJIbg-109&quot; value=3D&quot;&amp;lt;font data-fon=
t-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchitects+Daug=
hter&amp;quot;&amp;gt;0.1-r0&amp;lt;/font&amp;gt;&quot; style=3D&quot;round=
ed=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=
=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fi=
llStyle=3Dauto;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&quot; vertex=3D=
&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;970&quot; y=3D&quo=
t;585&quot; width=3D&quot;70&quot; height=3D&quot;40&quot; as=3D&quot;geome=
try&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&qu=
ot;eV5wDCu3Df9HtTySJIbg-134&quot; value=3D&quot;&quot; style=3D&quot;edgeSt=
yle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;h=
tml=3D1;endArrow=3Dnone;endFill=3D0;fontFamily=3DLiberation Sans;fontSource=
=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&q=
uot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-130&quot; t=
arget=3D&quot;eV5wDCu3Df9HtTySJIbg-133&quot; edge=3D&quot;1&quot;&gt;&#xA; =
         &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; =
/&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;utO5BPZ=
sFb6q0V3ioqD--19&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthog=
onalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D1;entryDx=3D0;=
entryDy=3D0;exitX=3D1;exitY=3D0.5;exitDx=3D0;exitDy=3D0;curved=3D1;dashed=
=3D1;endArrow=3DclassicThin;endFill=3D1;fontFamily=3DLiberation Sans;fontSo=
urce=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSan=
s;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-130&quo=
t; target=3D&quot;utO5BPZsFb6q0V3ioqD--17&quot; edge=3D&quot;1&quot;&gt;&#x=
A;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quo=
t; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5w=
DCu3Df9HtTySJIbg-130&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;=
quot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot=
;&amp;gt;downloads&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whi=
teSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%=
2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillStyle=3Dau=
to;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot=
;&gt;&#xA;          &lt;mxGeometry x=3D&quot;-46.5&quot; y=3D&quot;270&quot=
; width=3D&quot;70&quot; height=3D&quot;40&quot; as=3D&quot;geometry&quot; =
/&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu=
3Df9HtTySJIbg-143&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;round=
ed=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;e=
xitDx=3D0;exitDy=3D0;endArrow=3Dnone;endFill=3D0;fontFamily=3DLiberation Sa=
ns;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberat=
ion%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIb=
g-133&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-142&quot; edge=3D&quot;1&qu=
ot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;ge=
ometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D=
&quot;eV5wDCu3Df9HtTySJIbg-133&quot; value=3D&quot;&amp;lt;font data-font-s=
rc=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchitects+Daughte=
r&amp;quot;&amp;gt;git2&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D=
1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttp=
s%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillStyle=
=3Dauto;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1=
&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;-46.5&quot; y=3D&quot;330=
&quot; width=3D&quot;70&quot; height=3D&quot;40&quot; as=3D&quot;geometry&q=
uot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV=
5wDCu3Df9HtTySJIbg-223&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;=
rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D1;entryY=
=3D0.5;entryDx=3D0;entryDy=3D0;strokeWidth=3D3;fillColor=3D#d0cee2;strokeCo=
lor=3D#000000;exitX=3D1;exitY=3D0.5;exitDx=3D0;exitDy=3D0;fontFamily=3DLibe=
ration Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%=
3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df=
9HtTySJIbg-136&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-156&quot; edge=3D&=
quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=
=3D&quot;geometry&quot;&gt;&#xA;            &lt;Array as=3D&quot;points&quo=
t;&gt;&#xA;              &lt;mxPoint x=3D&quot;250&quot; y=3D&quot;470&quot=
; /&gt;&#xA;              &lt;mxPoint x=3D&quot;250&quot; y=3D&quot;758&quo=
t; /&gt;&#xA;            &lt;/Array&gt;&#xA;          &lt;/mxGeometry&gt;&#=
xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtT=
ySJIbg-135&quot; value=3D&quot;github.com.&amp;amp;lt;username&amp;amp;gt;.=
sayhello&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFam=
ily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss=
%3Ffamily%3DLiberation%2BSans;fillColor=3D#eeeeee;strokeColor=3D#36393d;&qu=
ot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxG=
eometry x=3D&quot;-126.5&quot; y=3D&quot;400&quot; width=3D&quot;230&quot; =
height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mx=
Cell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-337&quot; s=
tyle=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1=
;jettySize=3Dauto;html=3D1;entryX=3D0;entryY=3D0.5;entryDx=3D0;entryDy=3D0;=
strokeWidth=3D3;fillColor=3D#d0cee2;strokeColor=3D#000000;exitX=3D1;exitY=
=3D0.5;exitDx=3D0;exitDy=3D0;fontFamily=3DLiberation Sans;fontSource=3Dhttp=
s%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; pa=
rent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-135&quot; target=
=3D&quot;eV5wDCu3Df9HtTySJIbg-240&quot; edge=3D&quot;1&quot;&gt;&#xA;      =
    &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#=
xA;            &lt;mxPoint x=3D&quot;160&quot; y=3D&quot;500&quot; as=3D&qu=
ot;sourcePoint&quot; /&gt;&#xA;            &lt;Array as=3D&quot;points&quot=
;&gt;&#xA;              &lt;mxPoint x=3D&quot;1250&quot; y=3D&quot;420&quot=
; /&gt;&#xA;              &lt;mxPoint x=3D&quot;1250&quot; y=3D&quot;740&qu=
ot; /&gt;&#xA;            &lt;/Array&gt;&#xA;          &lt;/mxGeometry&gt;&=
#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9Ht=
TySJIbg-136&quot; value=3D&quot;github.com.&amp;amp;lt;username&amp;amp;gt;=
.libhello&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFa=
mily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcs=
s%3Ffamily%3DLiberation%2BSans;fillColor=3D#eeeeee;strokeColor=3D#36393d;&q=
uot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mx=
Geometry x=3D&quot;-126.5&quot; y=3D&quot;450&quot; width=3D&quot;230&quot;=
 height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/m=
xCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-164&quot; =
style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;curved=3D1;rounded=3D1;orthog=
onalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exi=
tDy=3D0;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;fontFamily=3DLibera=
tion Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3D=
Liberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9H=
tTySJIbg-156&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-162&quot; edge=3D&qu=
ot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&=
quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCel=
l id=3D&quot;eV5wDCu3Df9HtTySJIbg-156&quot; value=3D&quot;sources/libhello-=
0.1&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=
=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3F=
family%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; par=
ent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry=
 x=3D&quot;150&quot; y=3D&quot;737.5&quot; width=3D&quot;65&quot; height=3D=
&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&=
#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-159&quot; value=3D&q=
uot;Makefile&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fon=
tFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2=
Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#f5f5f5;fontColor=3D#333333;s=
trokeColor=3D#666666;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&g=
t;&#xA;          &lt;mxGeometry x=3D&quot;136&quot; y=3D&quot;860&quot; wid=
th=3D&quot;114&quot; height=3D&quot;20&quot; as=3D&quot;geometry&quot; /&gt=
;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9=
HtTySJIbg-433&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=
=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D1;entryY=3D0.5;e=
ntryDx=3D0;entryDy=3D0;endArrow=3DclassicThin;endFill=3D1;dashed=3D1;fontFa=
mily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcs=
s%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot=
;eV5wDCu3Df9HtTySJIbg-160&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-432&quo=
t; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1=
&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;    =
    &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-160&quot; value=3D&quot;LICE=
NSE&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=
=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3F=
family%3DLiberation%2BSans;fillColor=3D#eeeeee;strokeColor=3D#36393d;&quot;=
 parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeom=
etry x=3D&quot;136&quot; y=3D&quot;890&quot; width=3D&quot;114&quot; height=
=3D&quot;20&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&g=
t;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-215&quot; style=
=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Daut=
o;html=3D1;entryX=3D0;entryY=3D0.5;entryDx=3D0;entryDy=3D0;exitX=3D0;exitY=
=3D0.5;exitDx=3D0;exitDy=3D0;curved=3D1;endArrow=3DclassicThin;endFill=3D1;=
strokeWidth=3D3;fillColor=3D#d0cee2;strokeColor=3D#000000;fontFamily=3DLibe=
ration Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%=
3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df=
9HtTySJIbg-161&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-163&quot; edge=3D&=
quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=
=3D&quot;geometry&quot;&gt;&#xA;            &lt;Array as=3D&quot;points&quo=
t;&gt;&#xA;              &lt;mxPoint x=3D&quot;90&quot; y=3D&quot;930&quot;=
 /&gt;&#xA;              &lt;mxPoint x=3D&quot;90&quot; y=3D&quot;960&quot;=
 /&gt;&#xA;            &lt;/Array&gt;&#xA;          &lt;/mxGeometry&gt;&#xA=
;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTyS=
JIbg-161&quot; value=3D&quot;fix.patch&quot; style=3D&quot;rounded=3D1;whit=
eSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2=
F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#f5=
f5f5;fontColor=3D#333333;strokeColor=3D#666666;&quot; parent=3D&quot;1&quot=
; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;136&quo=
t; y=3D&quot;920&quot; width=3D&quot;114&quot; height=3D&quot;20&quot; as=
=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;m=
xCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-219&quot; style=3D&quot;edgeStyle=3Do=
rthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0;=
entryY=3D0.5;entryDx=3D0;entryDy=3D0;exitX=3D0.006;exitY=3D0.893;exitDx=3D0=
;exitDy=3D0;curved=3D1;exitPerimeter=3D0;strokeWidth=3D3;fillColor=3D#d0cee=
2;strokeColor=3D#000000;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%=
2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=
=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-163&quot; target=3D&qu=
ot;eV5wDCu3Df9HtTySJIbg-214&quot; edge=3D&quot;1&quot;&gt;&#xA;          &l=
t;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;   =
         &lt;Array as=3D&quot;points&quot;&gt;&#xA;              &lt;mxPoin=
t x=3D&quot;80&quot; y=3D&quot;968&quot; /&gt;&#xA;              &lt;mxPoin=
t x=3D&quot;80&quot; y=3D&quot;1031&quot; /&gt;&#xA;            &lt;/Array&=
gt;&#xA;          &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;     =
   &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-163&quot; value=3D&quot;hello=
lib.c&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=
=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3F=
family%3DLiberation%2BSans;fillColor=3D#f5f5f5;fontColor=3D#333333;strokeCo=
lor=3D#666666;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;=
          &lt;mxGeometry x=3D&quot;136&quot; y=3D&quot;950&quot; width=3D&q=
uot;114&quot; height=3D&quot;20&quot; as=3D&quot;geometry&quot; /&gt;&#xA; =
       &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJI=
bg-166&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://f=
onts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;temp&=
amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=
=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleap=
is.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=
=3D0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;         =
 &lt;mxGeometry x=3D&quot;57&quot; y=3D&quot;720&quot; width=3D&quot;50&quo=
t; height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;=
/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-210&quot=
; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=
=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=
=3D0;endArrow=3Dnone;endFill=3D0;fontFamily=3DLiberation Sans;fontSource=3D=
https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot=
; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-171&quot; targ=
et=3D&quot;eV5wDCu3Df9HtTySJIbg-209&quot; edge=3D&quot;1&quot;&gt;&#xA;    =
      &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&g=
t;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df=
9HtTySJIbg-171&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;h=
ttps://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;=
gt;sysroot-destdir&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whi=
teSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%=
2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillStyle=3Dau=
to;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot=
;&gt;&#xA;          &lt;mxGeometry x=3D&quot;600&quot; y=3D&quot;720&quot; =
width=3D&quot;120&quot; height=3D&quot;40&quot; as=3D&quot;geometry&quot; /=
&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3=
Df9HtTySJIbg-307&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounde=
d=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;=
entryDx=3D0;entryDy=3D0;endArrow=3DclassicThin;endFill=3D1;fontFamily=3DLib=
eration Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily=
%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3D=
f9HtTySJIbg-172&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-293&quot; edge=3D=
&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=
=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;m=
xCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-172&quot; value=3D&quot;&amp;lt;font =
data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchite=
cts+Daughter&amp;quot;&amp;gt;recipe-sysroot&amp;lt;/font&amp;gt;&quot; sty=
le=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation S=
ans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLibera=
tion%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&q=
uot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;910&=
quot; y=3D&quot;720&quot; width=3D&quot;110&quot; height=3D&quot;40&quot; a=
s=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;=
mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-182&quot; style=3D&quot;edgeStyle=3D=
orthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D=
1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3DclassicThin;en=
dFill=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.goo=
gleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot=
; source=3D&quot;eV5wDCu3Df9HtTySJIbg-175&quot; target=3D&quot;eV5wDCu3Df9H=
tTySJIbg-177&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry re=
lative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxC=
ell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-175&quot; va=
lue=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis=
.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;image&amp;lt;/font&a=
mp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamil=
y=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3=
Ffamily%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; pa=
rent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometr=
y x=3D&quot;330.49&quot; y=3D&quot;720&quot; width=3D&quot;63&quot; height=
=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&g=
t;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-183&quot; style=
=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1;jet=
tySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endA=
rrow=3DclassicThin;endFill=3D1;fontFamily=3DLiberation Sans;fontSource=3Dht=
tps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; =
parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-177&quot; target=
=3D&quot;eV5wDCu3Df9HtTySJIbg-180&quot; edge=3D&quot;1&quot;&gt;&#xA;      =
    &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;=
&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9H=
tTySJIbg-184&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthogonal=
Loop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=
=3D0;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3DclassicThin=
;endFill=3D1;curved=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%=
2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=
=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-177&quot; target=3D&qu=
ot;eV5wDCu3Df9HtTySJIbg-181&quot; edge=3D&quot;1&quot;&gt;&#xA;          &l=
t;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA; =
       &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJI=
bg-177&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://f=
onts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;usr&a=
mp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=
=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleap=
is.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=
=3D0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;         =
 &lt;mxGeometry x=3D&quot;340.25&quot; y=3D&quot;860&quot; width=3D&quot;43=
.5&quot; height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;      =
  &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-18=
8&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogona=
lLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=
=3D0;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3DclassicThin=
;endFill=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.=
googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&q=
uot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-180&quot; target=3D&quot;eV5wDCu3D=
f9HtTySJIbg-187&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry=
 relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/=
mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-180&quot;=
 value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googlea=
pis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;include&amp;lt;/f=
ont&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;font=
Family=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2F=
css%3Ffamily%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quo=
t; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGe=
ometry x=3D&quot;335.12&quot; y=3D&quot;940&quot; width=3D&quot;53.75&quot;=
 height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/m=
xCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-192&quot; =
style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D=
1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0=
;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.c=
om%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=
=3D&quot;eV5wDCu3Df9HtTySJIbg-181&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg=
-191&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=
=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt=
;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-181&quot; value=3D=
&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis.com/c=
ss?family=3DArchitects+Daughter&amp;quot;&amp;gt;lib&amp;lt;/font&amp;gt;&q=
uot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLibe=
ration Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%=
3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; parent=3D&=
quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&q=
uot;459.75&quot; y=3D&quot;940&quot; width=3D&quot;43.5&quot; height=3D&quo=
t;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;=
        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-187&quot; value=3D&quot;=
hellolib.h&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontF=
amily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fc=
ss%3Ffamily%3DLiberation%2BSans;fillColor=3D#f5f5f5;fontColor=3D#333333;str=
okeColor=3D#666666;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;=
&#xA;          &lt;mxGeometry x=3D&quot;322&quot; y=3D&quot;1010&quot; widt=
h=3D&quot;80&quot; height=3D&quot;25&quot; as=3D&quot;geometry&quot; /&gt;&=
#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9Ht=
TySJIbg-189&quot; value=3D&quot;libhello.so.1&quot; style=3D&quot;rounded=
=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dh=
ttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillCo=
lor=3D#f5f5f5;fontColor=3D#333333;strokeColor=3D#666666;&quot; parent=3D&qu=
ot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quo=
t;420&quot; y=3D&quot;1017.5&quot; width=3D&quot;120&quot; height=3D&quot;2=
0&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;   =
     &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-190&quot; value=3D&quot;lib=
hello.so.1.0&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fon=
tFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2=
Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#f5f5f5;fontColor=3D#333333;s=
trokeColor=3D#666666;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&g=
t;&#xA;          &lt;mxGeometry x=3D&quot;420&quot; y=3D&quot;1042.5&quot; =
width=3D&quot;120&quot; height=3D&quot;25&quot; as=3D&quot;geometry&quot; /=
&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3=
Df9HtTySJIbg-191&quot; value=3D&quot;&quot; style=3D&quot;rounded=3D1;white=
Space=3Dwrap;html=3D1;fillColor=3Dnone;dashed=3D1;arcSize=3D0;fontFamily=3D=
Liberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffam=
ily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot=
;&gt;&#xA;          &lt;mxGeometry x=3D&quot;413&quot; y=3D&quot;1010&quot;=
 width=3D&quot;137&quot; height=3D&quot;62.5&quot; as=3D&quot;geometry&quot=
; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wD=
Cu3Df9HtTySJIbg-286&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;ort=
hogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D1;entryDx=
=3D0;entryDy=3D0;strokeWidth=3D3;fillColor=3D#d0cee2;strokeColor=3D#000000;=
curved=3D1;exitX=3D0.75;exitY=3D1;exitDx=3D0;exitDy=3D0;fontFamily=3DLibera=
tion Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3D=
Liberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9H=
tTySJIbg-209&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-293&quot; edge=3D&qu=
ot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&=
quot;geometry&quot;&gt;&#xA;            &lt;mxPoint x=3D&quot;830&quot; y=
=3D&quot;1330&quot; as=3D&quot;sourcePoint&quot; /&gt;&#xA;            &lt;=
mxPoint x=3D&quot;925&quot; y=3D&quot;1130&quot; as=3D&quot;targetPoint&quo=
t; /&gt;&#xA;            &lt;Array as=3D&quot;points&quot;&gt;&#xA;        =
      &lt;mxPoint x=3D&quot;690&quot; y=3D&quot;1120&quot; /&gt;&#xA;      =
        &lt;mxPoint x=3D&quot;965&quot; y=3D&quot;1120&quot; /&gt;&#xA;    =
        &lt;/Array&gt;&#xA;          &lt;/mxGeometry&gt;&#xA;        &lt;/m=
xCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-209&quot; =
value=3D&quot;Everything in &amp;lt;b&amp;gt;image&amp;lt;/b&amp;gt; folder=
 that is present in &amp;lt;b&amp;gt;SYSROOT_DIRS&amp;lt;/b&amp;gt; will be=
 copied here.&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fi=
llColor=3D#eeeeee;dashed=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttp=
s%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;strokeCol=
or=3D#36393d;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA; =
         &lt;mxGeometry x=3D&quot;600&quot; y=3D&quot;840&quot; width=3D&qu=
ot;120&quot; height=3D&quot;240&quot; as=3D&quot;geometry&quot; /&gt;&#xA; =
       &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJI=
bg-233&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthogonalLoop=
=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.75;exitY=3D1;exitDx=3D0;exitDy=3D0=
;entryX=3D0.5;entryY=3D1;entryDx=3D0;entryDy=3D0;curved=3D1;strokeWidth=3D3=
;fillColor=3D#d0cee2;strokeColor=3D#000000;fontFamily=3DLiberation Sans;fon=
tSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2B=
Sans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-211&=
quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-209&quot; edge=3D&quot;1&quot;&gt=
;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry=
&quot;&gt;&#xA;            &lt;Array as=3D&quot;points&quot;&gt;&#xA;      =
        &lt;mxPoint x=3D&quot;503&quot; y=3D&quot;1120&quot; /&gt;&#xA;    =
          &lt;mxPoint x=3D&quot;660&quot; y=3D&quot;1120&quot; /&gt;&#xA;  =
          &lt;/Array&gt;&#xA;          &lt;/mxGeometry&gt;&#xA;        &lt;=
/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-212&quot=
; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthogonalLoop=3D1;jettySiz=
e=3Dauto;html=3D1;entryX=3D0.543;entryY=3D0.999;entryDx=3D0;entryDy=3D0;ent=
ryPerimeter=3D0;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0;curved=3D1;fill=
Color=3D#d0cee2;strokeColor=3D#000000;strokeWidth=3D3;fontFamily=3DLiberati=
on Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLi=
beration%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtT=
ySJIbg-162&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-211&quot; edge=3D&quot=
;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&qu=
ot;geometry&quot;&gt;&#xA;            &lt;Array as=3D&quot;points&quot;&gt;=
&#xA;              &lt;mxPoint x=3D&quot;190&quot; y=3D&quot;1120&quot; /&g=
t;&#xA;              &lt;mxPoint x=3D&quot;447&quot; y=3D&quot;1120&quot; /=
&gt;&#xA;            &lt;/Array&gt;&#xA;          &lt;/mxGeometry&gt;&#xA; =
       &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJI=
bg-213&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://f=
onts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;do_in=
stall&amp;lt;/font&amp;gt;&quot; style=3D&quot;text;html=3D1;align=3Dcenter=
;verticalAlign=3Dmiddle;resizable=3D0;points=3D[];autosize=3D1;strokeColor=
=3D#36393d;fillColor=3D#eeeeee;fontFamily=3DLiberation Sans;fontSource=3Dht=
tps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; =
parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeome=
try x=3D&quot;270&quot; y=3D&quot;1100&quot; width=3D&quot;90&quot; height=
=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&g=
t;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-214&quot; value=
=3D&quot;libhello.so.1.0&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;=
html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.goog=
leapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#eeeeee;strokeCol=
or=3D#36393d;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA; =
         &lt;mxGeometry x=3D&quot;138&quot; y=3D&quot;1017.5&quot; width=3D=
&quot;114&quot; height=3D&quot;27.5&quot; as=3D&quot;geometry&quot; /&gt;&#=
xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtT=
ySJIbg-217&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https=
://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;d=
o_configure&amp;lt;br&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;text=
;html=3D1;align=3Dcenter;verticalAlign=3Dmiddle;resizable=3D0;points=3D[];a=
utosize=3D1;strokeColor=3D#36393d;fillColor=3D#eeeeee;fontFamily=3DLiberati=
on Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLi=
beration%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#x=
A;          &lt;mxGeometry y=3D&quot;975&quot; width=3D&quot;110&quot; heig=
ht=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell=
&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-218&quot; value=
=3D&quot;hellolib.h&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=
=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleap=
is.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#f5f5f5;fontColor=3D#=
333333;strokeColor=3D#666666;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1=
&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;136&quot; y=3D&quot;980&q=
uot; width=3D&quot;114&quot; height=3D&quot;20&quot; as=3D&quot;geometry&qu=
ot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5=
wDCu3Df9HtTySJIbg-221&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp=
;quot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quo=
t;&amp;gt;do_patch&amp;lt;br&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&qu=
ot;text;html=3D1;align=3Dcenter;verticalAlign=3Dmiddle;resizable=3D0;points=
=3D[];autosize=3D1;strokeColor=3D#36393d;fillColor=3D#eeeeee;fontFamily=3DL=
iberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffami=
ly%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;=
&gt;&#xA;          &lt;mxGeometry x=3D&quot;30&quot; y=3D&quot;930&quot; wi=
dth=3D&quot;80&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt=
;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9=
HtTySJIbg-224&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;ht=
tps://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;g=
t;do_unpack&amp;lt;br&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;text=
;html=3D1;align=3Dcenter;verticalAlign=3Dmiddle;resizable=3D0;points=3D[];a=
utosize=3D1;strokeColor=3D#36393d;fillColor=3D#eeeeee;fontFamily=3DLiberati=
on Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLi=
beration%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#x=
A;          &lt;mxGeometry x=3D&quot;206.5&quot; y=3D&quot;585&quot; width=
=3D&quot;90&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#=
xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtT=
ySJIbg-225&quot; value=3D&quot;&amp;lt;font size=3D&amp;quot;1&amp;quot; co=
lor=3D&amp;quot;#ffffff&amp;quot; data-font-src=3D&amp;quot;https://fonts.g=
oogleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;&amp;lt;b s=
tyle=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;6&amp;lt;/b&amp;gt;&amp;=
lt;/font&amp;gt;&quot; style=3D&quot;ellipse;whiteSpace=3Dwrap;html=3D1;asp=
ect=3Dfixed;rounded=3D1;fillColor=3D#000000;strokeColor=3D#56517e;fontFamil=
y=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3=
Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&=
quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;176.5&quot; y=3D&quot;585&=
quot; width=3D&quot;30&quot; height=3D&quot;30&quot; as=3D&quot;geometry&qu=
ot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5=
wDCu3Df9HtTySJIbg-226&quot; value=3D&quot;&amp;lt;font size=3D&amp;quot;1&a=
mp;quot; color=3D&amp;quot;#ffffff&amp;quot; data-font-src=3D&amp;quot;http=
s://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;=
&amp;lt;b style=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;7&amp;lt;/b&a=
mp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;ellipse;whiteSpace=3Dwrap;h=
tml=3D1;aspect=3Dfixed;rounded=3D1;fillColor=3D#000000;strokeColor=3D#56517=
e;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.=
com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=
=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry y=3D&quot;930&quot; width=
=3D&quot;30&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#=
xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtT=
ySJIbg-227&quot; value=3D&quot;&amp;lt;font size=3D&amp;quot;1&amp;quot; co=
lor=3D&amp;quot;#ffffff&amp;quot; data-font-src=3D&amp;quot;https://fonts.g=
oogleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;&amp;lt;b s=
tyle=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;8&amp;lt;/b&amp;gt;&amp;=
lt;/font&amp;gt;&quot; style=3D&quot;ellipse;whiteSpace=3Dwrap;html=3D1;asp=
ect=3Dfixed;rounded=3D1;fillColor=3D#000000;strokeColor=3D#56517e;fontFamil=
y=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3=
Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&=
quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;-30&quot; y=3D&quot;975&qu=
ot; width=3D&quot;30&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot=
; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wD=
Cu3Df9HtTySJIbg-229&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;q=
uot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;=
&amp;gt;do_compile&amp;lt;br&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&qu=
ot;text;html=3D1;align=3Dcenter;verticalAlign=3Dmiddle;resizable=3D0;points=
=3D[];autosize=3D1;strokeColor=3D#36393d;fillColor=3D#eeeeee;fontFamily=3DL=
iberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffami=
ly%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;=
&gt;&#xA;          &lt;mxGeometry x=3D&quot;20&quot; y=3D&quot;1007.5&quot;=
 width=3D&quot;90&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /=
&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3=
Df9HtTySJIbg-228&quot; value=3D&quot;&amp;lt;font size=3D&amp;quot;1&amp;qu=
ot; color=3D&amp;quot;#ffffff&amp;quot; data-font-src=3D&amp;quot;https://f=
onts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;&amp;=
lt;b style=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;9&amp;lt;/b&amp;gt=
;&amp;lt;/font&amp;gt;&quot; style=3D&quot;ellipse;whiteSpace=3Dwrap;html=
=3D1;aspect=3Dfixed;rounded=3D1;fillColor=3D#000000;strokeColor=3D#56517e;f=
ontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com=
%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D=
&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;-10&quot; y=3D&quo=
t;1007.5&quot; width=3D&quot;30&quot; height=3D&quot;30&quot; as=3D&quot;ge=
ometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D=
&quot;eV5wDCu3Df9HtTySJIbg-231&quot; value=3D&quot;&amp;lt;font size=3D&amp=
;quot;1&amp;quot; color=3D&amp;quot;#ffffff&amp;quot; data-font-src=3D&amp;=
quot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot=
;&amp;gt;&amp;lt;b style=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;10&a=
mp;lt;/b&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;ellipse;whiteSpac=
e=3Dwrap;html=3D1;aspect=3Dfixed;rounded=3D1;fillColor=3D#000000;strokeColo=
r=3D#56517e;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.g=
oogleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&qu=
ot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;240&q=
uot; y=3D&quot;1100&quot; width=3D&quot;30&quot; height=3D&quot;30&quot; as=
=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;m=
xCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-235&quot; value=3D&quot;&amp;lt;font =
data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchite=
cts+Daughter&amp;quot;&amp;gt;do_populate_sysroot&amp;lt;/font&amp;gt;&quot=
; style=3D&quot;text;html=3D1;align=3Dcenter;verticalAlign=3Dmiddle;resizab=
le=3D0;points=3D[];autosize=3D1;strokeColor=3D#36393d;fillColor=3D#eeeeee;f=
ontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com=
%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D=
&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;515&quot; y=3D&quo=
t;1100&quot; width=3D&quot;160&quot; height=3D&quot;30&quot; as=3D&quot;geo=
metry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&=
quot;eV5wDCu3Df9HtTySJIbg-236&quot; value=3D&quot;&amp;lt;font size=3D&amp;=
quot;1&amp;quot; color=3D&amp;quot;#ffffff&amp;quot; data-font-src=3D&amp;q=
uot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;=
&amp;gt;&amp;lt;b style=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;11&am=
p;lt;/b&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;ellipse;whiteSpace=
=3Dwrap;html=3D1;aspect=3Dfixed;rounded=3D1;fillColor=3D#000000;strokeColor=
=3D#56517e;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.go=
ogleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quo=
t; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;485&qu=
ot; y=3D&quot;1100&quot; width=3D&quot;30&quot; height=3D&quot;30&quot; as=
=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;m=
xCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-355&quot; style=3D&quot;edgeStyle=3Do=
rthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.=
5;entryY=3D1;entryDx=3D0;entryDy=3D0;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitD=
y=3D0;curved=3D1;strokeWidth=3D3;fillColor=3D#d0cee2;strokeColor=3D#000000;=
fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.co=
m%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=
=3D&quot;eV5wDCu3Df9HtTySJIbg-238&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg=
-247&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=
=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            &lt;Array as=
=3D&quot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&quot;1340&quot=
; y=3D&quot;1120&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot;1512&q=
uot; y=3D&quot;1120&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA;        =
  &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=
=3D&quot;eV5wDCu3Df9HtTySJIbg-238&quot; value=3D&quot;&quot; style=3D&quot;=
rounded=3D1;whiteSpace=3Dwrap;html=3D1;fillColor=3Dnone;dashed=3D1;fontFami=
ly=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%=
3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1=
&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1270&quot; y=3D&quot;840&=
quot; width=3D&quot;140&quot; height=3D&quot;160&quot; as=3D&quot;geometry&=
quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;e=
V5wDCu3Df9HtTySJIbg-239&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle=
;curved=3D1;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=
=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0;entryX=3D0.5;entryY=3D0;entryDx=3D0;=
entryDy=3D0;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.g=
oogleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&qu=
ot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-240&quot; target=3D&quot;eV5wDCu3Df=
9HtTySJIbg-238&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry =
relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/m=
xCell&gt;&#xA;        &lt;mxCell id=3D&quot;w4JjUiD6-ryT0rcgaIPJ-1&quot; st=
yle=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D0;orthogonalLoop=3D1;=
jettySize=3Dauto;html=3D1;exitX=3D0;exitY=3D0.5;exitDx=3D0;exitDy=3D0;&quot=
; edge=3D&quot;1&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtT=
ySJIbg-240&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; =
as=3D&quot;geometry&quot;&gt;&#xA;            &lt;mxPoint x=3D&quot;1300&qu=
ot; y=3D&quot;740&quot; as=3D&quot;targetPoint&quot; /&gt;&#xA;          &l=
t;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&=
quot;eV5wDCu3Df9HtTySJIbg-240&quot; value=3D&quot;&amp;lt;div&amp;gt;source=
s/sayhello-0.1&amp;lt;/div&amp;gt;&amp;lt;div&amp;gt;&amp;lt;br&amp;gt;&amp=
;lt;/div&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1=
;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.c=
om%2Fcss%3Ffamily%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0=
;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt=
;mxGeometry x=3D&quot;1307&quot; y=3D&quot;720&quot; width=3D&quot;65&quot;=
 height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/m=
xCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-241&quot; =
value=3D&quot;Makefile&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;ht=
ml=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.google=
apis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#f5f5f5;fontColor=
=3D#333333;strokeColor=3D#666666;&quot; parent=3D&quot;1&quot; vertex=3D&qu=
ot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1283&quot; y=3D&quot;=
860&quot; width=3D&quot;114&quot; height=3D&quot;20&quot; as=3D&quot;geomet=
ry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quo=
t;eV5wDCu3Df9HtTySJIbg-242&quot; value=3D&quot;LICENSE&quot; style=3D&quot;=
rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSou=
rce=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans=
;fillColor=3D#f5f5f5;fontColor=3D#333333;strokeColor=3D#666666;&quot; paren=
t=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=
=3D&quot;1283&quot; y=3D&quot;890&quot; width=3D&quot;114&quot; height=3D&q=
uot;20&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#x=
A;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-330&quot; style=3D&quo=
t;edgeStyle=3DorthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Dauto;html=
=3D1;entryX=3D0;entryY=3D0.5;entryDx=3D0;entryDy=3D0;exitX=3D0;exitY=3D0.5;=
exitDx=3D0;exitDy=3D0;curved=3D1;fillColor=3D#d0cee2;strokeColor=3D#000000;=
strokeWidth=3D3;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffon=
ts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;=
1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-244&quot; target=3D&quot;eV5wDC=
u3Df9HtTySJIbg-245&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeome=
try relative=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            =
&lt;Array as=3D&quot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&qu=
ot;1230&quot; y=3D&quot;930&quot; /&gt;&#xA;              &lt;mxPoint x=3D&=
quot;1230&quot; y=3D&quot;974&quot; /&gt;&#xA;            &lt;/Array&gt;&#x=
A;          &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt=
;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-244&quot; value=3D&quot;sayhello.c&=
quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLib=
eration Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily=
%3DLiberation%2BSans;fillColor=3D#f5f5f5;fontColor=3D#333333;strokeColor=3D=
#666666;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;      =
    &lt;mxGeometry x=3D&quot;1283&quot; y=3D&quot;920&quot; width=3D&quot;1=
14&quot; height=3D&quot;20&quot; as=3D&quot;geometry&quot; /&gt;&#xA;      =
  &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-24=
5&quot; value=3D&quot;sayhello&quot; style=3D&quot;rounded=3D1;whiteSpace=
=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffo=
nts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#eeeeee;s=
trokeColor=3D#36393d;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&g=
t;&#xA;          &lt;mxGeometry x=3D&quot;1283&quot; y=3D&quot;960&quot; wi=
dth=3D&quot;114&quot; height=3D&quot;27.5&quot; as=3D&quot;geometry&quot; /=
&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3=
Df9HtTySJIbg-363&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthog=
onalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.75;exitY=3D1;exitDx=3D0;ex=
itDy=3D0;entryX=3D0.5;entryY=3D1;entryDx=3D0;entryDy=3D0;curved=3D1;strokeW=
idth=3D3;fillColor=3D#d0cee2;strokeColor=3D#000000;fontFamily=3DLiberation =
Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiber=
ation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJ=
Ibg-247&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-361&quot; edge=3D&quot;1&=
quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;=
geometry&quot;&gt;&#xA;            &lt;Array as=3D&quot;points&quot;&gt;&#x=
A;              &lt;mxPoint x=3D&quot;1540&quot; y=3D&quot;1120&quot; /&gt;=
&#xA;              &lt;mxPoint x=3D&quot;1671&quot; y=3D&quot;1120&quot; /&=
gt;&#xA;            &lt;/Array&gt;&#xA;          &lt;/mxGeometry&gt;&#xA;  =
      &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIb=
g-247&quot; value=3D&quot;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwra=
p;html=3D1;fillColor=3Dnone;dashed=3D1;fontFamily=3DLiberation Sans;fontSou=
rce=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans=
;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt=
;mxGeometry x=3D&quot;1451.99&quot; y=3D&quot;840&quot; width=3D&quot;120&q=
uot; height=3D&quot;240&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &=
lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-248&q=
uot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLo=
op=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryD=
y=3D0;endArrow=3DclassicThin;endFill=3D1;fontFamily=3DLiberation Sans;fontS=
ource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSa=
ns;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-249&qu=
ot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-247&quot; edge=3D&quot;1&quot;&gt;&=
#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&q=
uot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV=
5wDCu3Df9HtTySJIbg-249&quot; value=3D&quot;&amp;lt;font data-font-src=3D&am=
p;quot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;qu=
ot;&amp;gt;image&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;white=
Space=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F=
%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillStyle=3Dauto=
;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&=
gt;&#xA;          &lt;mxGeometry x=3D&quot;1480.49&quot; y=3D&quot;720&quot=
; width=3D&quot;63&quot; height=3D&quot;40&quot; as=3D&quot;geometry&quot; =
/&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu=
3Df9HtTySJIbg-250&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;round=
ed=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0=
;entryDx=3D0;entryDy=3D0;endArrow=3DclassicThin;endFill=3D1;fontFamily=3DLi=
beration Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamil=
y%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3=
Df9HtTySJIbg-252&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-254&quot; edge=
=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; =
as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt=
;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-252&quot; value=3D&quot;&amp;lt;fon=
t data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchi=
tects+Daughter&amp;quot;&amp;gt;usr&amp;lt;/font&amp;gt;&quot; style=3D&quo=
t;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontS=
ource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSa=
ns;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&quot; vert=
ex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1490.25&quot;=
 y=3D&quot;860&quot; width=3D&quot;43.5&quot; height=3D&quot;40&quot; as=3D=
&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCe=
ll id=3D&quot;eV5wDCu3Df9HtTySJIbg-253&quot; style=3D&quot;edgeStyle=3Dorth=
ogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;ex=
itX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0;entryX=3D0.5;entryY=3D0;entryDx=
=3D0;entryDy=3D0;endArrow=3DclassicThin;endFill=3D1;fontFamily=3DLiberation=
 Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLibe=
ration%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTyS=
JIbg-254&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-292&quot; edge=3D&quot;1=
&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot=
;geometry&quot;&gt;&#xA;            &lt;mxPoint x=3D&quot;1512&quot; y=3D&q=
uot;1010&quot; as=3D&quot;targetPoint&quot; /&gt;&#xA;          &lt;/mxGeom=
etry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5w=
DCu3Df9HtTySJIbg-254&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;=
quot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot=
;&amp;gt;bin&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpac=
e=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ff=
onts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillStyle=3Dauto;gla=
ss=3D0;shadow=3D0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&=
#xA;          &lt;mxGeometry x=3D&quot;1485.1299999999999&quot; y=3D&quot;9=
50&quot; width=3D&quot;53.75&quot; height=3D&quot;40&quot; as=3D&quot;geome=
try&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&qu=
ot;eV5wDCu3Df9HtTySJIbg-266&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeS=
tyle;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;dashed=3D1;fillColor=3D#b=
ac8d3;strokeColor=3D#000000;strokeWidth=3D2;dashPattern=3D1 2;curved=3D1;en=
dArrow=3DclassicThin;endFill=3D1;fontFamily=3DLiberation Sans;fontSource=3D=
https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot=
; parent=3D&quot;1&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeome=
try relative=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            =
&lt;mxPoint x=3D&quot;-0.5&quot; y=3D&quot;610&quot; as=3D&quot;sourcePoint=
&quot; /&gt;&#xA;            &lt;mxPoint x=3D&quot;150&quot; y=3D&quot;765&=
quot; as=3D&quot;targetPoint&quot; /&gt;&#xA;            &lt;Array as=3D&qu=
ot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&quot;89.5&quot; y=3D=
&quot;610.5&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot;89.5&quot; =
y=3D&quot;765.5&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA;          &l=
t;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&=
quot;eV5wDCu3Df9HtTySJIbg-267&quot; value=3D&quot;&amp;lt;div&amp;gt;&amp;l=
t;font style=3D&amp;quot;font-size: 14px;&amp;quot; data-font-src=3D&amp;qu=
ot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&=
amp;gt;S =3D &amp;quot;${UNPACKDIR}/${BP}&amp;quot;&amp;lt;/font&amp;gt;&am=
p;lt;/div&amp;gt;&quot; style=3D&quot;edgeLabel;html=3D1;align=3Dcenter;ver=
ticalAlign=3Dmiddle;resizable=3D0;points=3D[];labelBorderColor=3Ddefault;sp=
acingTop=3D2;spacingLeft=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttp=
s%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; pa=
rent=3D&quot;eV5wDCu3Df9HtTySJIbg-266&quot; vertex=3D&quot;1&quot; connecta=
ble=3D&quot;0&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;-0.2703&quot=
; y=3D&quot;1&quot; relative=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&=
#xA;            &lt;mxPoint x=3D&quot;-71&quot; y=3D&quot;-32&quot; as=3D&q=
uot;offset&quot; /&gt;&#xA;          &lt;/mxGeometry&gt;&#xA;        &lt;/m=
xCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-270&quot; =
value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleap=
is.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;WORKDIR&amp;lt;/fo=
nt&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontF=
amily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fc=
ss%3Ffamily%3DLiberation%2BSans;fillColor=3D#000000;strokeColor=3Dnone;fill=
Style=3Dauto;glass=3D0;shadow=3D0;fontColor=3D#ffffff;fontStyle=3D1&quot; p=
arent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeomet=
ry x=3D&quot;383.75&quot; y=3D&quot;585&quot; width=3D&quot;63&quot; height=
=3D&quot;25&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&g=
t;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-271&quot; value=
=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis.co=
m/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;D&amp;lt;/font&amp;gt;&=
quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLib=
eration Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily=
%3DLiberation%2BSans;fillColor=3D#000000;strokeColor=3Dnone;fillStyle=3Daut=
o;glass=3D0;shadow=3D0;fontColor=3D#ffffff;fontStyle=3D1&quot; parent=3D&qu=
ot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quo=
t;313.75&quot; y=3D&quot;720&quot; width=3D&quot;26.5&quot; height=3D&quot;=
25&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;  =
      &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-272&quot; value=3D&quot;&a=
mp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?famil=
y=3DArchitects+Daughter&amp;quot;&amp;gt;S&amp;lt;/font&amp;gt;&quot; style=
=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation San=
s;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberati=
on%2BSans;fillColor=3D#000000;strokeColor=3Dnone;fillStyle=3Dauto;glass=3D0=
;shadow=3D0;fontColor=3D#ffffff;fontStyle=3D1&quot; parent=3D&quot;1&quot; =
vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;150&quot;=
 y=3D&quot;720&quot; width=3D&quot;26.5&quot; height=3D&quot;25&quot; as=3D=
&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCe=
ll id=3D&quot;eV5wDCu3Df9HtTySJIbg-273&quot; value=3D&quot;&amp;lt;font dat=
a-font-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchitects=
+Daughter&amp;quot;&amp;gt;B&amp;lt;/font&amp;gt;&quot; style=3D&quot;round=
ed=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=
=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fi=
llColor=3D#000000;strokeColor=3Dnone;fillStyle=3Dauto;glass=3D0;shadow=3D0;=
fontColor=3D#ffffff;fontStyle=3D1&quot; parent=3D&quot;1&quot; vertex=3D&qu=
ot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;123.5&quot; y=3D&quot=
;720&quot; width=3D&quot;26.5&quot; height=3D&quot;25&quot; as=3D&quot;geom=
etry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&q=
uot;eV5wDCu3Df9HtTySJIbg-275&quot; value=3D&quot;&amp;lt;font data-font-src=
=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&=
amp;quot;&amp;gt;T&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whi=
teSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%=
2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#0=
00000;strokeColor=3Dnone;fillStyle=3Dauto;glass=3D0;shadow=3D0;fontColor=3D=
#ffffff;fontStyle=3D1&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&g=
t;&#xA;          &lt;mxGeometry x=3D&quot;41.75&quot; y=3D&quot;720&quot; w=
idth=3D&quot;26.5&quot; height=3D&quot;25&quot; as=3D&quot;geometry&quot; /=
&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3=
Df9HtTySJIbg-276&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot=
;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&am=
p;gt;libdir&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=
=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffo=
nts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#000000;s=
trokeColor=3Dnone;fillStyle=3Dauto;glass=3D0;shadow=3D0;fontColor=3D#ffffff=
;fontStyle=3D1&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;=
          &lt;mxGeometry x=3D&quot;490&quot; y=3D&quot;970&quot; width=3D&q=
uot;50&quot; height=3D&quot;25&quot; as=3D&quot;geometry&quot; /&gt;&#xA;  =
      &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIb=
g-277&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fo=
nts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;includ=
edir&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap=
;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.goo=
gleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#000000;strokeCo=
lor=3Dnone;fillStyle=3Dauto;glass=3D0;shadow=3D0;fontColor=3D#ffffff;fontSt=
yle=3D1&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;       =
   &lt;mxGeometry x=3D&quot;366.75&quot; y=3D&quot;970&quot; width=3D&quot;=
80&quot; height=3D&quot;25&quot; as=3D&quot;geometry&quot; /&gt;&#xA;      =
  &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-27=
9&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.=
googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;RECIPE_SYS=
ROOT&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap=
;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.goo=
gleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#000000;strokeCo=
lor=3Dnone;fillStyle=3Dauto;glass=3D0;shadow=3D0;fontColor=3D#ffffff;fontSt=
yle=3D1&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;       =
   &lt;mxGeometry x=3D&quot;983.87&quot; y=3D&quot;750&quot; width=3D&quot;=
116.13&quot; height=3D&quot;25&quot; as=3D&quot;geometry&quot; /&gt;&#xA;  =
      &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIb=
g-351&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthogonalLoop=3D=
1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D1;entryDx=3D0;entryDy=3D0=
;dashed=3D1;endArrow=3DclassicThin;endFill=3D1;curved=3D1;fontFamily=3DLibe=
ration Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%=
3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df=
9HtTySJIbg-281&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-350&quot; edge=3D&=
quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=
=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;m=
xCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-281&quot; value=3D&quot;&amp;lt;font =
data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchite=
cts+Daughter&amp;quot;&amp;gt;S&amp;lt;/font&amp;gt;&quot; style=3D&quot;ro=
unded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSourc=
e=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;f=
illColor=3D#000000;strokeColor=3Dnone;fillStyle=3Dauto;glass=3D0;shadow=3D0=
;fontColor=3D#ffffff;fontStyle=3D1&quot; parent=3D&quot;1&quot; vertex=3D&q=
uot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1376.5&quot; y=3D&qu=
ot;745&quot; width=3D&quot;26.5&quot; height=3D&quot;25&quot; as=3D&quot;ge=
ometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D=
&quot;eV5wDCu3Df9HtTySJIbg-282&quot; value=3D&quot;&amp;lt;font data-font-s=
rc=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchitects+Daughte=
r&amp;quot;&amp;gt;B&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;w=
hiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3=
A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D=
#000000;strokeColor=3Dnone;fillStyle=3Dauto;glass=3D0;shadow=3D0;fontColor=
=3D#ffffff;fontStyle=3D1&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot=
;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1350&quot; y=3D&quot;745&quot;=
 width=3D&quot;26.5&quot; height=3D&quot;25&quot; as=3D&quot;geometry&quot;=
 /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDC=
u3Df9HtTySJIbg-283&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;qu=
ot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&=
amp;gt;D&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3D=
wrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts=
.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#000000;stro=
keColor=3Dnone;fillStyle=3Dauto;glass=3D0;shadow=3D0;fontColor=3D#ffffff;fo=
ntStyle=3D1&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;   =
       &lt;mxGeometry x=3D&quot;1533.75&quot; y=3D&quot;745&quot; width=3D&=
quot;26.5&quot; height=3D&quot;25&quot; as=3D&quot;geometry&quot; /&gt;&#xA=
;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTyS=
JIbg-284&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https:/=
/fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;WOR=
KDIR&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap=
;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.goo=
gleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#000000;strokeCo=
lor=3Dnone;fillStyle=3Dauto;glass=3D0;shadow=3D0;fontColor=3D#ffffff;fontSt=
yle=3D1&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;       =
   &lt;mxGeometry x=3D&quot;1030&quot; y=3D&quot;575&quot; width=3D&quot;63=
&quot; height=3D&quot;25&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        =
&lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-287&=
quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.go=
ogleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;do_prepare_r=
ecipe_sysroot&amp;lt;/font&amp;gt;&quot; style=3D&quot;text;html=3D1;align=
=3Dcenter;verticalAlign=3Dmiddle;resizable=3D0;points=3D[];autosize=3D1;str=
okeColor=3D#36393d;fillColor=3D#eeeeee;fontFamily=3DLiberation Sans;fontSou=
rce=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans=
;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt=
;mxGeometry x=3D&quot;743&quot; y=3D&quot;1100&quot; width=3D&quot;200&quot=
; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/=
mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-292&quot;=
 value=3D&quot;sayhello&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;h=
tml=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googl=
eapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#eeeeee;strokeColo=
r=3D#36393d;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;  =
        &lt;mxGeometry x=3D&quot;1467&quot; y=3D&quot;1035&quot; width=3D&q=
uot;90&quot; height=3D&quot;27.5&quot; as=3D&quot;geometry&quot; /&gt;&#xA;=
        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJ=
Ibg-293&quot; value=3D&quot;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dw=
rap;html=3D1;fillColor=3Dnone;dashed=3D1;fontFamily=3DLiberation Sans;fontS=
ource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSa=
ns;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &=
lt;mxGeometry x=3D&quot;830&quot; y=3D&quot;840&quot; width=3D&quot;270&quo=
t; height=3D&quot;240&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt=
;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-294&quo=
t; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthogonalLoop=3D1;jettySi=
ze=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=
=3DclassicThin;endFill=3D1;curved=3D1;fontFamily=3DLiberation Sans;fontSour=
ce=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;=
&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-296&quot;=
 target=3D&quot;eV5wDCu3Df9HtTySJIbg-298&quot; edge=3D&quot;1&quot;&gt;&#xA=
;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot=
; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wD=
Cu3Df9HtTySJIbg-295&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;ort=
hogonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;=
exitDy=3D0;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3Dclass=
icThin;endFill=3D1;curved=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhtt=
ps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; p=
arent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-296&quot; target=
=3D&quot;eV5wDCu3Df9HtTySJIbg-300&quot; edge=3D&quot;1&quot;&gt;&#xA;      =
    &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;=
&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9H=
tTySJIbg-296&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;htt=
ps://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt=
;usr&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap=
;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.goo=
gleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;s=
hadow=3D0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;    =
      &lt;mxGeometry x=3D&quot;870.25&quot; y=3D&quot;860&quot; width=3D&qu=
ot;43.5&quot; height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA; =
       &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJI=
bg-297&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orth=
ogonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;e=
xitDy=3D0;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3Dclassi=
cThin;endFill=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ff=
onts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quo=
t;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-298&quot; target=3D&quot;eV5w=
DCu3Df9HtTySJIbg-301&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeo=
metry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        =
&lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-298&=
quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.go=
ogleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;include&amp;=
lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1=
;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.c=
om%2Fcss%3Ffamily%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0=
;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt=
;mxGeometry x=3D&quot;865.12&quot; y=3D&quot;940&quot; width=3D&quot;53.75&=
quot; height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &=
lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-299&q=
uot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLo=
op=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryD=
y=3D0;endArrow=3DclassicThin;endFill=3D1;fontFamily=3DLiberation Sans;fontS=
ource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSa=
ns;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-300&qu=
ot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-304&quot; edge=3D&quot;1&quot;&gt;&=
#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&q=
uot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV=
5wDCu3Df9HtTySJIbg-300&quot; value=3D&quot;&amp;lt;font data-font-src=3D&am=
p;quot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;qu=
ot;&amp;gt;lib&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSp=
ace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2=
Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillStyle=3Dauto;g=
lass=3D0;shadow=3D0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt=
;&#xA;          &lt;mxGeometry x=3D&quot;989.75&quot; y=3D&quot;940&quot; w=
idth=3D&quot;43.5&quot; height=3D&quot;40&quot; as=3D&quot;geometry&quot; /=
&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3=
Df9HtTySJIbg-301&quot; value=3D&quot;hellolib.h&quot; style=3D&quot;rounded=
=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dh=
ttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillCo=
lor=3D#f5f5f5;fontColor=3D#333333;strokeColor=3D#666666;&quot; parent=3D&qu=
ot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quo=
t;852&quot; y=3D&quot;1010&quot; width=3D&quot;80&quot; height=3D&quot;25&q=
uot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;      =
  &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-302&quot; value=3D&quot;libhel=
lo.so.1&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFami=
ly=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%=
3Ffamily%3DLiberation%2BSans;fillColor=3D#f5f5f5;fontColor=3D#333333;stroke=
Color=3D#666666;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#x=
A;          &lt;mxGeometry x=3D&quot;950&quot; y=3D&quot;1017.5&quot; width=
=3D&quot;120&quot; height=3D&quot;20&quot; as=3D&quot;geometry&quot; /&gt;&=
#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9Ht=
TySJIbg-303&quot; value=3D&quot;libhello.so.1.0&quot; style=3D&quot;rounded=
=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dh=
ttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillCo=
lor=3D#f5f5f5;fontColor=3D#333333;strokeColor=3D#666666;&quot; parent=3D&qu=
ot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quo=
t;950&quot; y=3D&quot;1042.5&quot; width=3D&quot;120&quot; height=3D&quot;2=
5&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;   =
     &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-304&quot; value=3D&quot;&qu=
ot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fillColor=3Dnone;d=
ashed=3D1;arcSize=3D0;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F=
%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D=
&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&=
quot;943&quot; y=3D&quot;1010&quot; width=3D&quot;137&quot; height=3D&quot;=
62.5&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;=
        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-308&quot; value=3D&quot;=
&amp;lt;font style=3D&amp;quot;font-size: 15px;&amp;quot; data-font-src=3D&=
amp;quot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;=
quot;&amp;gt;This also contains other files from other&amp;amp;nbsp;&amp;lt=
;br&amp;gt;dependencies. Default dependencies are:&amp;lt;br&amp;gt;basical=
ly &amp;lt;b style=3D&amp;quot;&amp;quot;&amp;gt;&amp;lt;u&amp;gt;gcc&amp;l=
t;/u&amp;gt;&amp;lt;/b&amp;gt;, &amp;lt;b style=3D&amp;quot;&amp;quot;&amp;=
gt;&amp;lt;u&amp;gt;compilerlibs&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt; and &a=
mp;lt;b style=3D&amp;quot;&amp;quot;&amp;gt;&amp;lt;u style=3D&amp;quot;&am=
p;quot;&amp;gt;libc&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt;&amp;lt;/font&amp;gt=
;&quot; style=3D&quot;text;html=3D1;align=3Dcenter;verticalAlign=3Dmiddle;r=
esizable=3D0;points=3D[];autosize=3D1;strokeColor=3D#36393d;fillColor=3Dnon=
e;rounded=3D1;arcSize=3D0;dashed=3D1;fontFamily=3DLiberation Sans;fontSourc=
e=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&=
quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;m=
xGeometry x=3D&quot;553&quot; y=3D&quot;600&quot; width=3D&quot;390&quot; h=
eight=3D&quot;70&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxC=
ell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-310&quot; va=
lue=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis=
.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;SYSROOT_DESTDIR&amp;=
lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1=
;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.c=
om%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#000000;strokeColor=3Dnon=
e;fillStyle=3Dauto;glass=3D0;shadow=3D0;fontColor=3D#ffffff;fontStyle=3D1&q=
uot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mx=
Geometry x=3D&quot;675&quot; y=3D&quot;750&quot; width=3D&quot;127.5&quot; =
height=3D&quot;25&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mx=
Cell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-322&quot; s=
tyle=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1=
;jettySize=3Dauto;html=3D1;exitX=3D1;exitY=3D0.25;exitDx=3D0;exitDy=3D0;ent=
ryX=3D0;entryY=3D0.5;entryDx=3D0;entryDy=3D0;strokeWidth=3D3;fillColor=3D#d=
0cee2;strokeColor=3D#000000;fontFamily=3DLiberation Sans;fontSource=3Dhttps=
%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; par=
ent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-314&quot; target=3D=
&quot;eV5wDCu3Df9HtTySJIbg-135&quot; edge=3D&quot;1&quot;&gt;&#xA;         =
 &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#x=
A;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTy=
SJIbg-323&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;o=
rthogonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D1;exitY=3D0.75;exitDx=
=3D0;exitDy=3D0;entryX=3D0;entryY=3D0.5;entryDx=3D0;entryDy=3D0;strokeWidth=
=3D3;fillColor=3D#d0cee2;strokeColor=3D#000000;fontFamily=3DLiberation Sans=
;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberatio=
n%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-=
314&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-136&quot; edge=3D&quot;1&quot=
;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geom=
etry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&q=
uot;eV5wDCu3Df9HtTySJIbg-314&quot; value=3D&quot;&amp;lt;font color=3D&amp;=
quot;#fcfcfc&amp;quot;&amp;gt;Github&amp;lt;/font&amp;gt;&quot; style=3D&qu=
ot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;font=
Source=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BS=
ans;fillColor=3D#000000;strokeColor=3D#23445d;&quot; parent=3D&quot;1&quot;=
 vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;-416.5&q=
uot; y=3D&quot;395&quot; width=3D&quot;82&quot; height=3D&quot;100&quot; as=
=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;m=
xCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-316&quot; value=3D&quot;&amp;lt;font =
data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchite=
cts+Daughter&amp;quot;&amp;gt;do_fetch&amp;lt;br&amp;gt;&amp;lt;/font&amp;g=
t;&quot; style=3D&quot;text;html=3D1;align=3Dcenter;verticalAlign=3Dmiddle;=
resizable=3D0;points=3D[];autosize=3D1;strokeColor=3D#36393d;fillColor=3D#e=
eeeee;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googlea=
pis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; ve=
rtex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;-283.25&quo=
t; y=3D&quot;405&quot; width=3D&quot;80&quot; height=3D&quot;30&quot; as=3D=
&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCe=
ll id=3D&quot;eV5wDCu3Df9HtTySJIbg-317&quot; value=3D&quot;&amp;lt;font siz=
e=3D&amp;quot;1&amp;quot; color=3D&amp;quot;#ffffff&amp;quot; data-font-src=
=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&=
amp;quot;&amp;gt;&amp;lt;b style=3D&amp;quot;font-size: 15px;&amp;quot;&amp=
;gt;1&amp;lt;/b&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;ellipse;wh=
iteSpace=3Dwrap;html=3D1;aspect=3Dfixed;rounded=3D1;fillColor=3D#000000;str=
okeColor=3D#56517e;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2F=
fonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&qu=
ot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quo=
t;-313.25&quot; y=3D&quot;405&quot; width=3D&quot;30&quot; height=3D&quot;3=
0&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;   =
     &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-326&quot; value=3D&quot;&am=
p;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?family=
=3DArchitects+Daughter&amp;quot;&amp;gt;do_fetch&amp;lt;br&amp;gt;&amp;lt;/=
font&amp;gt;&quot; style=3D&quot;text;html=3D1;align=3Dcenter;verticalAlign=
=3Dmiddle;resizable=3D0;points=3D[];autosize=3D1;strokeColor=3D#36393d;fill=
Color=3D#eeeeee;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffon=
ts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;=
1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;-=
283.25&quot; y=3D&quot;455&quot; width=3D&quot;80&quot; height=3D&quot;30&q=
uot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;      =
  &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-327&quot; value=3D&quot;&amp;l=
t;font size=3D&amp;quot;1&amp;quot; color=3D&amp;quot;#ffffff&amp;quot; dat=
a-font-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchitects=
+Daughter&amp;quot;&amp;gt;&amp;lt;b style=3D&amp;quot;font-size: 15px;&amp=
;quot;&amp;gt;5&amp;lt;/b&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;=
ellipse;whiteSpace=3Dwrap;html=3D1;aspect=3Dfixed;rounded=3D1;fillColor=3D#=
000000;strokeColor=3D#56517e;fontFamily=3DLiberation Sans;fontSource=3Dhttp=
s%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; pa=
rent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometr=
y x=3D&quot;-313.25&quot; y=3D&quot;455&quot; width=3D&quot;30&quot; height=
=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&g=
t;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-331&quot; value=
=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis.co=
m/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;do_configure&amp;lt;br&=
amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;text;html=3D1;align=3Dcent=
er;verticalAlign=3Dmiddle;resizable=3D0;points=3D[];autosize=3D1;strokeColo=
r=3D#36393d;fillColor=3D#eeeeee;fontFamily=3DLiberation Sans;fontSource=3Dh=
ttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot;=
 parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeom=
etry x=3D&quot;1140&quot; y=3D&quot;925&quot; width=3D&quot;110&quot; heigh=
t=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&=
gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-332&quot; value=
=3D&quot;&amp;lt;font size=3D&amp;quot;1&amp;quot; color=3D&amp;quot;#fffff=
f&amp;quot; data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?fami=
ly=3DArchitects+Daughter&amp;quot;&amp;gt;&amp;lt;b style=3D&amp;quot;font-=
size: 15px;&amp;quot;&amp;gt;12&amp;lt;/b&amp;gt;&amp;lt;/font&amp;gt;&quot=
; style=3D&quot;ellipse;whiteSpace=3Dwrap;html=3D1;aspect=3Dfixed;rounded=
=3D1;fillColor=3D#000000;strokeColor=3D#56517e;fontFamily=3DLiberation Sans=
;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberatio=
n%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;     =
     &lt;mxGeometry x=3D&quot;1110&quot; y=3D&quot;925&quot; width=3D&quot;=
30&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#xA;      =
  &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-33=
3&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.=
googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;do_compile=
&amp;lt;br&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;text;html=3D1;a=
lign=3Dcenter;verticalAlign=3Dmiddle;resizable=3D0;points=3D[];autosize=3D1=
;strokeColor=3D#36393d;fillColor=3D#eeeeee;fontFamily=3DLiberation Sans;fon=
tSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2B=
Sans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;         =
 &lt;mxGeometry x=3D&quot;1160&quot; y=3D&quot;957.5&quot; width=3D&quot;90=
&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        =
&lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-334&=
quot; value=3D&quot;&amp;lt;font size=3D&amp;quot;1&amp;quot; color=3D&amp;=
quot;#ffffff&amp;quot; data-font-src=3D&amp;quot;https://fonts.googleapis.c=
om/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;&amp;lt;b style=3D&amp=
;quot;font-size: 15px;&amp;quot;&amp;gt;13&amp;lt;/b&amp;gt;&amp;lt;/font&a=
mp;gt;&quot; style=3D&quot;ellipse;whiteSpace=3Dwrap;html=3D1;aspect=3Dfixe=
d;rounded=3D1;fillColor=3D#000000;strokeColor=3D#56517e;fontFamily=3DLibera=
tion Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3D=
Liberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&=
#xA;          &lt;mxGeometry x=3D&quot;1130&quot; y=3D&quot;957.5&quot; wid=
th=3D&quot;30&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;=
&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9H=
tTySJIbg-340&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;htt=
ps://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt=
;do_unpack&amp;lt;br&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;text;=
html=3D1;align=3Dcenter;verticalAlign=3Dmiddle;resizable=3D0;points=3D[];au=
tosize=3D1;strokeColor=3D#36393d;fillColor=3D#eeeeee;fontFamily=3DLiberatio=
n Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLib=
eration%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA=
;          &lt;mxGeometry x=3D&quot;210&quot; y=3D&quot;405&quot; width=3D&=
quot;90&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#xA; =
       &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJI=
bg-341&quot; value=3D&quot;&amp;lt;font size=3D&amp;quot;1&amp;quot; color=
=3D&amp;quot;#ffffff&amp;quot; data-font-src=3D&amp;quot;https://fonts.goog=
leapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;&amp;lt;b styl=
e=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;2&amp;lt;/b&amp;gt;&amp;lt;=
/font&amp;gt;&quot; style=3D&quot;ellipse;whiteSpace=3Dwrap;html=3D1;aspect=
=3Dfixed;rounded=3D1;fillColor=3D#000000;strokeColor=3D#56517e;fontFamily=
=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3F=
family%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&q=
uot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;180&quot; y=3D&quot;405&quo=
t; width=3D&quot;30&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot;=
 /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDC=
u3Df9HtTySJIbg-349&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orth=
ogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D=
0;entryDy=3D0;curved=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A=
%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=
=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-343&quot; target=3D&qu=
ot;eV5wDCu3Df9HtTySJIbg-346&quot; edge=3D&quot;1&quot;&gt;&#xA;          &l=
t;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA; =
       &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJI=
bg-438&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthogonalLoop=
=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=
=3D0;curved=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffon=
ts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;=
1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-343&quot; target=3D&quot;eV5wDC=
u3Df9HtTySJIbg-345&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeome=
try relative=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            =
&lt;Array as=3D&quot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&qu=
ot;1045&quot; y=3D&quot;320&quot; /&gt;&#xA;              &lt;mxPoint x=3D&=
quot;917&quot; y=3D&quot;320&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA=
;          &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;=
mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-439&quot; style=3D&quot;edgeStyle=3D=
orthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0=
.5;entryY=3D0;entryDx=3D0;entryDy=3D0;curved=3D1;fontFamily=3DLiberation Sa=
ns;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberat=
ion%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIb=
g-343&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-436&quot; edge=3D&quot;1&qu=
ot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;ge=
ometry&quot;&gt;&#xA;            &lt;Array as=3D&quot;points&quot;&gt;&#xA;=
              &lt;mxPoint x=3D&quot;1045&quot; y=3D&quot;320&quot; /&gt;&#x=
A;              &lt;mxPoint x=3D&quot;1175&quot; y=3D&quot;320&quot; /&gt;&=
#xA;            &lt;/Array&gt;&#xA;          &lt;/mxGeometry&gt;&#xA;      =
  &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-34=
3&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.=
googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;conf&amp;l=
t;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;=
fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.co=
m%2Fcss%3Ffamily%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;=
&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;=
mxGeometry x=3D&quot;1010&quot; y=3D&quot;270&quot; width=3D&quot;70&quot; =
height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mx=
Cell&gt;&#xA;        &lt;mxCell id=3D&quot;utO5BPZsFb6q0V3ioqD--26&quot; st=
yle=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3D=
auto;html=3D1;entryX=3D0;entryY=3D1;entryDx=3D0;entryDy=3D0;exitX=3D0;exitY=
=3D0.5;exitDx=3D0;exitDy=3D0;curved=3D1;dashed=3D1;endArrow=3DclassicThin;e=
ndFill=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.go=
ogleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quo=
t; source=3D&quot;eV5wDCu3Df9HtTySJIbg-345&quot; target=3D&quot;utO5BPZsFb6=
q0V3ioqD--25&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry re=
lative=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            &lt;Ar=
ray as=3D&quot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&quot;860=
&quot; y=3D&quot;345&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot;86=
0&quot; y=3D&quot;270&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot;9=
32&quot; y=3D&quot;270&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA;     =
     &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell=
 id=3D&quot;eV5wDCu3Df9HtTySJIbg-345&quot; value=3D&quot;local.conf&quot; s=
tyle=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation=
 Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLibe=
ration%2BSans;fillColor=3D#eeeeee;strokeColor=3D#36393d;&quot; parent=3D&qu=
ot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quo=
t;870.25&quot; y=3D&quot;335&quot; width=3D&quot;94&quot; height=3D&quot;20=
&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;    =
    &lt;mxCell id=3D&quot;utO5BPZsFb6q0V3ioqD--24&quot; style=3D&quot;edgeS=
tyle=3DorthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;ent=
ryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;curved=3D1;endArrow=3DclassicT=
hin;endFill=3D1;dashed=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%=
3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; pare=
nt=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-346&quot; target=3D&=
quot;utO5BPZsFb6q0V3ioqD--22&quot; edge=3D&quot;1&quot;&gt;&#xA;          &=
lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;=
        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJ=
Ibg-346&quot; value=3D&quot;bblayers.conf&quot; style=3D&quot;rounded=3D1;w=
hiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3=
A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D=
#eeeeee;strokeColor=3D#36393d;&quot; parent=3D&quot;1&quot; vertex=3D&quot;=
1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;989.75&quot; y=3D&quot;3=
35&quot; width=3D&quot;110&quot; height=3D&quot;20&quot; as=3D&quot;geometr=
y&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot=
;eV5wDCu3Df9HtTySJIbg-350&quot; value=3D&quot;&amp;lt;font style=3D&amp;quo=
t;font-size: 15px;&amp;quot;&amp;gt;&amp;lt;b&amp;gt;&amp;lt;u&amp;gt;S&amp=
;lt;/u&amp;gt;&amp;lt;/b&amp;gt; defaults generally to &amp;lt;b&amp;gt;&am=
p;lt;u&amp;gt;${UNPACKDIR}/${BP}&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt;&amp;lt=
;br&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=
=3Dwrap;html=3D1;dashed=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps=
%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;arcSize=3D=
0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &l=
t;mxGeometry x=3D&quot;1259.75&quot; y=3D&quot;520&quot; width=3D&quot;230.=
25&quot; height=3D&quot;150&quot; as=3D&quot;geometry&quot; /&gt;&#xA;     =
   &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-3=
52&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts=
.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;do_patch&=
amp;lt;br&amp;gt;&amp;lt;i&amp;gt;(No patches)&amp;lt;/i&amp;gt;&amp;lt;br&=
amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;text;html=3D1;align=3Dcent=
er;verticalAlign=3Dmiddle;resizable=3D0;points=3D[];autosize=3D1;strokeColo=
r=3D#36393d;fillColor=3D#eeeeee;fontFamily=3DLiberation Sans;fontSource=3Dh=
ttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot;=
 parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeom=
etry x=3D&quot;1140&quot; y=3D&quot;855&quot; width=3D&quot;110&quot; heigh=
t=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&=
gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-353&quot; value=
=3D&quot;&amp;lt;font size=3D&amp;quot;1&amp;quot; color=3D&amp;quot;#fffff=
f&amp;quot; data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?fami=
ly=3DArchitects+Daughter&amp;quot;&amp;gt;&amp;lt;b style=3D&amp;quot;font-=
size: 15px;&amp;quot;&amp;gt;3&amp;lt;/b&amp;gt;&amp;lt;/font&amp;gt;&quot;=
 style=3D&quot;ellipse;whiteSpace=3Dwrap;html=3D1;aspect=3Dfixed;rounded=3D=
1;fillColor=3D#000000;strokeColor=3D#56517e;fontFamily=3DLiberation Sans;fo=
ntSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2=
BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;        =
  &lt;mxGeometry x=3D&quot;1110&quot; y=3D&quot;860&quot; width=3D&quot;30&=
quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &=
lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-354&q=
uot; value=3D&quot;&amp;lt;font size=3D&amp;quot;1&amp;quot; color=3D&amp;q=
uot;#ffffff&amp;quot; data-font-src=3D&amp;quot;https://fonts.googleapis.co=
m/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;&amp;lt;b style=3D&amp;=
quot;font-size: 15px;&amp;quot;&amp;gt;4&amp;lt;/b&amp;gt;&amp;lt;/font&amp=
;gt;&quot; style=3D&quot;ellipse;whiteSpace=3Dwrap;html=3D1;aspect=3Dfixed;=
rounded=3D1;fillColor=3D#000000;strokeColor=3D#56517e;fontFamily=3DLiberati=
on Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLi=
beration%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#x=
A;          &lt;mxGeometry x=3D&quot;713&quot; y=3D&quot;1100&quot; width=
=3D&quot;30&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#=
xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtT=
ySJIbg-356&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https=
://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;d=
o_install&amp;lt;br&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;text;h=
tml=3D1;align=3Dcenter;verticalAlign=3Dmiddle;resizable=3D0;points=3D[];aut=
osize=3D1;strokeColor=3D#36393d;fillColor=3D#eeeeee;fontFamily=3DLiberation=
 Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLibe=
ration%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;=
          &lt;mxGeometry x=3D&quot;1314.75&quot; y=3D&quot;1070&quot; width=
=3D&quot;90&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#=
xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtT=
ySJIbg-357&quot; value=3D&quot;&amp;lt;font size=3D&amp;quot;1&amp;quot; co=
lor=3D&amp;quot;#ffffff&amp;quot; data-font-src=3D&amp;quot;https://fonts.g=
oogleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;&amp;lt;b s=
tyle=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;14&amp;lt;/b&amp;gt;&amp=
;lt;/font&amp;gt;&quot; style=3D&quot;ellipse;whiteSpace=3Dwrap;html=3D1;as=
pect=3Dfixed;rounded=3D1;fillColor=3D#000000;strokeColor=3D#56517e;fontFami=
ly=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%=
3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1=
&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1285&quot; y=3D&quot;1070=
&quot; width=3D&quot;30&quot; height=3D&quot;30&quot; as=3D&quot;geometry&q=
uot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV=
5wDCu3Df9HtTySJIbg-362&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;=
rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entry=
Y=3D0;entryDx=3D0;entryDy=3D0;endArrow=3DclassicThin;endFill=3D1;fontFamily=
=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3F=
family%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5=
wDCu3Df9HtTySJIbg-358&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-361&quot; e=
dge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quo=
t; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        =
&lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-358&quot; value=3D&quot;&amp;lt;=
font data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DAr=
chitects+Daughter&amp;quot;&amp;gt;package&amp;lt;/font&amp;gt;&quot; style=
=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation San=
s;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberati=
on%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&quo=
t; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1640&q=
uot; y=3D&quot;720&quot; width=3D&quot;63&quot; height=3D&quot;40&quot; as=
=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;m=
xCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-359&quot; value=3D&quot;&amp;lt;font =
data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchite=
cts+Daughter&amp;quot;&amp;gt;PKGD&amp;lt;/font&amp;gt;&quot; style=3D&quot=
;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSo=
urce=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSan=
s;fillColor=3D#000000;strokeColor=3Dnone;fillStyle=3Dauto;glass=3D0;shadow=
=3D0;fontColor=3D#ffffff;fontStyle=3D1&quot; parent=3D&quot;1&quot; vertex=
=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1693.26&quot; y=
=3D&quot;745&quot; width=3D&quot;36.74&quot; height=3D&quot;25&quot; as=3D&=
quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCel=
l id=3D&quot;eV5wDCu3Df9HtTySJIbg-384&quot; style=3D&quot;edgeStyle=3Dortho=
gonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.75;ex=
itY=3D1;exitDx=3D0;exitDy=3D0;entryX=3D0.5;entryY=3D1;entryDx=3D0;entryDy=
=3D0;curved=3D1;strokeWidth=3D3;fillColor=3D#d0cee2;strokeColor=3D#000000;f=
ontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com=
%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D=
&quot;eV5wDCu3Df9HtTySJIbg-361&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-38=
0&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&q=
uot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            &lt;Array as=3D&q=
uot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&quot;1698&quot; y=
=3D&quot;1120&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot;1860&quot=
; y=3D&quot;1120&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA;          &=
lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D=
&quot;eV5wDCu3Df9HtTySJIbg-361&quot; value=3D&quot;A copy of&amp;amp;nbsp;&=
amp;lt;b&amp;gt;${D}&amp;lt;br&amp;gt;&amp;lt;/b&amp;gt;excluding&amp;lt;br=
&amp;gt;&amp;lt;b&amp;gt;/sysroot-only&amp;lt;/b&amp;gt;&quot; style=3D&quo=
t;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fillColor=3D#eeeeee;dashed=3D1;fon=
tFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2=
Fcss%3Ffamily%3DLiberation%2BSans;strokeColor=3D#36393d;&quot; parent=3D&qu=
ot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quo=
t;1617.63&quot; y=3D&quot;840&quot; width=3D&quot;107.75&quot; height=3D&qu=
ot;240&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#x=
A;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-364&quot; value=3D&quo=
t;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?f=
amily=3DArchitects+Daughter&amp;quot;&amp;gt;do_package&amp;lt;br&amp;gt;&a=
mp;lt;/font&amp;gt;&quot; style=3D&quot;text;html=3D1;align=3Dcenter;vertic=
alAlign=3Dmiddle;resizable=3D0;points=3D[];autosize=3D1;strokeColor=3D#3639=
3d;fillColor=3D#eeeeee;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2=
F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=
=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=
=3D&quot;1573.24&quot; y=3D&quot;1100&quot; width=3D&quot;90&quot; height=
=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&g=
t;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-365&quot; value=
=3D&quot;&amp;lt;font size=3D&amp;quot;1&amp;quot; color=3D&amp;quot;#fffff=
f&amp;quot; data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?fami=
ly=3DArchitects+Daughter&amp;quot;&amp;gt;&amp;lt;b style=3D&amp;quot;font-=
size: 15px;&amp;quot;&amp;gt;15&amp;lt;/b&amp;gt;&amp;lt;/font&amp;gt;&quot=
; style=3D&quot;ellipse;whiteSpace=3Dwrap;html=3D1;aspect=3Dfixed;rounded=
=3D1;fillColor=3D#000000;strokeColor=3D#56517e;fontFamily=3DLiberation Sans=
;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberatio=
n%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;     =
     &lt;mxGeometry x=3D&quot;1543.49&quot; y=3D&quot;1100&quot; width=3D&q=
uot;30&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt;&#xA;  =
      &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIb=
g-381&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;ortho=
gonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0=
;entryDy=3D0;endArrow=3DclassicThin;endFill=3D1;fontFamily=3DLiberation San=
s;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberati=
on%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg=
-366&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-380&quot; edge=3D&quot;1&quo=
t;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geo=
metry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&=
quot;eV5wDCu3Df9HtTySJIbg-366&quot; value=3D&quot;&amp;lt;font data-font-sr=
c=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter=
&amp;quot;&amp;gt;packages-split&amp;lt;/font&amp;gt;&quot; style=3D&quot;r=
ounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSour=
ce=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;=
fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&quot; vertex=
=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1800&quot; y=3D=
&quot;720&quot; width=3D&quot;120&quot; height=3D&quot;40&quot; as=3D&quot;=
geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=
=3D&quot;eV5wDCu3Df9HtTySJIbg-367&quot; value=3D&quot;&amp;lt;font data-fon=
t-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DArchitects+Daug=
hter&amp;quot;&amp;gt;PKGDEST&amp;lt;/font&amp;gt;&quot; style=3D&quot;roun=
ded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=
=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fi=
llColor=3D#000000;strokeColor=3Dnone;fillStyle=3Dauto;glass=3D0;shadow=3D0;=
fontColor=3D#ffffff;fontStyle=3D1&quot; parent=3D&quot;1&quot; vertex=3D&qu=
ot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1910&quot; y=3D&quot;=
745&quot; width=3D&quot;60&quot; height=3D&quot;25&quot; as=3D&quot;geometr=
y&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot=
;eV5wDCu3Df9HtTySJIbg-377&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeSty=
le;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.5;exi=
tY=3D1;exitDx=3D0;exitDy=3D0;endArrow=3DclassicThin;endFill=3D1;fontFamily=
=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3F=
family%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5=
wDCu3Df9HtTySJIbg-369&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-373&quot; e=
dge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quo=
t; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        =
&lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-369&quot; value=3D&quot;&amp;lt;=
font data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DAr=
chitects+Daughter&amp;quot;&amp;gt;sayhello&amp;lt;/font&amp;gt;&quot; styl=
e=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sa=
ns;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberat=
ion%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&qu=
ot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1828.=
5&quot; y=3D&quot;850&quot; width=3D&quot;63&quot; height=3D&quot;40&quot; =
as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt=
;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-372&quot; style=3D&quot;edgeStyle=
=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=
=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3DclassicThin=
;endFill=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.=
googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&q=
uot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-373&quot; target=3D&quot;eV5wDCu3D=
f9HtTySJIbg-375&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry=
 relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/=
mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-373&quot;=
 value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googlea=
pis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;usr&amp;lt;/font&=
amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFami=
ly=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%=
3Ffamily%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; p=
arent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeomet=
ry x=3D&quot;1838.25&quot; y=3D&quot;910&quot; width=3D&quot;43.5&quot; hei=
ght=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCel=
l&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-374&quot; styl=
e=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1;je=
ttySize=3Dauto;html=3D1;exitX=3D0.5;exitY=3D1;exitDx=3D0;exitDy=3D0;entryX=
=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3DclassicThin;endFill=3D=
1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.=
com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=
=3D&quot;eV5wDCu3Df9HtTySJIbg-375&quot; target=3D&quot;utO5BPZsFb6q0V3ioqD-=
-10&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D=
&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            &lt;mxPoint x=
=3D&quot;1860&quot; y=3D&quot;1037.5&quot; as=3D&quot;targetPoint&quot; /&g=
t;&#xA;          &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;      =
  &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-375&quot; value=3D&quot;&amp;l=
t;font data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3D=
Architects+Daughter&amp;quot;&amp;gt;bin&amp;lt;/font&amp;gt;&quot; style=
=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation San=
s;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberati=
on%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&quo=
t; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1833.1=
2&quot; y=3D&quot;977.5&quot; width=3D&quot;53.75&quot; height=3D&quot;40&q=
uot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;      =
  &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-382&quot; value=3D&quot;&amp;l=
t;span style=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;Folders created =
here are present in &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;PACKAGES&amp;lt;/u&am=
p;gt;&amp;lt;/b&amp;gt; variable, BitBake knows what and where to put thing=
s using the &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;FILES&amp;lt;/u&amp;gt;&amp;l=
t;/b&amp;gt; variable, example: &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;FILES:${P=
N}&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt; files will go to &amp;lt;b&amp;gt;&a=
mp;lt;u&amp;gt;${PN}&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt;&amp;amp;nbsp;folde=
r which is in &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;PACKAGES&amp;lt;/u&amp;gt;&=
amp;lt;/b&amp;gt;&amp;lt;/span&amp;gt;&quot; style=3D&quot;rounded=3D1;whit=
eSpace=3Dwrap;html=3D1;dashed=3D1;fontFamily=3DLiberation Sans;fontSource=
=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;ar=
cSize=3D0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;    =
      &lt;mxGeometry x=3D&quot;1505.37&quot; y=3D&quot;520&quot; width=3D&q=
uot;321.75&quot; height=3D&quot;148.75&quot; as=3D&quot;geometry&quot; /&gt=
;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9=
HtTySJIbg-385&quot; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;ht=
tps://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;g=
t;do_package&amp;lt;br&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;tex=
t;html=3D1;align=3Dcenter;verticalAlign=3Dmiddle;resizable=3D0;points=3D[];=
autosize=3D1;strokeColor=3D#36393d;fillColor=3D#eeeeee;fontFamily=3DLiberat=
ion Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DL=
iberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#=
xA;          &lt;mxGeometry x=3D&quot;1743.12&quot; y=3D&quot;1100&quot; wi=
dth=3D&quot;90&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /&gt=
;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9=
HtTySJIbg-386&quot; value=3D&quot;&amp;lt;font size=3D&amp;quot;1&amp;quot;=
 color=3D&amp;quot;#ffffff&amp;quot; data-font-src=3D&amp;quot;https://font=
s.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;&amp;lt;=
b style=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;16&amp;lt;/b&amp;gt;&=
amp;lt;/font&amp;gt;&quot; style=3D&quot;ellipse;whiteSpace=3Dwrap;html=3D1=
;aspect=3Dfixed;rounded=3D1;fillColor=3D#000000;strokeColor=3D#56517e;fontF=
amily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fc=
ss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quo=
t;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1713.37&quot; y=3D&quo=
t;1100&quot; width=3D&quot;30&quot; height=3D&quot;30&quot; as=3D&quot;geom=
etry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&q=
uot;eV5wDCu3Df9HtTySJIbg-390&quot; style=3D&quot;edgeStyle=3DorthogonalEdge=
Style;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.5=
;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3DclassicThin;endFill=3D1;font=
Family=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2F=
css%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&qu=
ot;eV5wDCu3Df9HtTySJIbg-387&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-389&q=
uot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot=
;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;  =
      &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-387&quot; value=3D&quot;&a=
mp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?famil=
y=3DArchitects+Daughter&amp;quot;&amp;gt;deploy-&amp;lt;b&amp;gt;&amp;lt;i&=
amp;gt;pkg&amp;lt;/i&amp;gt;&amp;lt;/b&amp;gt;&amp;lt;/font&amp;gt;&quot; s=
tyle=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation=
 Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLibe=
ration%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1=
&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;20=
20&quot; y=3D&quot;720&quot; width=3D&quot;120&quot; height=3D&quot;40&quot=
; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &=
lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-396&quot; style=3D&quot;edgeStyle=
=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=
=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;endArrow=3DclassicThin=
;endFill=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.=
googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&q=
uot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-389&quot; target=3D&quot;eV5wDCu3D=
f9HtTySJIbg-395&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry=
 relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/=
mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-389&quot;=
 value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googlea=
pis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;&amp;lt;b&amp;gt;=
${PACKAGE_ARCH}&amp;lt;/b&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;=
rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSou=
rce=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans=
;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; parent=3D&quot;1&quot; vertex=
=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;2020&quot; y=3D=
&quot;855&quot; width=3D&quot;120&quot; height=3D&quot;40&quot; as=3D&quot;=
geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=
=3D&quot;eV5wDCu3Df9HtTySJIbg-393&quot; value=3D&quot;&amp;lt;font style=3D=
&amp;quot;font-size: 15px;&amp;quot;&amp;gt;This can be &amp;lt;b&amp;gt;&a=
mp;lt;u&amp;gt;rpms&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt;, &amp;lt;b&amp;gt;&=
amp;lt;u&amp;gt;debs&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt; or &amp;lt;b&amp;g=
t;&amp;lt;u&amp;gt;ipks&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt;.&amp;lt;br&amp;=
gt;These are provided by&amp;lt;br&amp;gt;&amp;lt;b&amp;gt;&amp;lt;u&amp;gt=
;package_rpm&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt;, &amp;lt;b&amp;gt;&amp;lt;=
u&amp;gt;package_deb&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt; and &amp;lt;b&amp;=
gt;&amp;lt;u&amp;gt;package_ipk&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt; classes=
 respectively, use &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;PACKAGE_CLASSES&amp;lt=
;/u&amp;gt;&amp;lt;/b&amp;gt; for that as&amp;lt;br&amp;gt;content of &amp;=
lt;b&amp;gt;&amp;lt;u&amp;gt;PACKAGE_CLASSES&amp;lt;/u&amp;gt;&amp;lt;/b&am=
p;gt; will be appended&amp;lt;br&amp;gt;to &amp;lt;b&amp;gt;&amp;lt;u&amp;g=
t;INHERIT&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt;&amp;lt;br&amp;gt;&amp;lt;/fon=
t&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;dashed=
=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleap=
is.com%2Fcss%3Ffamily%3DLiberation%2BSans;arcSize=3D0;&quot; parent=3D&quot=
;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;=
1840&quot; y=3D&quot;520&quot; width=3D&quot;410&quot; height=3D&quot;148.7=
5&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;   =
     &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-415&quot; style=3D&quot;edg=
eStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1;jettySize=3Daut=
o;html=3D1;exitX=3D1;exitY=3D0.5;exitDx=3D0;exitDy=3D0;entryX=3D0.5;entryY=
=3D1;entryDx=3D0;entryDy=3D0;strokeWidth=3D3;fillColor=3D#d0cee2;strokeColo=
r=3D#000000;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.g=
oogleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&qu=
ot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-395&quot; target=3D&quot;eV5wDCu3Df=
9HtTySJIbg-413&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry =
relative=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            &lt;=
Array as=3D&quot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&quot;2=
270&quot; y=3D&quot;956&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot=
;2270&quot; y=3D&quot;500&quot; /&gt;&#xA;              &lt;mxPoint x=3D&qu=
ot;1412&quot; y=3D&quot;500&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA;=
          &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;m=
xCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-395&quot; value=3D&quot;sayhello-0.1-=
r0.${PACKAGE_ARCH}.&amp;lt;i&amp;gt;pkg&amp;lt;/i&amp;gt;&quot; style=3D&qu=
ot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;font=
Source=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BS=
ans;fillColor=3D#eeeeee;strokeColor=3D#36393d;&quot; parent=3D&quot;1&quot;=
 vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1946.5&q=
uot; y=3D&quot;940&quot; width=3D&quot;267&quot; height=3D&quot;32.5&quot; =
as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt=
;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-397&quot; value=3D&quot;&amp;lt;fon=
t style=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;This task also depend=
s on &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;PACKAGE_CLASSES&amp;lt;/u&amp;gt;&am=
p;lt;/b&amp;gt;,&amp;lt;br&amp;gt;&amp;lt;b&amp;gt;&amp;lt;u&amp;gt;&amp;lt=
;i&amp;gt;pkg&amp;lt;/i&amp;gt;&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt;&amp;amp=
;nbsp;can be &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;rpm&amp;lt;/u&amp;gt;&amp;lt=
;/b&amp;gt;, &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;deb&amp;lt;/u&amp;gt;&amp;lt=
;/b&amp;gt; or &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;ipk&amp;lt;/u&amp;gt;&amp;=
lt;/b&amp;gt; for &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;package_rpm&amp;lt;/u&a=
mp;gt;&amp;lt;/b&amp;gt;,&amp;lt;br&amp;gt;&amp;lt;b&amp;gt;&amp;lt;u&amp;g=
t;package_deb&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt; or &amp;lt;u style=3D&amp=
;quot;font-weight: bold;&amp;quot;&amp;gt;package_ipk&amp;lt;/u&amp;gt;&amp=
;amp;nbsp;respectively.&amp;lt;br&amp;gt;The generated package generally na=
med using:&amp;lt;br&amp;gt;&amp;lt;b&amp;gt;&amp;lt;u&amp;gt;${PN}&amp;lt;=
/u&amp;gt;&amp;lt;/b&amp;gt;, &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;${PR}&amp;l=
t;/u&amp;gt;&amp;lt;/b&amp;gt;, &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;${PACKAGE=
_ARCH}&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt; and&amp;amp;nbsp;&amp;lt;b&amp;g=
t;&amp;lt;u&amp;gt;&amp;lt;i&amp;gt;pkg&amp;lt;/i&amp;gt;&amp;lt;/u&amp;gt;=
&amp;lt;/b&amp;gt;&amp;lt;br&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&qu=
ot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fillColor=3Dnone;dashed=3D1;fontF=
amily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fc=
ss%3Ffamily%3DLiberation%2BSans;strokeColor=3D#36393d;arcSize=3D0;&quot; pa=
rent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometr=
y x=3D&quot;2280&quot; y=3D&quot;840&quot; width=3D&quot;370&quot; height=
=3D&quot;170&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&=
gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-404&quot; style=
=3D&quot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1;jet=
tySize=3Dauto;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2=
F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=
=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-401&quot; target=3D&qu=
ot;eV5wDCu3Df9HtTySJIbg-403&quot; edge=3D&quot;1&quot;&gt;&#xA;          &l=
t;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA; =
       &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;utO5BPZsFb6q0V3ioq=
D--21&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthogonalLoop=3D=
1;jettySize=3Dauto;html=3D1;entryX=3D0;entryY=3D0.5;entryDx=3D0;entryDy=3D0=
;strokeColor=3Ddefault;curved=3D1;dashed=3D1;endArrow=3DclassicThin;endFill=
=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleap=
is.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; sou=
rce=3D&quot;eV5wDCu3Df9HtTySJIbg-401&quot; target=3D&quot;utO5BPZsFb6q0V3io=
qD--20&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=
=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt=
;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-401&quot; value=3D=
&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis.com/c=
ss?family=3DArchitects+Daughter&amp;quot;&amp;gt;deploy&amp;lt;/font&amp;gt=
;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DL=
iberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffami=
ly%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; parent=
=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=
=3D&quot;1376.5&quot; y=3D&quot;270&quot; width=3D&quot;70&quot; height=3D&=
quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#=
xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-414&quot; style=3D&qu=
ot;edgeStyle=3DorthogonalEdgeStyle;rounded=3D1;orthogonalLoop=3D1;jettySize=
=3Dauto;html=3D1;entryX=3D0.5;entryY=3D0;entryDx=3D0;entryDy=3D0;fontFamily=
=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3F=
family%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5=
wDCu3Df9HtTySJIbg-403&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-413&quot; e=
dge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quo=
t; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        =
&lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-403&quot; value=3D&quot;&amp;lt;=
b&amp;gt;${DEPLOY_DIR_&amp;lt;i&amp;gt;pkg&amp;lt;/i&amp;gt;}&amp;lt;/b&amp=
;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=
=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3F=
family%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; par=
ent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry=
 x=3D&quot;1346.62&quot; y=3D&quot;350&quot; width=3D&quot;129.75&quot; hei=
ght=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCel=
l&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-408&quot; valu=
e=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis.c=
om/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;do_package_write_&amp;=
lt;i&amp;gt;pkg&amp;lt;/i&amp;gt;&amp;lt;br&amp;gt;&amp;lt;/font&amp;gt;&qu=
ot; style=3D&quot;text;html=3D1;align=3Dcenter;verticalAlign=3Dmiddle;resiz=
able=3D0;points=3D[];autosize=3D1;strokeColor=3D#36393d;fillColor=3D#eeeeee=
;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.c=
om%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=
=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;1955&quot; y=3D=
&quot;1100&quot; width=3D&quot;150&quot; height=3D&quot;30&quot; as=3D&quot=
;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=
=3D&quot;eV5wDCu3Df9HtTySJIbg-409&quot; value=3D&quot;&amp;lt;font size=3D&=
amp;quot;1&amp;quot; color=3D&amp;quot;#ffffff&amp;quot; data-font-src=3D&a=
mp;quot;https://fonts.googleapis.com/css?family=3DArchitects+Daughter&amp;q=
uot;&amp;gt;&amp;lt;b style=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;1=
7&amp;lt;/b&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;ellipse;whiteS=
pace=3Dwrap;html=3D1;aspect=3Dfixed;rounded=3D1;fillColor=3D#000000;strokeC=
olor=3D#56517e;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffont=
s.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1=
&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;19=
20&quot; y=3D&quot;1100&quot; width=3D&quot;30&quot; height=3D&quot;30&quot=
; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &=
lt;mxCell id=3D&quot;utO5BPZsFb6q0V3ioqD--11&quot; style=3D&quot;edgeStyle=
=3DorthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=
=3D0.5;entryY=3D1;entryDx=3D0;entryDy=3D0;dashed=3D1;endArrow=3DclassicThin=
;endFill=3D1;curved=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%=
2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;exitX=3D1;exit=
Y=3D0.5;exitDx=3D0;exitDy=3D0;&quot; parent=3D&quot;1&quot; source=3D&quot;=
IR5jgyizBFApjn6Bth0e-3&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-397&quot; =
edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&qu=
ot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;       =
 &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-413&quot; value=3D&quot;${PACKA=
GE_ARCH}&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFam=
ily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss=
%3Ffamily%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&quot; =
parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeome=
try x=3D&quot;1351.5&quot; y=3D&quot;425&quot; width=3D&quot;120&quot; heig=
ht=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell=
&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-416&quot; value=
=3D&quot;&amp;lt;font style=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;F=
or packages, this can be &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;IPK&amp;lt;/u&am=
p;gt;&amp;lt;/b&amp;gt;, &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;RPM&amp;lt;/u&am=
p;gt;&amp;lt;/b&amp;gt; or &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;DEB&amp;lt;/u&=
amp;gt;&amp;lt;/b&amp;gt; (&amp;lt;i&amp;gt;check step 17&amp;lt;/i&amp;gt;=
)&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;ht=
ml=3D1;dashed=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ff=
onts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;arcSize=3D0;&quot; p=
arent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeomet=
ry x=3D&quot;1525&quot; y=3D&quot;348.13&quot; width=3D&quot;415&quot; heig=
ht=3D&quot;41.87&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxC=
ell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-417&quot; va=
lue=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis=
.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;DEPLOY_DIR&amp;lt;/f=
ont&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;font=
Family=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2F=
css%3Ffamily%3DLiberation%2BSans;fillColor=3D#000000;strokeColor=3Dnone;fil=
lStyle=3Dauto;glass=3D0;shadow=3D0;fontColor=3D#ffffff;fontStyle=3D1&quot; =
parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeome=
try x=3D&quot;1425.37&quot; y=3D&quot;300&quot; width=3D&quot;80&quot; heig=
ht=3D&quot;25&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell=
&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-418&quot; value=
=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis.co=
m/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;TMPDIR&amp;lt;/font&amp=
;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=
=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3F=
family%3DLiberation%2BSans;fillColor=3D#000000;strokeColor=3Dnone;fillStyle=
=3Dauto;glass=3D0;shadow=3D0;fontColor=3D#ffffff;fontStyle=3D1&quot; parent=
=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=
=3D&quot;830&quot; y=3D&quot;200&quot; width=3D&quot;60&quot; height=3D&quo=
t;25&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;=
        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-419&quot; value=3D&quot;=
&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?fam=
ily=3DArchitects+Daughter&amp;quot;&amp;gt;DL_DIR&amp;lt;/font&amp;gt;&quot=
; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberat=
ion Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DL=
iberation%2BSans;fillColor=3D#000000;strokeColor=3Dnone;fillStyle=3Dauto;gl=
ass=3D0;shadow=3D0;fontColor=3D#ffffff;fontStyle=3D1&quot; parent=3D&quot;1=
&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry y=3D&quot;30=
0&quot; width=3D&quot;62.68&quot; height=3D&quot;25&quot; as=3D&quot;geomet=
ry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quo=
t;eV5wDCu3Df9HtTySJIbg-422&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeSt=
yle;rounded=3D1;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0;ent=
ryY=3D0.5;entryDx=3D0;entryDy=3D0;exitX=3D1;exitY=3D0.5;exitDx=3D0;exitDy=
=3D0;endArrow=3DclassicThin;endFill=3D1;dashed=3D1;fontFamily=3DLiberation =
Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiber=
ation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJ=
Ibg-403&quot; target=3D&quot;eV5wDCu3Df9HtTySJIbg-416&quot; edge=3D&quot;1&=
quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;=
geometry&quot;&gt;&#xA;            &lt;mxPoint x=3D&quot;1480.4900000000002=
&quot; y=3D&quot;387.48571428571427&quot; as=3D&quot;sourcePoint&quot; /&gt=
;&#xA;          &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;       =
 &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-424&quot; value=3D&quot;&amp;lt=
;font data-font-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DA=
rchitects+Daughter&amp;quot;&amp;gt;do_package_write_&amp;lt;i&amp;gt;pkg&a=
mp;lt;/i&amp;gt;&amp;lt;br&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot=
;text;html=3D1;align=3Dcenter;verticalAlign=3Dmiddle;resizable=3D0;points=
=3D[];autosize=3D1;strokeColor=3D#36393d;fillColor=3D#eeeeee;fontFamily=3DL=
iberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffami=
ly%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;=
&gt;&#xA;          &lt;mxGeometry x=3D&quot;2205&quot; y=3D&quot;775&quot; =
width=3D&quot;150&quot; height=3D&quot;30&quot; as=3D&quot;geometry&quot; /=
&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3=
Df9HtTySJIbg-425&quot; value=3D&quot;&amp;lt;font size=3D&amp;quot;1&amp;qu=
ot; color=3D&amp;quot;#ffffff&amp;quot; data-font-src=3D&amp;quot;https://f=
onts.googleapis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;&amp;=
lt;b style=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;18&amp;lt;/b&amp;g=
t;&amp;lt;/font&amp;gt;&quot; style=3D&quot;ellipse;whiteSpace=3Dwrap;html=
=3D1;aspect=3Dfixed;rounded=3D1;fillColor=3D#000000;strokeColor=3D#56517e;f=
ontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com=
%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; vertex=3D=
&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;2170&quot; y=3D&qu=
ot;775&quot; width=3D&quot;30&quot; height=3D&quot;30&quot; as=3D&quot;geom=
etry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&q=
uot;utO5BPZsFb6q0V3ioqD--8&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeSt=
yle;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.75;entryY=3D1;e=
ntryDx=3D0;entryDy=3D0;dashed=3D1;endArrow=3DclassicThin;endFill=3D1;curved=
=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleap=
is.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; sou=
rce=3D&quot;eV5wDCu3Df9HtTySJIbg-427&quot; target=3D&quot;eV5wDCu3Df9HtTySJ=
Ibg-429&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relativ=
e=3D&quot;1&quot; as=3D&quot;geometry&quot;&gt;&#xA;            &lt;Array a=
s=3D&quot;points&quot;&gt;&#xA;              &lt;mxPoint x=3D&quot;2303&quo=
t; y=3D&quot;758&quot; /&gt;&#xA;              &lt;mxPoint x=3D&quot;2303&q=
uot; y=3D&quot;602&quot; /&gt;&#xA;            &lt;/Array&gt;&#xA;         =
 &lt;/mxGeometry&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=
=3D&quot;eV5wDCu3Df9HtTySJIbg-427&quot; value=3D&quot;&quot; style=3D&quot;=
rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSou=
rce=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans=
;fillColor=3D#000000;strokeColor=3Dnone;fillStyle=3Dauto;glass=3D0;shadow=
=3D0;fontColor=3D#ffffff;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quo=
t;&gt;&#xA;          &lt;mxGeometry x=3D&quot;2120&quot; y=3D&quot;745&quot=
; width=3D&quot;30&quot; height=3D&quot;25&quot; as=3D&quot;geometry&quot; =
/&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu=
3Df9HtTySJIbg-428&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;ortho=
gonalLoop=3D1;jettySize=3Dauto;html=3D1;exitX=3D0.75;exitY=3D0;exitDx=3D0;e=
xitDy=3D0;entryX=3D0.75;entryY=3D1;entryDx=3D0;entryDy=3D0;endArrow=3Dclass=
icThin;endFill=3D1;dashed=3D1;curved=3D1;fontFamily=3DLiberation Sans;fontS=
ource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSa=
ns;&quot; parent=3D&quot;1&quot; source=3D&quot;IR5jgyizBFApjn6Bth0e-4&quot=
; target=3D&quot;eV5wDCu3Df9HtTySJIbg-393&quot; edge=3D&quot;1&quot;&gt;&#x=
A;          &lt;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quo=
t; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5w=
DCu3Df9HtTySJIbg-429&quot; value=3D&quot;&amp;lt;font style=3D&amp;quot;fon=
t-size: 15px;&amp;quot;&amp;gt;This can be &amp;lt;b&amp;gt;&amp;lt;u&amp;g=
t;PKGWRITEDIRRPM&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt;, &amp;lt;b&amp;gt;&amp=
;lt;u&amp;gt;PKGWRITEDIRDEB&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt; or &amp;lt;=
b&amp;gt;&amp;lt;u&amp;gt;PKGWRITEDIRIPK&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt=
; for &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;package_rpm&amp;lt;/u&amp;gt;&amp;l=
t;/b&amp;gt;, &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;package_deb&amp;lt;/u&amp;g=
t;&amp;lt;/b&amp;gt;&amp;lt;br&amp;gt;or &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;=
package_ipk&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt; respectively&amp;lt;br&amp;=
gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;=
html=3D1;dashed=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2=
Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;arcSize=3D0;&quot;=
 parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeom=
etry x=3D&quot;1990&quot; y=3D&quot;381.25&quot; width=3D&quot;416.88&quot;=
 height=3D&quot;77.5&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;=
/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-432&quot=
; value=3D&quot;&amp;lt;span style=3D&amp;quot;font-size: 15px;&amp;quot;&a=
mp;gt;License checking happens in &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;do_popu=
late_lic&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt; after &amp;lt;b&amp;gt;&amp;lt=
;u&amp;gt;do_patch&amp;lt;br&amp;gt;&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt;and=
 before that a checksum check&amp;lt;br&amp;gt;happends on&amp;amp;nbsp;&am=
p;lt;b&amp;gt;&amp;lt;u&amp;gt;LIC_FILES_CHKSUM&amp;lt;/u&amp;gt;&amp;lt;/b=
&amp;gt; if the&amp;lt;br&amp;gt;license is not &amp;lt;b&amp;gt;&amp;lt;u&=
amp;gt;CLOSED&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt;&amp;lt;br&amp;gt;&amp;lt;=
/span&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;da=
shed=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.goog=
leapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;arcSize=3D0;fillColor=3Dnone;=
&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;=
mxGeometry x=3D&quot;-260&quot; y=3D&quot;797.5&quot; width=3D&quot;328.25&=
quot; height=3D&quot;102.5&quot; as=3D&quot;geometry&quot; /&gt;&#xA;      =
  &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-43=
4&quot; value=3D&quot;&amp;lt;span style=3D&amp;quot;font-size: 15px;&amp;q=
uot;&amp;gt;This variable is used to separate recipes&amp;lt;br&amp;gt;base=
d on their target. This has value of&amp;lt;br&amp;gt;&amp;lt;b&amp;gt;&amp=
;lt;u&amp;gt;${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}&amp;lt;/u&amp;gt;=
&amp;lt;/b&amp;gt;&amp;lt;br&amp;gt;&amp;lt;/span&amp;gt;&quot; style=3D&qu=
ot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;dashed=3D1;fontFamily=3DLiberatio=
n Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLib=
eration%2BSans;arcSize=3D0;fillColor=3Dnone;&quot; parent=3D&quot;1&quot; v=
ertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;465.12&quo=
t; y=3D&quot;520&quot; width=3D&quot;434.88&quot; height=3D&quot;70&quot; a=
s=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;=
mxCell id=3D&quot;utO5BPZsFb6q0V3ioqD--28&quot; style=3D&quot;edgeStyle=3Do=
rthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.=
75;entryY=3D1;entryDx=3D0;entryDy=3D0;exitX=3D1;exitY=3D0.5;exitDx=3D0;exit=
Dy=3D0;dashed=3D1;curved=3D1;endArrow=3DclassicThin;endFill=3D1;fontFamily=
=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3F=
family%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot; source=3D&quot;eV5=
wDCu3Df9HtTySJIbg-436&quot; target=3D&quot;utO5BPZsFb6q0V3ioqD--27&quot; ed=
ge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry relative=3D&quot;1&quot=
; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &=
lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-436&quot; value=3D&quot;conf-note=
s.txt&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fontFamily=
=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3F=
family%3DLiberation%2BSans;fillColor=3D#eeeeee;strokeColor=3D#36393d;&quot;=
 parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeom=
etry x=3D&quot;1120&quot; y=3D&quot;335&quot; width=3D&quot;110&quot; heigh=
t=3D&quot;20&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&=
gt;&#xA;        &lt;mxCell id=3D&quot;utO5BPZsFb6q0V3ioqD--16&quot; style=
=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Daut=
o;html=3D1;entryX=3D0;entryY=3D0.5;entryDx=3D0;entryDy=3D0;exitX=3D0.5;exit=
Y=3D1;exitDx=3D0;exitDy=3D0;curved=3D1;dashed=3D1;endArrow=3DclassicThin;en=
dFill=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.goo=
gleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quot=
; source=3D&quot;eV5wDCu3Df9HtTySJIbg-440&quot; target=3D&quot;utO5BPZsFb6q=
0V3ioqD--15&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry rel=
ative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCe=
ll&gt;&#xA;        &lt;mxCell id=3D&quot;utO5BPZsFb6q0V3ioqD--18&quot; styl=
e=3D&quot;edgeStyle=3DorthogonalEdgeStyle;orthogonalLoop=3D1;jettySize=3Dau=
to;html=3D1;entryX=3D0.5;entryY=3D1;entryDx=3D0;entryDy=3D0;exitX=3D0;exitY=
=3D0.5;exitDx=3D0;exitDy=3D0;curved=3D1;dashed=3D1;endArrow=3DclassicThin;e=
ndFill=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.go=
ogleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=3D&quot;1&quo=
t; source=3D&quot;eV5wDCu3Df9HtTySJIbg-440&quot; target=3D&quot;utO5BPZsFb6=
q0V3ioqD--17&quot; edge=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry re=
lative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxC=
ell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-440&quot; va=
lue=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.googleapis=
.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;sstate-cache&amp;lt;=
/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;fo=
ntFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%=
2Fcss%3Ffamily%3DLiberation%2BSans;fillStyle=3Dauto;glass=3D0;shadow=3D0;&q=
uot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mx=
Geometry x=3D&quot;176.5&quot; y=3D&quot;270&quot; width=3D&quot;103.01&quo=
t; height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;=
/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;eV5wDCu3Df9HtTySJIbg-442&quot=
; value=3D&quot;&amp;lt;font data-font-src=3D&amp;quot;https://fonts.google=
apis.com/css?family=3DArchitects+Daughter&amp;quot;&amp;gt;SSTATE_DIR&amp;l=
t;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;=
fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.co=
m%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#000000;strokeColor=3Dnone=
;fillStyle=3Dauto;glass=3D0;shadow=3D0;fontColor=3D#ffffff;fontStyle=3D1&qu=
ot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxG=
eometry x=3D&quot;243.98000000000002&quot; y=3D&quot;300&quot; width=3D&quo=
t;83.01&quot; height=3D&quot;25&quot; as=3D&quot;geometry&quot; /&gt;&#xA; =
       &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;utO5BPZsFb6q0V3ioq=
D--10&quot; value=3D&quot;sayhello&quot; style=3D&quot;rounded=3D1;whiteSpa=
ce=3Dwrap;html=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2F=
fonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;fillColor=3D#eeeeee=
;strokeColor=3D#36393d;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;=
&gt;&#xA;          &lt;mxGeometry x=3D&quot;1814.99&quot; y=3D&quot;1040&qu=
ot; width=3D&quot;90&quot; height=3D&quot;27.5&quot; as=3D&quot;geometry&qu=
ot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;utO=
5BPZsFb6q0V3ioqD--13&quot; style=3D&quot;edgeStyle=3DorthogonalEdgeStyle;or=
thogonalLoop=3D1;jettySize=3Dauto;html=3D1;entryX=3D0.149;entryY=3D-0.003;e=
ntryDx=3D0;entryDy=3D0;entryPerimeter=3D0;endArrow=3DclassicThin;endFill=3D=
1;curved=3D1;dashed=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%=
2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;&quot; parent=
=3D&quot;1&quot; source=3D&quot;eV5wDCu3Df9HtTySJIbg-308&quot; target=3D&qu=
ot;eV5wDCu3Df9HtTySJIbg-293&quot; edge=3D&quot;1&quot;&gt;&#xA;          &l=
t;mxGeometry relative=3D&quot;1&quot; as=3D&quot;geometry&quot; /&gt;&#xA; =
       &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;utO5BPZsFb6q0V3ioq=
D--15&quot; value=3D&quot;&amp;lt;span style=3D&amp;quot;font-size: 15px;&a=
mp;quot;&amp;gt;This folder contains cache for recipes build output, this i=
s used by BitBake, if the recipe checksum did not change it knows that the =
output to use is the same.&amp;lt;br&amp;gt;&amp;lt;/span&amp;gt;&quot; sty=
le=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;dashed=3D1;fontFamily=3DL=
iberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffami=
ly%3DLiberation%2BSans;arcSize=3D0;fillColor=3Dnone;&quot; parent=3D&quot;1=
&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;35=
0&quot; y=3D&quot;300&quot; width=3D&quot;410&quot; height=3D&quot;90&quot;=
 as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &l=
t;mxCell id=3D&quot;utO5BPZsFb6q0V3ioqD--17&quot; value=3D&quot;&amp;lt;spa=
n style=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;&amp;lt;font data-fon=
t-src=3D&amp;quot;https://fonts.googleapis.com/css?family=3DLiberation+Sans=
&amp;quot;&amp;gt;These directories can be shared accross builds to save di=
sk space and build time&amp;lt;/font&amp;gt;&amp;lt;br&amp;gt;&amp;lt;/span=
&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;dashed=
=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleap=
is.com%2Fcss%3Ffamily%3DLiberation%2BSans;arcSize=3D0;fillColor=3Dnone;&quo=
t; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGe=
ometry x=3D&quot;-68.25&quot; y=3D&quot;180&quot; width=3D&quot;410&quot; h=
eight=3D&quot;45&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxC=
ell&gt;&#xA;        &lt;mxCell id=3D&quot;utO5BPZsFb6q0V3ioqD--20&quot; val=
ue=3D&quot;&amp;lt;font style=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt=
;This directory contains other output directories such as &amp;lt;b&amp;gt;=
&amp;lt;u&amp;gt;images&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt;, &amp;lt;b&amp;=
gt;&amp;lt;u&amp;gt;sdk&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt; and &amp;lt;b&a=
mp;gt;&amp;lt;u&amp;gt;licenses&amp;lt;/u&amp;gt;&amp;lt;/b&amp;gt;&amp;lt;=
br&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=
=3Dwrap;html=3D1;dashed=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps=
%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;arcSize=3D=
0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &l=
t;mxGeometry x=3D&quot;1525&quot; y=3D&quot;267.5&quot; width=3D&quot;416.8=
8&quot; height=3D&quot;45&quot; as=3D&quot;geometry&quot; /&gt;&#xA;       =
 &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;utO5BPZsFb6q0V3ioqD--22&=
quot; value=3D&quot;&amp;lt;font style=3D&amp;quot;font-size: 15px;&amp;quo=
t;&amp;gt;This file contains all &amp;lt;b&amp;gt;layers&amp;lt;/b&amp;gt; =
that BitBake should consider when looking for metadata.&amp;lt;br&amp;gt;&a=
mp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;html=
=3D1;dashed=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffon=
ts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;arcSize=3D0;fillColor=
=3Dnone;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;      =
    &lt;mxGeometry x=3D&quot;1060&quot; y=3D&quot;435&quot; width=3D&quot;1=
70&quot; height=3D&quot;130&quot; as=3D&quot;geometry&quot; /&gt;&#xA;     =
   &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;utO5BPZsFb6q0V3ioqD--2=
5&quot; value=3D&quot;&amp;lt;font style=3D&amp;quot;font-size: 15px;&amp;q=
uot;&amp;gt;This is base configuration file containing essential user confi=
g such as &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;MACHINE&amp;lt;/u&amp;gt;&amp;l=
t;/b&amp;gt; and &amp;lt;b&amp;gt;&amp;lt;u&amp;gt;DISTRO&amp;lt;/u&amp;gt;=
&amp;lt;/b&amp;gt;&amp;lt;br&amp;gt;&amp;lt;/font&amp;gt;&quot; style=3D&qu=
ot;rounded=3D1;whiteSpace=3Dwrap;html=3D1;dashed=3D1;fontFamily=3DLiberatio=
n Sans;fontSource=3Dhttps%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DLib=
eration%2BSans;arcSize=3D0;fillColor=3Dnone;&quot; parent=3D&quot;1&quot; v=
ertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;932&quot; =
y=3D&quot;185&quot; width=3D&quot;440&quot; height=3D&quot;40&quot; as=3D&q=
uot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell=
 id=3D&quot;utO5BPZsFb6q0V3ioqD--27&quot; value=3D&quot;&amp;lt;font style=
=3D&amp;quot;font-size: 15px;&amp;quot;&amp;gt;The message to show after &a=
mp;lt;b&amp;gt;source oe-init-build-env&amp;lt;/b&amp;gt;&amp;lt;br&amp;gt;=
&amp;lt;/font&amp;gt;&quot; style=3D&quot;rounded=3D1;whiteSpace=3Dwrap;htm=
l=3D1;dashed=3D1;fontFamily=3DLiberation Sans;fontSource=3Dhttps%3A%2F%2Ffo=
nts.googleapis.com%2Fcss%3Ffamily%3DLiberation%2BSans;arcSize=3D0;fillColor=
=3Dnone;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;      =
    &lt;mxGeometry x=3D&quot;1118&quot; y=3D&quot;260&quot; width=3D&quot;2=
41.13&quot; height=3D&quot;40&quot; as=3D&quot;geometry&quot; /&gt;&#xA;   =
     &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;IR5jgyizBFApjn6Bth0e=
-1&quot; value=3D&quot;&quot; style=3D&quot;rounded=3D0;whiteSpace=3Dwrap;h=
tml=3D1;fillColor=3Dnone;strokeWidth=3D1;glass=3D0;&quot; parent=3D&quot;1&=
quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;232=
0&quot; y=3D&quot;780&quot; width=3D&quot;30&quot; height=3D&quot;20&quot; =
as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt=
;mxCell id=3D&quot;IR5jgyizBFApjn6Bth0e-2&quot; value=3D&quot;&quot; style=
=3D&quot;rounded=3D0;whiteSpace=3Dwrap;html=3D1;fillColor=3Dnone;strokeWidt=
h=3D1;glass=3D0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#x=
A;          &lt;mxGeometry x=3D&quot;2170&quot; y=3D&quot;946.25&quot; widt=
h=3D&quot;20&quot; height=3D&quot;20&quot; as=3D&quot;geometry&quot; /&gt;&=
#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;IR5jgyizBFApj=
n6Bth0e-3&quot; value=3D&quot;&quot; style=3D&quot;rounded=3D0;whiteSpace=
=3Dwrap;html=3D1;fillColor=3Dnone;strokeWidth=3D1;glass=3D0;&quot; parent=
=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeometry x=
=3D&quot;2070&quot; y=3D&quot;1105&quot; width=3D&quot;25&quot; height=3D&q=
uot;20&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCell&gt;&#x=
A;        &lt;mxCell id=3D&quot;IR5jgyizBFApjn6Bth0e-4&quot; value=3D&quot;=
&quot; style=3D&quot;rounded=3D0;whiteSpace=3Dwrap;html=3D1;fillColor=3Dnon=
e;strokeWidth=3D1;glass=3D0;&quot; parent=3D&quot;1&quot; vertex=3D&quot;1&=
quot;&gt;&#xA;          &lt;mxGeometry x=3D&quot;2090&quot; y=3D&quot;730&q=
uot; width=3D&quot;20&quot; height=3D&quot;20&quot; as=3D&quot;geometry&quo=
t; /&gt;&#xA;        &lt;/mxCell&gt;&#xA;        &lt;mxCell id=3D&quot;IR5j=
gyizBFApjn6Bth0e-5&quot; value=3D&quot;&quot; style=3D&quot;rounded=3D0;whi=
teSpace=3Dwrap;html=3D1;fillColor=3Dnone;strokeWidth=3D1;glass=3D0;&quot; p=
arent=3D&quot;1&quot; vertex=3D&quot;1&quot;&gt;&#xA;          &lt;mxGeomet=
ry x=3D&quot;1446.5&quot; y=3D&quot;361.25&quot; width=3D&quot;20&quot; hei=
ght=3D&quot;20&quot; as=3D&quot;geometry&quot; /&gt;&#xA;        &lt;/mxCel=
l&gt;&#xA;      &lt;/root&gt;&#xA;    &lt;/mxGraphModel&gt;&#xA;  &lt;/diag=
ram&gt;&#xA;&lt;/mxfile&gt;&#xA;"><defs/><g><g data-cell-id=3D"0"><g data-c=
ell-id=3D"1"><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-398"><g><rect x=3D"235=
7" y=3D"660" width=3D"280" height=3D"150" rx=3D"22.5" ry=3D"22.5" fill=3D"n=
one" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, =
255, 255));" stroke-dasharray=3D"3 3" pointer-events=3D"all"/></g></g><g da=
ta-cell-id=3D"eV5wDCu3Df9HtTySJIbg-383"><g><path d=3D"M 2217 780 Q 2163.7 7=
80 2163.68 495.12" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-=
dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" stroke-da=
sharray=3D"3 3" pointer-events=3D"stroke"/><path d=3D"M 2163.68 489.87 L 21=
66.02 496.87 L 2163.68 495.12 L 2161.35 496.87 Z" fill=3D"#000000" style=3D=
"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb=
(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10=
" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-4=
07"><g><path d=3D"M 2307 900 Q 2307 940 2402 940 Q 2497 940 2497 820.1" fil=
l=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb=
(237, 237, 237));" stroke-width=3D"3" stroke-miterlimit=3D"10" pointer-even=
ts=3D"stroke"/><path d=3D"M 2497 813.35 L 2501.5 822.35 L 2497 820.1 L 2492=
.5 822.35 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(2=
37, 237, 237)); stroke: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stro=
ke=3D"#000000" stroke-width=3D"3" stroke-miterlimit=3D"10" pointer-events=
=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-380"><g><rect x=
=3D"2217" y=3D"660" width=3D"120" height=3D"240" rx=3D"18" ry=3D"18" fill=
=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(=
255, 255, 255));" stroke-dasharray=3D"3 3" pointer-events=3D"all"/></g></g>=
<g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-211"><g><rect x=3D"717" y=3D"660" w=
idth=3D"270" height=3D"240" rx=3D"36" ry=3D"36" fill=3D"none" stroke=3D"#00=
0000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" strok=
e-dasharray=3D"3 3" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5w=
DCu3Df9HtTySJIbg-142"><g><rect x=3D"270.5" y=3D"210" width=3D"270" height=
=3D"110" rx=3D"16.5" ry=3D"16.5" fill=3D"none" stroke=3D"#000000" style=3D"=
stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-dasharray=3D"=
3 3" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIb=
g-162"><g><rect x=3D"537" y=3D"660" width=3D"140" height=3D"240" rx=3D"21" =
ry=3D"21" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(=
0, 0, 0), rgb(255, 255, 255));" stroke-dasharray=3D"3 3" pointer-events=3D"=
all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-101"><g><path d=3D"M =
1232 40 L 1232 90" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-=
dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-e=
vents=3D"stroke"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-338"><g><=
path d=3D"M 1232 40 L 1232 50 Q 1232 60 1222 60 L 415.5 60 Q 405.5 60 405.5=
 70 L 405.5 83.63" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-=
dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-e=
vents=3D"stroke"/><path d=3D"M 405.5 88.88 L 402 81.88 L 405.5 83.63 L 409 =
81.88 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, =
255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=
=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g da=
ta-cell-id=3D"eV5wDCu3Df9HtTySJIbg-344"><g><path d=3D"M 1232 40 L 1232 50 Q=
 1232 60 1242 60 L 1452 60 Q 1462 60 1462 70 L 1462 83.63" fill=3D"none" st=
roke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 25=
5));" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 1462=
 88.88 L 1458.5 81.88 L 1462 83.63 L 1465.5 81.88 Z" fill=3D"#000000" style=
=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(=
rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D=
"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIb=
g-402"><g><path d=3D"M 1232 40 L 1232 50 Q 1232 60 1242 60 L 1818.5 60 Q 18=
28.5 60 1828.5 70 L 1828.5 83.63" fill=3D"none" stroke=3D"#000000" style=3D=
"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=
=3D"10" pointer-events=3D"stroke"/><path d=3D"M 1828.5 88.88 L 1825 81.88 L=
 1828.5 83.63 L 1832 81.88 Z" fill=3D"#000000" style=3D"fill: light-dark(rg=
b(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, =
255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"=
all"/></g></g><g data-cell-id=3D"utO5BPZsFb6q0V3ioqD--12"><g><path d=3D"M 1=
232 40 L 1232 50 Q 1232 60 1222 60 L 655 60 Q 645 60 645 70 L 645 83.63" fi=
ll=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rg=
b(255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><pa=
th d=3D"M 645 88.88 L 641.5 81.88 L 645 83.63 L 648.5 81.88 Z" fill=3D"#000=
000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: l=
ight-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-mit=
erlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3D=
f9HtTySJIbg-98"><g><rect x=3D"1197" y=3D"0" width=3D"70" height=3D"40" rx=
=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--g=
e-dark-color, #121212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255=
));" stroke=3D"#000000" pointer-events=3D"all"/></g><g><g transform=3D"tran=
slate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-a=
lign: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" require=
dFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsa=
fe center; justify-content: unsafe center; width: 68px; height: 1px; paddin=
g-top: 20px; margin-left: 1198px;"><div style=3D"box-sizing: border-box; fo=
nt-size: 0; text-align: center; color: #000000; "><div style=3D"display: in=
line-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; colo=
r: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; whi=
te-space: normal; word-wrap: normal; "><font data-font-src=3D"https://fonts=
.googleapis.com/css?family=3DArchitects+Daughter">tmp</font></div></div></d=
iv></foreignObject><text x=3D"1232" y=3D"24" fill=3D"light-dark(#000000, #f=
fffff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text=
-anchor=3D"middle">tmp</text></switch></g></g></g><g data-cell-id=3D"eV5wDC=
u3Df9HtTySJIbg-102"><g><path d=3D"M 1232 130 L 1232 260" fill=3D"none" stro=
ke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)=
);" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/></g></g><g data-cel=
l-id=3D"eV5wDCu3Df9HtTySJIbg-99"><g><rect x=3D"1197" y=3D"90" width=3D"70" =
height=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-dark(=
#ffffff, var(--ge-dark-color, #121212)); stroke: light-dark(rgb(0, 0, 0), r=
gb(255, 255, 255));" stroke=3D"#000000" pointer-events=3D"all"/></g><g><g t=
ransform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow:=
 visible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=
=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibil=
ity"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; al=
ign-items: unsafe center; justify-content: unsafe center; width: 68px; heig=
ht: 1px; padding-top: 110px; margin-left: 1198px;"><div style=3D"box-sizing=
: border-box; font-size: 0; text-align: center; color: #000000; "><div styl=
e=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation =
Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; pointer-=
events: all; white-space: normal; word-wrap: normal; "><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">work</fo=
nt></div></div></div></foreignObject><text x=3D"1232" y=3D"114" fill=3D"lig=
ht-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font=
-size=3D"12px" text-anchor=3D"middle">work</text></switch></g></g></g><g da=
ta-cell-id=3D"eV5wDCu3Df9HtTySJIbg-106"><g><path d=3D"M 1232 300 L 1232 310=
 Q 1232 320 1242 320 L 1412 320 Q 1422 320 1422 330 L 1422 340" fill=3D"non=
e" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 25=
5, 255));" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/></g></g><g d=
ata-cell-id=3D"eV5wDCu3Df9HtTySJIbg-155"><g><path d=3D"M 1232 300 L 1232 31=
0 Q 1232 320 1222 320 L 789 320 Q 779 320 779 330 L 778.99 340" fill=3D"non=
e" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 25=
5, 255));" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/></g></g><g d=
ata-cell-id=3D"utO5BPZsFb6q0V3ioqD--14"><g><path d=3D"M 1147 280 Q 1099.6 2=
80 1099.56 333.63" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-=
dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" stroke-da=
sharray=3D"3 3" pointer-events=3D"stroke"/><path d=3D"M 1099.56 338.88 L 10=
97.23 331.88 L 1099.56 333.63 L 1101.9 331.88 Z" fill=3D"#000000" style=3D"=
fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(=
0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10"=
 pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-10=
0"><g><rect x=3D"1147" y=3D"260" width=3D"170" height=3D"40" rx=3D"6" ry=3D=
"6" fill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color=
, #121212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=
=3D"#000000" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 =
-0.5)"><switch><foreignObject style=3D"overflow: visible; text-align: left;=
" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=
=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://=
www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; =
justify-content: unsafe center; width: 168px; height: 1px; padding-top: 280=
px; margin-left: 1148px;"><div style=3D"box-sizing: border-box; font-size: =
0; text-align: center; color: #000000; "><div style=3D"display: inline-bloc=
k; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: light-=
dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-space:=
 normal; word-wrap: normal; "><font data-font-src=3D"https://fonts.googleap=
is.com/css?family=3DArchitects+Daughter"><b>${MULTIMACH_TARGET_OS}</b></fon=
t></div></div></div></foreignObject><text x=3D"1232" y=3D"284" fill=3D"ligh=
t-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-=
size=3D"12px" text-anchor=3D"middle">${MULTIMACH_TARGET_OS}</text></switch>=
</g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-110"><g><path d=3D"M 77=
8.99 380 L 779 420" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light=
-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-=
events=3D"stroke"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-103"><g>=
<rect x=3D"743.99" y=3D"340" width=3D"70" height=3D"40" rx=3D"6" ry=3D"6" f=
ill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #12=
1212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#0=
00000" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"=
><switch><foreignObject style=3D"overflow: visible; text-align: left;" poin=
ter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http=
://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.o=
rg/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-=
content: unsafe center; width: 68px; height: 1px; padding-top: 360px; margi=
n-left: 745px;"><div style=3D"box-sizing: border-box; font-size: 0; text-al=
ign: center; color: #000000; "><div style=3D"display: inline-block; font-si=
ze: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#0000=
00, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal; w=
ord-wrap: normal; "><font data-font-src=3D"https://fonts.googleapis.com/css=
?family=3DArchitects+Daughter">libhello</font></div></div></div></foreignOb=
ject><text x=3D"779" y=3D"364" fill=3D"light-dark(#000000, #ffffff)" font-f=
amily=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"mid=
dle">libhello</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTy=
SJIbg-111"><g><path d=3D"M 1422 380 L 1422 390 Q 1422 400 1422 392.5 L 1422=
 388.75 Q 1422 385 1422 395 L 1422 405" fill=3D"none" stroke=3D"#000000" st=
yle=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterl=
imit=3D"10" pointer-events=3D"stroke"/></g></g><g data-cell-id=3D"eV5wDCu3D=
f9HtTySJIbg-105"><g><rect x=3D"1387" y=3D"340" width=3D"70" height=3D"40" r=
x=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--=
ge-dark-color, #121212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 25=
5));" stroke=3D"#000000" pointer-events=3D"all"/></g><g><g transform=3D"tra=
nslate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-=
align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requir=
edFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsa=
fe center; justify-content: unsafe center; width: 68px; height: 1px; paddin=
g-top: 360px; margin-left: 1388px;"><div style=3D"box-sizing: border-box; f=
ont-size: 0; text-align: center; color: #000000; "><div style=3D"display: i=
nline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; col=
or: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; wh=
ite-space: normal; word-wrap: normal; "><font data-font-src=3D"https://font=
s.googleapis.com/css?family=3DArchitects+Daughter">sayhello</font></div></d=
iv></div></foreignObject><text x=3D"1422" y=3D"364" fill=3D"light-dark(#000=
000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12p=
x" text-anchor=3D"middle">sayhello</text></switch></g></g></g><g data-cell-=
id=3D"eV5wDCu3Df9HtTySJIbg-169"><g><path d=3D"M 779 460 L 779 490 Q 779 500=
 769 500 L 509 500 Q 499 500 499 510 L 499 533.63" fill=3D"none" stroke=3D"=
#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" st=
roke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 499 538.88 L=
 496.67 531.88 L 499 533.63 L 501.33 531.88 Z" fill=3D"#000000" style=3D"fi=
ll: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0,=
 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" p=
ointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-170"=
><g><path d=3D"M 779 460 L 779 490 Q 779 500 769 500 L 617 500 Q 607 500 60=
7 510 L 607 547.5 Q 607 557.5 606.43 557.5 L 605.87 557.5" fill=3D"none" st=
roke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 25=
5));" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 600.=
62 557.5 L 607.62 555.17 L 605.87 557.5 L 607.62 559.83 Z" fill=3D"#000000"=
 style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light=
-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterli=
mit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9Ht=
TySJIbg-179"><g><path d=3D"M 779 460 L 778.99 533.63" fill=3D"none" stroke=
=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));=
" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 778.99 5=
38.88 L 775.49 531.88 L 778.99 533.63 L 782.49 531.88 Z" fill=3D"#000000" s=
tyle=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-d=
ark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimi=
t=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTy=
SJIbg-197"><g><path d=3D"M 779 460 L 779 490 Q 779 500 789 500 L 1067 500 Q=
 1077 500 1077 510 L 1077 533.63" fill=3D"none" stroke=3D"#000000" style=3D=
"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=
=3D"10" pointer-events=3D"stroke"/><path d=3D"M 1077 538.88 L 1073.5 531.88=
 L 1077 533.63 L 1080.5 531.88 Z" fill=3D"#000000" style=3D"fill: light-dar=
k(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(2=
55, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=
=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-108"><g><rect x=
=3D"744" y=3D"420" width=3D"70" height=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ff=
ffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #121212)); st=
roke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" poi=
nter-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><=
foreignObject style=3D"overflow: visible; text-align: left;" pointer-events=
=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.=
org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xh=
tml" style=3D"display: flex; align-items: unsafe center; justify-content: u=
nsafe center; width: 68px; height: 1px; padding-top: 440px; margin-left: 74=
5px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: cente=
r; color: #000000; "><div style=3D"display: inline-block; font-size: 12px; =
font-family: &quot;Liberation Sans&quot;; color: light-dark(#000000, #fffff=
f); line-height: 1.2; pointer-events: all; white-space: normal; word-wrap: =
normal; "><font data-font-src=3D"https://fonts.googleapis.com/css?family=3D=
Architects+Daughter">0.1-r0</font></div></div></div></foreignObject><text x=
=3D"779" y=3D"444" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&qu=
ot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">0.1-r0<=
/text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-309"><g>=
<path d=3D"M 1422 445 L 1422 490 Q 1422 500 1412 500 L 1392 500 Q 1382 500 =
1382 510 L 1382 533.63" fill=3D"none" stroke=3D"#000000" style=3D"stroke: l=
ight-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" poin=
ter-events=3D"stroke"/><path d=3D"M 1382 538.88 L 1378.5 531.88 L 1382 533.=
63 L 1385.5 531.88 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, =
0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255=
));" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></=
g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-311"><g><path d=3D"M 1422 445=
 L 1422 490 Q 1422 500 1432 500 L 1746.5 500 Q 1756.5 500 1756.5 510 L 1756=
.5 533.63" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb=
(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=3D=
"stroke"/><path d=3D"M 1756.5 538.88 L 1753 531.88 L 1756.5 533.63 L 1760 5=
31.88 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, =
255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=
=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g da=
ta-cell-id=3D"eV5wDCu3Df9HtTySJIbg-312"><g><path d=3D"M 1422 445 L 1422 490=
 Q 1422 500 1432 500 L 1919 500 Q 1929 500 1929 510 L 1928.99 533.63" fill=
=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(=
255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path=
 d=3D"M 1928.99 538.88 L 1925.49 531.88 L 1928.99 533.63 L 1932.49 531.88 Z=
" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 25=
5)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#0000=
00" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-i=
d=3D"eV5wDCu3Df9HtTySJIbg-360"><g><path d=3D"M 1422 445 L 1422 490 Q 1422 5=
00 1432 500 L 2078.5 500 Q 2088.5 500 2088.5 510 L 2088.5 533.63" fill=3D"n=
one" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, =
255, 255));" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D=
"M 2088.5 538.88 L 2085 531.88 L 2088.5 533.63 L 2092 531.88 Z" fill=3D"#00=
0000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: =
light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-mi=
terlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3=
Df9HtTySJIbg-368"><g><path d=3D"M 1422 445 L 1422 490 Q 1422 500 1432 500 L=
 2267 500 Q 2277 500 2277 510 L 2277 533.63" fill=3D"none" stroke=3D"#00000=
0" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-m=
iterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 2277 538.88 L 2273=
.5 531.88 L 2277 533.63 L 2280.5 531.88 Z" fill=3D"#000000" style=3D"fill: =
light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, =
0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" point=
er-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-388"><g>=
<path d=3D"M 1422 445 L 1422 490 Q 1422 500 1432 500 L 2487 500 Q 2497 500 =
2497 510 L 2497 533.63" fill=3D"none" stroke=3D"#000000" style=3D"stroke: l=
ight-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" poin=
ter-events=3D"stroke"/><path d=3D"M 2497 538.88 L 2493.5 531.88 L 2497 533.=
63 L 2500.5 531.88 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, =
0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255=
));" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></=
g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-109"><g><rect x=3D"1387" y=3D=
"405" width=3D"70" height=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=
=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #121212)); stroke: light=
-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" pointer-events=
=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObje=
ct style=3D"overflow: visible; text-align: left;" pointer-events=3D"none" w=
idth=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG1=
1/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 68px; height: 1px; padding-top: 425px; margin-left: 1388px;"><di=
v style=3D"box-sizing: border-box; font-size: 0; text-align: center; color:=
 #000000; "><div style=3D"display: inline-block; font-size: 12px; font-fami=
ly: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-=
height: 1.2; pointer-events: all; white-space: normal; word-wrap: normal; "=
><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitect=
s+Daughter">0.1-r0</font></div></div></div></foreignObject><text x=3D"1422"=
 y=3D"429" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liber=
ation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">0.1-r0</text></=
switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-134"><g><path d=
=3D"M 405.5 130 L 405.5 140 Q 405.5 150 405.5 140 L 405.5 135 Q 405.5 130 4=
05.5 140 L 405.5 150" fill=3D"none" stroke=3D"#000000" style=3D"stroke: lig=
ht-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointe=
r-events=3D"stroke"/></g></g><g data-cell-id=3D"utO5BPZsFb6q0V3ioqD--19"><g=
><path d=3D"M 440.5 110 Q 553.8 110 553.75 51.37" fill=3D"none" stroke=3D"#=
000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" str=
oke-miterlimit=3D"10" stroke-dasharray=3D"3 3" pointer-events=3D"stroke"/><=
path d=3D"M 553.75 46.12 L 556.09 53.12 L 553.75 51.37 L 551.42 53.12 Z" fi=
ll=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));=
 stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" =
stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D=
"eV5wDCu3Df9HtTySJIbg-130"><g><rect x=3D"370.5" y=3D"90" width=3D"70" heigh=
t=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-dark(#ffff=
ff, var(--ge-dark-color, #121212)); stroke: light-dark(rgb(0, 0, 0), rgb(25=
5, 255, 255));" stroke=3D"#000000" pointer-events=3D"all"/></g><g><g transf=
orm=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visi=
ble; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"10=
0%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><=
div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-it=
ems: unsafe center; justify-content: unsafe center; width: 68px; height: 1p=
x; padding-top: 110px; margin-left: 372px;"><div style=3D"box-sizing: borde=
r-box; font-size: 0; text-align: center; color: #000000; "><div style=3D"di=
splay: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&qu=
ot;; color: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events:=
 all; white-space: normal; word-wrap: normal; "><font data-font-src=3D"http=
s://fonts.googleapis.com/css?family=3DArchitects+Daughter">downloads</font>=
</div></div></div></foreignObject><text x=3D"406" y=3D"114" fill=3D"light-d=
ark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-siz=
e=3D"12px" text-anchor=3D"middle">downloads</text></switch></g></g></g><g d=
ata-cell-id=3D"eV5wDCu3Df9HtTySJIbg-143"><g><path d=3D"M 405.5 190 L 405.5 =
200 Q 405.5 210 405.5 200 L 405.5 195 Q 405.5 190 405.5 200 L 405.5 210" fi=
ll=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rg=
b(255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/></g=
></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-133"><g><rect x=3D"370.5" y=3D=
"150" width=3D"70" height=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=
=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #121212)); stroke: light=
-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" pointer-events=
=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObje=
ct style=3D"overflow: visible; text-align: left;" pointer-events=3D"none" w=
idth=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG1=
1/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 68px; height: 1px; padding-top: 170px; margin-left: 372px;"><div=
 style=3D"box-sizing: border-box; font-size: 0; text-align: center; color: =
#000000; "><div style=3D"display: inline-block; font-size: 12px; font-famil=
y: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-h=
eight: 1.2; pointer-events: all; white-space: normal; word-wrap: normal; ">=
<font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects=
+Daughter">git2</font></div></div></div></foreignObject><text x=3D"406" y=
=3D"174" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberat=
ion Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">git2</text></swit=
ch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-223"><g><path d=3D"M=
 520.5 290 L 657 290 Q 667 290 667 300 L 667 567.5 Q 667 577.5 657 577.5 L =
642.1 577.5" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(r=
gb(0, 0, 0), rgb(237, 237, 237));" stroke-width=3D"3" stroke-miterlimit=3D"=
10" pointer-events=3D"stroke"/><path d=3D"M 635.35 577.5 L 644.35 573 L 642=
.1 577.5 L 644.35 582 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, =
0, 0), rgb(237, 237, 237)); stroke: light-dark(rgb(0, 0, 0), rgb(237, 237, =
237));" stroke=3D"#000000" stroke-width=3D"3" stroke-miterlimit=3D"10" poin=
ter-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-135"><g=
><rect x=3D"290.5" y=3D"220" width=3D"230" height=3D"40" rx=3D"6" ry=3D"6" =
fill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 238), rgb(32, 32, =
32)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192));" stroke=3D"#=
36393d" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)=
"><switch><foreignObject style=3D"overflow: visible; text-align: left;" poi=
nter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"htt=
p://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.=
org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify=
-content: unsafe center; width: 228px; height: 1px; padding-top: 240px; mar=
gin-left: 292px;"><div style=3D"box-sizing: border-box; font-size: 0; text-=
align: center; color: #000000; "><div style=3D"display: inline-block; font-=
size: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#00=
0000, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal;=
 word-wrap: normal; ">github.com.&lt;username&gt;.sayhello</div></div></div=
></foreignObject><text x=3D"406" y=3D"244" fill=3D"light-dark(#000000, #fff=
fff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-a=
nchor=3D"middle">github.com.&lt;username&gt;.sayhello</text></switch></g></=
g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-337"><g><path d=3D"M 520.5 24=
0 L 1657 240 Q 1667 240 1667 250 L 1667 550 Q 1667 560 1677 560 L 1713.9 56=
0" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0=
), rgb(237, 237, 237));" stroke-width=3D"3" stroke-miterlimit=3D"10" pointe=
r-events=3D"stroke"/><path d=3D"M 1720.65 560 L 1711.65 564.5 L 1713.9 560 =
L 1711.65 555.5 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0),=
 rgb(237, 237, 237)); stroke: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));=
" stroke=3D"#000000" stroke-width=3D"3" stroke-miterlimit=3D"10" pointer-ev=
ents=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-136"><g><rect=
 x=3D"290.5" y=3D"270" width=3D"230" height=3D"40" rx=3D"6" ry=3D"6" fill=
=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 238), rgb(32, 32, 32))=
; stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192));" stroke=3D"#3639=
3d" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><s=
witch><foreignObject style=3D"overflow: visible; text-align: left;" pointer=
-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://=
www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-con=
tent: unsafe center; width: 228px; height: 1px; padding-top: 290px; margin-=
left: 292px;"><div style=3D"box-sizing: border-box; font-size: 0; text-alig=
n: center; color: #000000; "><div style=3D"display: inline-block; font-size=
: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#000000=
, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal; wor=
d-wrap: normal; ">github.com.&lt;username&gt;.libhello</div></div></div></f=
oreignObject><text x=3D"406" y=3D"294" fill=3D"light-dark(#000000, #ffffff)=
" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-ancho=
r=3D"middle">github.com.&lt;username&gt;.libhello</text></switch></g></g></=
g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-164"><g><path d=3D"M 599.5 597.5 =
Q 599.5 628.8 603.25 628.8 Q 607 628.8 607 653.63" fill=3D"none" stroke=3D"=
#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" st=
roke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 607 658.88 L=
 603.5 651.88 L 607 653.63 L 610.5 651.88 Z" fill=3D"#000000" style=3D"fill=
: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0=
, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" poi=
nter-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-156"><=
g><rect x=3D"567" y=3D"557.5" width=3D"65" height=3D"40" rx=3D"6" ry=3D"6" =
fill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #1=
21212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#=
000000" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)=
"><switch><foreignObject style=3D"overflow: visible; text-align: left;" poi=
nter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"htt=
p://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.=
org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify=
-content: unsafe center; width: 63px; height: 1px; padding-top: 578px; marg=
in-left: 568px;"><div style=3D"box-sizing: border-box; font-size: 0; text-a=
lign: center; color: #000000; "><div style=3D"display: inline-block; font-s=
ize: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#000=
000, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal; =
word-wrap: normal; ">sources/libhello-0.1</div></div></div></foreignObject>=
<text x=3D"600" y=3D"581" fill=3D"light-dark(#000000, #ffffff)" font-family=
=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">=
sources/lib...</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtT=
ySJIbg-159"><g><rect x=3D"553" y=3D"680" width=3D"114" height=3D"20" rx=3D"=
3" ry=3D"3" fill=3D"#f5f5f5" style=3D"fill: light-dark(rgb(245, 245, 245), =
rgb(26, 26, 26)); stroke: light-dark(rgb(102, 102, 102), rgb(149, 149, 149)=
);" stroke=3D"#666666" pointer-events=3D"all"/></g><g><g transform=3D"trans=
late(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-al=
ign: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" required=
Features=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D=
"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe =
center; justify-content: unsafe center; width: 112px; height: 1px; padding-=
top: 690px; margin-left: 554px;"><div style=3D"box-sizing: border-box; font=
-size: 0; text-align: center; color: #333333; "><div style=3D"display: inli=
ne-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color:=
 light-dark(#333333, #c1c1c1); line-height: 1.2; pointer-events: all; white=
-space: normal; word-wrap: normal; ">Makefile</div></div></div></foreignObj=
ect><text x=3D"610" y=3D"694" fill=3D"#333333" font-family=3D"&quot;Liberat=
ion Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">Makefile</text></=
switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-433"><g><path d=
=3D"M 553 720 L 529.2 720 Q 519.2 720 519.2 710 L 519.2 678.8 Q 519.2 668.8=
 509.2 668.79 L 491.62 668.76" fill=3D"none" stroke=3D"#000000" style=3D"st=
roke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"1=
0" stroke-dasharray=3D"3 3" pointer-events=3D"stroke"/><path d=3D"M 486.37 =
668.75 L 493.37 666.43 L 491.62 668.76 L 493.36 671.1 Z" fill=3D"#000000" s=
tyle=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-d=
ark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimi=
t=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTy=
SJIbg-160"><g><rect x=3D"553" y=3D"710" width=3D"114" height=3D"20" rx=3D"3=
" ry=3D"3" fill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 238), r=
gb(32, 32, 32)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192));" =
stroke=3D"#36393d" pointer-events=3D"all"/></g><g><g transform=3D"translate=
(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-align:=
 left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeat=
ures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"htt=
p://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe cent=
er; justify-content: unsafe center; width: 112px; height: 1px; padding-top:=
 720px; margin-left: 554px;"><div style=3D"box-sizing: border-box; font-siz=
e: 0; text-align: center; color: #000000; "><div style=3D"display: inline-b=
lock; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: lig=
ht-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-spa=
ce: normal; word-wrap: normal; ">LICENSE</div></div></div></foreignObject><=
text x=3D"610" y=3D"724" fill=3D"light-dark(#000000, #ffffff)" font-family=
=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">=
LICENSE</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-=
215"><g><path d=3D"M 553 750 Q 507 750 507 765 Q 507 780 542.9 780" fill=3D=
"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(237=
, 237, 237));" stroke-width=3D"3" stroke-miterlimit=3D"10" pointer-events=
=3D"stroke"/><path d=3D"M 549.65 780 L 540.65 783 L 542.9 780 L 540.65 777 =
Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 2=
37)); stroke: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"#000=
000" stroke-width=3D"3" stroke-miterlimit=3D"10" pointer-events=3D"all"/></=
g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-161"><g><rect x=3D"553" y=3D"=
740" width=3D"114" height=3D"20" rx=3D"3" ry=3D"3" fill=3D"#f5f5f5" style=
=3D"fill: light-dark(rgb(245, 245, 245), rgb(26, 26, 26)); stroke: light-da=
rk(rgb(102, 102, 102), rgb(149, 149, 149));" stroke=3D"#666666" pointer-eve=
nts=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignO=
bject style=3D"overflow: visible; text-align: left;" pointer-events=3D"none=
" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/S=
VG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" sty=
le=3D"display: flex; align-items: unsafe center; justify-content: unsafe ce=
nter; width: 112px; height: 1px; padding-top: 750px; margin-left: 554px;"><=
div style=3D"box-sizing: border-box; font-size: 0; text-align: center; colo=
r: #333333; "><div style=3D"display: inline-block; font-size: 12px; font-fa=
mily: &quot;Liberation Sans&quot;; color: light-dark(#333333, #c1c1c1); lin=
e-height: 1.2; pointer-events: all; white-space: normal; word-wrap: normal;=
 ">fix.patch</div></div></div></foreignObject><text x=3D"610" y=3D"754" fil=
l=3D"#333333" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px=
" text-anchor=3D"middle">fix.patch</text></switch></g></g></g><g data-cell-=
id=3D"eV5wDCu3Df9HtTySJIbg-219"><g><path d=3D"M 553.68 787.86 Q 497 787.9 4=
97 819.6 Q 497 851.3 544.9 851.26" fill=3D"none" stroke=3D"#000000" style=
=3D"stroke: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke-width=3D"=
3" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 551.65 =
851.25 L 542.65 855.76 L 544.9 851.26 L 542.64 846.76 Z" fill=3D"#000000" s=
tyle=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: light-d=
ark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"#000000" stroke-width=3D"=
3" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=
=3D"eV5wDCu3Df9HtTySJIbg-163"><g><rect x=3D"553" y=3D"770" width=3D"114" he=
ight=3D"20" rx=3D"3" ry=3D"3" fill=3D"#f5f5f5" style=3D"fill: light-dark(rg=
b(245, 245, 245), rgb(26, 26, 26)); stroke: light-dark(rgb(102, 102, 102), =
rgb(149, 149, 149));" stroke=3D"#666666" pointer-events=3D"all"/></g><g><g =
transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow=
: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=
=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibil=
ity"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; al=
ign-items: unsafe center; justify-content: unsafe center; width: 112px; hei=
ght: 1px; padding-top: 780px; margin-left: 554px;"><div style=3D"box-sizing=
: border-box; font-size: 0; text-align: center; color: #333333; "><div styl=
e=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation =
Sans&quot;; color: light-dark(#333333, #c1c1c1); line-height: 1.2; pointer-=
events: all; white-space: normal; word-wrap: normal; ">hellolib.c</div></di=
v></div></foreignObject><text x=3D"610" y=3D"784" fill=3D"#333333" font-fam=
ily=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middl=
e">hellolib.c</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTy=
SJIbg-166"><g><rect x=3D"474" y=3D"540" width=3D"50" height=3D"40" rx=3D"6"=
 ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark=
-color, #121212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" s=
troke=3D"#000000" pointer-events=3D"all"/></g><g><g transform=3D"translate(=
-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-align: =
left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatu=
res=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http=
://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe cente=
r; justify-content: unsafe center; width: 48px; height: 1px; padding-top: 5=
60px; margin-left: 475px;"><div style=3D"box-sizing: border-box; font-size:=
 0; text-align: center; color: #000000; "><div style=3D"display: inline-blo=
ck; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: light=
-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-space=
: normal; word-wrap: normal; "><font data-font-src=3D"https://fonts.googlea=
pis.com/css?family=3DArchitects+Daughter">temp</font></div></div></div></fo=
reignObject><text x=3D"499" y=3D"564" fill=3D"light-dark(#000000, #ffffff)"=
 font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=
=3D"middle">temp</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9H=
tTySJIbg-210"><g><path d=3D"M 1077 580 L 1077 660" fill=3D"none" stroke=3D"=
#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" st=
roke-miterlimit=3D"10" pointer-events=3D"stroke"/></g></g><g data-cell-id=
=3D"eV5wDCu3Df9HtTySJIbg-171"><g><rect x=3D"1017" y=3D"540" width=3D"120" h=
eight=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-dark(#=
ffffff, var(--ge-dark-color, #121212)); stroke: light-dark(rgb(0, 0, 0), rg=
b(255, 255, 255));" stroke=3D"#000000" pointer-events=3D"all"/></g><g><g tr=
ansform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: =
visible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=
=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibil=
ity"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; al=
ign-items: unsafe center; justify-content: unsafe center; width: 118px; hei=
ght: 1px; padding-top: 560px; margin-left: 1018px;"><div style=3D"box-sizin=
g: border-box; font-size: 0; text-align: center; color: #000000; "><div sty=
le=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation=
 Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; pointer=
-events: all; white-space: normal; word-wrap: normal; "><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">sysroot-=
destdir</font></div></div></div></foreignObject><text x=3D"1077" y=3D"564" =
fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&=
quot;" font-size=3D"12px" text-anchor=3D"middle">sysroot-destdir</text></sw=
itch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-307"><g><path d=3D=
"M 1382 580 L 1382 653.63" fill=3D"none" stroke=3D"#000000" style=3D"stroke=
: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" p=
ointer-events=3D"stroke"/><path d=3D"M 1382 658.88 L 1379.67 651.88 L 1382 =
653.63 L 1384.33 651.88 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0=
, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255=
, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all=
"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-172"><g><rect x=3D"1327"=
 y=3D"540" width=3D"110" height=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" s=
tyle=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #121212)); stroke: l=
ight-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" pointer-ev=
ents=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreign=
Object style=3D"overflow: visible; text-align: left;" pointer-events=3D"non=
e" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/=
SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" st=
yle=3D"display: flex; align-items: unsafe center; justify-content: unsafe c=
enter; width: 108px; height: 1px; padding-top: 560px; margin-left: 1328px;"=
><div style=3D"box-sizing: border-box; font-size: 0; text-align: center; co=
lor: #000000; "><div style=3D"display: inline-block; font-size: 12px; font-=
family: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); l=
ine-height: 1.2; pointer-events: all; white-space: normal; word-wrap: norma=
l; "><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchi=
tects+Daughter">recipe-sysroot</font></div></div></div></foreignObject><tex=
t x=3D"1382" y=3D"564" fill=3D"light-dark(#000000, #ffffff)" font-family=3D=
"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">rec=
ipe-sysroot</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJ=
Ibg-182"><g><path d=3D"M 779 580 L 779 673.63" fill=3D"none" stroke=3D"#000=
000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=
-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 779 678.88 L 776=
.67 671.88 L 779 673.63 L 781.33 671.88 Z" fill=3D"#000000" style=3D"fill: =
light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, =
0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" point=
er-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-175"><g>=
<rect x=3D"747.49" y=3D"540" width=3D"63" height=3D"40" rx=3D"6" ry=3D"6" f=
ill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #12=
1212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#0=
00000" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"=
><switch><foreignObject style=3D"overflow: visible; text-align: left;" poin=
ter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http=
://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.o=
rg/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-=
content: unsafe center; width: 61px; height: 1px; padding-top: 560px; margi=
n-left: 748px;"><div style=3D"box-sizing: border-box; font-size: 0; text-al=
ign: center; color: #000000; "><div style=3D"display: inline-block; font-si=
ze: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#0000=
00, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal; w=
ord-wrap: normal; "><font data-font-src=3D"https://fonts.googleapis.com/css=
?family=3DArchitects+Daughter">image</font></div></div></div></foreignObjec=
t><text x=3D"779" y=3D"564" fill=3D"light-dark(#000000, #ffffff)" font-fami=
ly=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle=
">image</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-=
183"><g><path d=3D"M 779.1 720 L 779.1 730 Q 779.1 740 779.06 746.82 L 779.=
03 753.63" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb=
(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=3D=
"stroke"/><path d=3D"M 779 758.88 L 776.7 751.87 L 779.03 753.63 L 781.37 7=
51.89 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, =
255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=
=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g da=
ta-cell-id=3D"eV5wDCu3Df9HtTySJIbg-184"><g><path d=3D"M 779 720 Q 779 740 8=
38.75 740 Q 898.5 740 898.5 753.63" fill=3D"none" stroke=3D"#000000" style=
=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimi=
t=3D"10" pointer-events=3D"stroke"/><path d=3D"M 898.5 758.88 L 896.17 751.=
88 L 898.5 753.63 L 900.83 751.88 Z" fill=3D"#000000" style=3D"fill: light-=
dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rg=
b(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-eve=
nts=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-177"><g><rect =
x=3D"757.25" y=3D"680" width=3D"43.5" height=3D"40" rx=3D"6" ry=3D"6" fill=
=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #12121=
2)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#0000=
00" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><s=
witch><foreignObject style=3D"overflow: visible; text-align: left;" pointer=
-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://=
www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-con=
tent: unsafe center; width: 42px; height: 1px; padding-top: 700px; margin-l=
eft: 758px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align=
: center; color: #000000; "><div style=3D"display: inline-block; font-size:=
 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#000000,=
 #ffffff); line-height: 1.2; pointer-events: all; white-space: normal; word=
-wrap: normal; "><font data-font-src=3D"https://fonts.googleapis.com/css?fa=
mily=3DArchitects+Daughter">usr</font></div></div></div></foreignObject><te=
xt x=3D"779" y=3D"704" fill=3D"light-dark(#000000, #ffffff)" font-family=3D=
"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">usr=
</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-188"><g=
><path d=3D"M 778.99 800 L 779 823.63" fill=3D"none" stroke=3D"#000000" sty=
le=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterli=
mit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 779 828.88 L 776.67 821.=
88 L 779 823.63 L 781.33 821.88 Z" fill=3D"#000000" style=3D"fill: light-da=
rk(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(=
255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-event=
s=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-180"><g><rect x=
=3D"752.12" y=3D"760" width=3D"53.75" height=3D"40" rx=3D"6" ry=3D"6" fill=
=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #12121=
2)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#0000=
00" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><s=
witch><foreignObject style=3D"overflow: visible; text-align: left;" pointer=
-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://=
www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-con=
tent: unsafe center; width: 52px; height: 1px; padding-top: 780px; margin-l=
eft: 753px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align=
: center; color: #000000; "><div style=3D"display: inline-block; font-size:=
 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#000000,=
 #ffffff); line-height: 1.2; pointer-events: all; white-space: normal; word=
-wrap: normal; "><font data-font-src=3D"https://fonts.googleapis.com/css?fa=
mily=3DArchitects+Daughter">include</font></div></div></div></foreignObject=
><text x=3D"779" y=3D"784" fill=3D"light-dark(#000000, #ffffff)" font-famil=
y=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle"=
>include</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg=
-192"><g><path d=3D"M 898.6 800 L 898.6 810 Q 898.6 820 898.58 821.82 L 898=
.56 823.63" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rg=
b(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=
=3D"stroke"/><path d=3D"M 898.51 828.88 L 895.08 821.85 L 898.56 823.63 L 9=
02.08 821.92 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rg=
b(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" s=
troke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g>=
<g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-181"><g><rect x=3D"876.75" y=3D"760=
" width=3D"43.5" height=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"=
fill: light-dark(#ffffff, var(--ge-dark-color, #121212)); stroke: light-dar=
k(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" pointer-events=3D"=
all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject s=
tyle=3D"overflow: visible; text-align: left;" pointer-events=3D"none" width=
=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/fe=
ature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"d=
isplay: flex; align-items: unsafe center; justify-content: unsafe center; w=
idth: 42px; height: 1px; padding-top: 780px; margin-left: 878px;"><div styl=
e=3D"box-sizing: border-box; font-size: 0; text-align: center; color: #0000=
00; "><div style=3D"display: inline-block; font-size: 12px; font-family: &q=
uot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-height=
: 1.2; pointer-events: all; white-space: normal; word-wrap: normal; "><font=
 data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daug=
hter">lib</font></div></div></div></foreignObject><text x=3D"899" y=3D"784"=
 fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans=
&quot;" font-size=3D"12px" text-anchor=3D"middle">lib</text></switch></g></=
g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-187"><g><rect x=3D"739" y=3D"=
830" width=3D"80" height=3D"25" rx=3D"3.75" ry=3D"3.75" fill=3D"#f5f5f5" st=
yle=3D"fill: light-dark(rgb(245, 245, 245), rgb(26, 26, 26)); stroke: light=
-dark(rgb(102, 102, 102), rgb(149, 149, 149));" stroke=3D"#666666" pointer-=
events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><forei=
gnObject style=3D"overflow: visible; text-align: left;" pointer-events=3D"n=
one" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/T=
R/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" =
style=3D"display: flex; align-items: unsafe center; justify-content: unsafe=
 center; width: 78px; height: 1px; padding-top: 843px; margin-left: 740px;"=
><div style=3D"box-sizing: border-box; font-size: 0; text-align: center; co=
lor: #333333; "><div style=3D"display: inline-block; font-size: 12px; font-=
family: &quot;Liberation Sans&quot;; color: light-dark(#333333, #c1c1c1); l=
ine-height: 1.2; pointer-events: all; white-space: normal; word-wrap: norma=
l; ">hellolib.h</div></div></div></foreignObject><text x=3D"779" y=3D"846" =
fill=3D"#333333" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"1=
2px" text-anchor=3D"middle">hellolib.h</text></switch></g></g></g><g data-c=
ell-id=3D"eV5wDCu3Df9HtTySJIbg-189"><g><rect x=3D"837" y=3D"837.5" width=3D=
"120" height=3D"20" rx=3D"3" ry=3D"3" fill=3D"#f5f5f5" style=3D"fill: light=
-dark(rgb(245, 245, 245), rgb(26, 26, 26)); stroke: light-dark(rgb(102, 102=
, 102), rgb(149, 149, 149));" stroke=3D"#666666" pointer-events=3D"all"/></=
g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"=
overflow: visible; text-align: left;" pointer-events=3D"none" width=3D"100%=
" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Ex=
tensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: =
flex; align-items: unsafe center; justify-content: unsafe center; width: 11=
8px; height: 1px; padding-top: 848px; margin-left: 838px;"><div style=3D"bo=
x-sizing: border-box; font-size: 0; text-align: center; color: #333333; "><=
div style=3D"display: inline-block; font-size: 12px; font-family: &quot;Lib=
eration Sans&quot;; color: light-dark(#333333, #c1c1c1); line-height: 1.2; =
pointer-events: all; white-space: normal; word-wrap: normal; ">libhello.so.=
1</div></div></div></foreignObject><text x=3D"897" y=3D"851" fill=3D"#33333=
3" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anch=
or=3D"middle">libhello.so.1</text></switch></g></g></g><g data-cell-id=3D"e=
V5wDCu3Df9HtTySJIbg-190"><g><rect x=3D"837" y=3D"862.5" width=3D"120" heigh=
t=3D"25" rx=3D"3.75" ry=3D"3.75" fill=3D"#f5f5f5" style=3D"fill: light-dark=
(rgb(245, 245, 245), rgb(26, 26, 26)); stroke: light-dark(rgb(102, 102, 102=
), rgb(149, 149, 149));" stroke=3D"#666666" pointer-events=3D"all"/></g><g>=
<g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overf=
low: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" hei=
ght=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensi=
bility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex;=
 align-items: unsafe center; justify-content: unsafe center; width: 118px; =
height: 1px; padding-top: 875px; margin-left: 838px;"><div style=3D"box-siz=
ing: border-box; font-size: 0; text-align: center; color: #333333; "><div s=
tyle=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberati=
on Sans&quot;; color: light-dark(#333333, #c1c1c1); line-height: 1.2; point=
er-events: all; white-space: normal; word-wrap: normal; ">libhello.so.1.0</=
div></div></div></foreignObject><text x=3D"897" y=3D"879" fill=3D"#333333" =
font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=
=3D"middle">libhello.so.1.0</text></switch></g></g></g><g data-cell-id=3D"e=
V5wDCu3Df9HtTySJIbg-191"><g><rect x=3D"830" y=3D"830" width=3D"137" height=
=3D"62.5" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(=
0, 0, 0), rgb(255, 255, 255));" stroke-dasharray=3D"3 3" pointer-events=3D"=
all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-286"><g><path d=3D"M =
1107 900 Q 1107 940 1244.5 940 Q 1382 940 1382 910.1" fill=3D"none" stroke=
=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));=
" stroke-width=3D"3" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><p=
ath d=3D"M 1382 903.35 L 1386.5 912.35 L 1382 910.1 L 1377.5 912.35 Z" fill=
=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); s=
troke: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"#000000" st=
roke-width=3D"3" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><=
g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-209"><g><rect x=3D"1017" y=3D"660" w=
idth=3D"120" height=3D"240" rx=3D"18" ry=3D"18" fill=3D"#eeeeee" style=3D"f=
ill: light-dark(rgb(238, 238, 238), rgb(32, 32, 32)); stroke: light-dark(rg=
b(54, 57, 61), rgb(186, 189, 192));" stroke=3D"#36393d" stroke-dasharray=3D=
"3 3" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)">=
<switch><foreignObject style=3D"overflow: visible; text-align: left;" point=
er-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http:=
//www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.or=
g/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-c=
ontent: unsafe center; width: 118px; height: 1px; padding-top: 780px; margi=
n-left: 1018px;"><div style=3D"box-sizing: border-box; font-size: 0; text-a=
lign: center; color: #000000; "><div style=3D"display: inline-block; font-s=
ize: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#000=
000, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal; =
word-wrap: normal; ">Everything in <b>image</b> folder that is present in <=
b>SYSROOT_DIRS</b> will be copied here.</div></div></div></foreignObject><t=
ext x=3D"1077" y=3D"784" fill=3D"light-dark(#000000, #ffffff)" font-family=
=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">=
Everything in image...</text></switch></g></g></g><g data-cell-id=3D"eV5wDC=
u3Df9HtTySJIbg-233"><g><path d=3D"M 919.5 900 Q 919.5 940 998.25 940 Q 1077=
 940 1077 910.1" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-da=
rk(rgb(0, 0, 0), rgb(237, 237, 237));" stroke-width=3D"3" stroke-miterlimit=
=3D"10" pointer-events=3D"stroke"/><path d=3D"M 1077 903.35 L 1081.5 912.35=
 L 1077 910.1 L 1072.5 912.35 Z" fill=3D"#000000" style=3D"fill: light-dark=
(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: light-dark(rgb(0, 0, 0), rgb(23=
7, 237, 237));" stroke=3D"#000000" stroke-width=3D"3" stroke-miterlimit=3D"=
10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg=
-212"><g><path d=3D"M 607 900 Q 607 940 735.3 940 Q 863.6 940 863.61 909.86=
" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0)=
, rgb(237, 237, 237));" stroke-width=3D"3" stroke-miterlimit=3D"10" pointer=
-events=3D"stroke"/><path d=3D"M 863.61 903.11 L 868.11 912.12 L 863.61 909=
.86 L 859.11 912.11 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0,=
 0), rgb(237, 237, 237)); stroke: light-dark(rgb(0, 0, 0), rgb(237, 237, 23=
7));" stroke=3D"#000000" stroke-width=3D"3" stroke-miterlimit=3D"10" pointe=
r-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-213"><g><=
rect x=3D"687" y=3D"920" width=3D"90" height=3D"30" fill=3D"#eeeeee" style=
=3D"fill: light-dark(rgb(238, 238, 238), rgb(32, 32, 32)); stroke: light-da=
rk(rgb(54, 57, 61), rgb(186, 189, 192));" stroke=3D"#36393d" pointer-events=
=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObje=
ct style=3D"overflow: visible; text-align: left;" pointer-events=3D"none" w=
idth=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG1=
1/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 1px; height: 1px; padding-top: 935px; margin-left: 732px;"><div =
style=3D"box-sizing: border-box; font-size: 0; text-align: center; color: #=
000000; "><div style=3D"display: inline-block; font-size: 12px; font-family=
: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-he=
ight: 1.2; pointer-events: all; white-space: nowrap; "><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">do_insta=
ll</font></div></div></div></foreignObject><text x=3D"732" y=3D"939" fill=
=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot=
;" font-size=3D"12px" text-anchor=3D"middle">do_install</text></switch></g>=
</g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-214"><g><rect x=3D"555" y=
=3D"837.5" width=3D"114" height=3D"27.5" rx=3D"4.13" ry=3D"4.13" fill=3D"#e=
eeeee" style=3D"fill: light-dark(rgb(238, 238, 238), rgb(32, 32, 32)); stro=
ke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192));" stroke=3D"#36393d" po=
inter-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch>=
<foreignObject style=3D"overflow: visible; text-align: left;" pointer-event=
s=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3=
.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/x=
html" style=3D"display: flex; align-items: unsafe center; justify-content: =
unsafe center; width: 112px; height: 1px; padding-top: 851px; margin-left: =
556px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: cen=
ter; color: #000000; "><div style=3D"display: inline-block; font-size: 12px=
; font-family: &quot;Liberation Sans&quot;; color: light-dark(#000000, #fff=
fff); line-height: 1.2; pointer-events: all; white-space: normal; word-wrap=
: normal; ">libhello.so.1.0</div></div></div></foreignObject><text x=3D"612=
" y=3D"855" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Libe=
ration Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">libhello.so.1.=
0</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-217"><=
g><rect x=3D"417" y=3D"795" width=3D"110" height=3D"30" fill=3D"#eeeeee" st=
yle=3D"fill: light-dark(rgb(238, 238, 238), rgb(32, 32, 32)); stroke: light=
-dark(rgb(54, 57, 61), rgb(186, 189, 192));" stroke=3D"#36393d" pointer-eve=
nts=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignO=
bject style=3D"overflow: visible; text-align: left;" pointer-events=3D"none=
" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/S=
VG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" sty=
le=3D"display: flex; align-items: unsafe center; justify-content: unsafe ce=
nter; width: 1px; height: 1px; padding-top: 810px; margin-left: 472px;"><di=
v style=3D"box-sizing: border-box; font-size: 0; text-align: center; color:=
 #000000; "><div style=3D"display: inline-block; font-size: 12px; font-fami=
ly: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-=
height: 1.2; pointer-events: all; white-space: nowrap; "><font data-font-sr=
c=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">do_conf=
igure<br /></font></div></div></div></foreignObject><text x=3D"472" y=3D"81=
4" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sa=
ns&quot;" font-size=3D"12px" text-anchor=3D"middle">do_configure&#xa;</text=
></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-218"><g><rect=
 x=3D"553" y=3D"800" width=3D"114" height=3D"20" rx=3D"3" ry=3D"3" fill=3D"=
#f5f5f5" style=3D"fill: light-dark(rgb(245, 245, 245), rgb(26, 26, 26)); st=
roke: light-dark(rgb(102, 102, 102), rgb(149, 149, 149));" stroke=3D"#66666=
6" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><sw=
itch><foreignObject style=3D"overflow: visible; text-align: left;" pointer-=
events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://w=
ww.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1=
999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-cont=
ent: unsafe center; width: 112px; height: 1px; padding-top: 810px; margin-l=
eft: 554px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align=
: center; color: #333333; "><div style=3D"display: inline-block; font-size:=
 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#333333,=
 #c1c1c1); line-height: 1.2; pointer-events: all; white-space: normal; word=
-wrap: normal; ">hellolib.h</div></div></div></foreignObject><text x=3D"610=
" y=3D"814" fill=3D"#333333" font-family=3D"&quot;Liberation Sans&quot;" fo=
nt-size=3D"12px" text-anchor=3D"middle">hellolib.h</text></switch></g></g><=
/g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-221"><g><rect x=3D"447" y=3D"750=
" width=3D"80" height=3D"30" fill=3D"#eeeeee" style=3D"fill: light-dark(rgb=
(238, 238, 238), rgb(32, 32, 32)); stroke: light-dark(rgb(54, 57, 61), rgb(=
186, 189, 192));" stroke=3D"#36393d" pointer-events=3D"all"/></g><g><g tran=
sform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: vi=
sible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"=
100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"=
><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-=
items: unsafe center; justify-content: unsafe center; width: 1px; height: 1=
px; padding-top: 765px; margin-left: 487px;"><div style=3D"box-sizing: bord=
er-box; font-size: 0; text-align: center; color: #000000; "><div style=3D"d=
isplay: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&q=
uot;; color: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events=
: all; white-space: nowrap; "><font data-font-src=3D"https://fonts.googleap=
is.com/css?family=3DArchitects+Daughter">do_patch<br /></font></div></div><=
/div></foreignObject><text x=3D"487" y=3D"769" fill=3D"light-dark(#000000, =
#ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" te=
xt-anchor=3D"middle">do_patch&#xa;</text></switch></g></g></g><g data-cell-=
id=3D"eV5wDCu3Df9HtTySJIbg-224"><g><rect x=3D"623.5" y=3D"405" width=3D"90"=
 height=3D"30" fill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 238=
), rgb(32, 32, 32)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192)=
);" stroke=3D"#36393d" pointer-events=3D"all"/></g><g><g transform=3D"trans=
late(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-al=
ign: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" required=
Features=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D=
"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe =
center; justify-content: unsafe center; width: 1px; height: 1px; padding-to=
p: 420px; margin-left: 669px;"><div style=3D"box-sizing: border-box; font-s=
ize: 0; text-align: center; color: #000000; "><div style=3D"display: inline=
-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: l=
ight-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-s=
pace: nowrap; "><font data-font-src=3D"https://fonts.googleapis.com/css?fam=
ily=3DArchitects+Daughter">do_unpack<br /></font></div></div></div></foreig=
nObject><text x=3D"669" y=3D"424" fill=3D"light-dark(#000000, #ffffff)" fon=
t-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"=
middle">do_unpack&#xa;</text></switch></g></g></g><g data-cell-id=3D"eV5wDC=
u3Df9HtTySJIbg-225"><g><ellipse cx=3D"608.5" cy=3D"420" rx=3D"15" ry=3D"15"=
 fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237=
)); stroke: light-dark(rgb(86, 81, 126), rgb(164, 160, 198));" stroke=3D"#5=
6517e" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"=
><switch><foreignObject style=3D"overflow: visible; text-align: left;" poin=
ter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http=
://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.o=
rg/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-=
content: unsafe center; width: 28px; height: 1px; padding-top: 420px; margi=
n-left: 595px;"><div style=3D"box-sizing: border-box; font-size: 0; text-al=
ign: center; color: #000000; "><div style=3D"display: inline-block; font-si=
ze: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#0000=
00, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal; w=
ord-wrap: normal; "><font data-font-src=3D"https://fonts.googleapis.com/css=
?family=3DArchitects+Daughter" color=3D"#ffffff" size=3D"1" style=3D"color:=
 light-dark(rgb(255, 255, 255), rgb(18, 18, 18));"><b style=3D"font-size: 1=
5px;">6</b></font></div></div></div></foreignObject><text x=3D"609" y=3D"42=
4" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sa=
ns&quot;" font-size=3D"12px" text-anchor=3D"middle">6</text></switch></g></=
g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-226"><g><ellipse cx=3D"432" c=
y=3D"765" rx=3D"15" ry=3D"15" fill=3D"#000000" style=3D"fill: light-dark(rg=
b(0, 0, 0), rgb(237, 237, 237)); stroke: light-dark(rgb(86, 81, 126), rgb(1=
64, 160, 198));" stroke=3D"#56517e" pointer-events=3D"all"/></g><g><g trans=
form=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: vis=
ible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"1=
00%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility">=
<div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-i=
tems: unsafe center; justify-content: unsafe center; width: 28px; height: 1=
px; padding-top: 765px; margin-left: 418px;"><div style=3D"box-sizing: bord=
er-box; font-size: 0; text-align: center; color: #000000; "><div style=3D"d=
isplay: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&q=
uot;; color: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events=
: all; white-space: normal; word-wrap: normal; "><font data-font-src=3D"htt=
ps://fonts.googleapis.com/css?family=3DArchitects+Daughter" color=3D"#fffff=
f" size=3D"1" style=3D"color: light-dark(rgb(255, 255, 255), rgb(18, 18, 18=
));"><b style=3D"font-size: 15px;">7</b></font></div></div></div></foreignO=
bject><text x=3D"432" y=3D"769" fill=3D"light-dark(#000000, #ffffff)" font-=
family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"mi=
ddle">7</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-=
227"><g><ellipse cx=3D"402" cy=3D"810" rx=3D"15" ry=3D"15" fill=3D"#000000"=
 style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: light=
-dark(rgb(86, 81, 126), rgb(164, 160, 198));" stroke=3D"#56517e" pointer-ev=
ents=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreign=
Object style=3D"overflow: visible; text-align: left;" pointer-events=3D"non=
e" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/=
SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" st=
yle=3D"display: flex; align-items: unsafe center; justify-content: unsafe c=
enter; width: 28px; height: 1px; padding-top: 810px; margin-left: 388px;"><=
div style=3D"box-sizing: border-box; font-size: 0; text-align: center; colo=
r: #000000; "><div style=3D"display: inline-block; font-size: 12px; font-fa=
mily: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); lin=
e-height: 1.2; pointer-events: all; white-space: normal; word-wrap: normal;=
 "><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchite=
cts+Daughter" color=3D"#ffffff" size=3D"1" style=3D"color: light-dark(rgb(2=
55, 255, 255), rgb(18, 18, 18));"><b style=3D"font-size: 15px;">8</b></font=
></div></div></div></foreignObject><text x=3D"402" y=3D"814" fill=3D"light-=
dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-si=
ze=3D"12px" text-anchor=3D"middle">8</text></switch></g></g></g><g data-cel=
l-id=3D"eV5wDCu3Df9HtTySJIbg-229"><g><rect x=3D"437" y=3D"827.5" width=3D"9=
0" height=3D"30" fill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 2=
38), rgb(32, 32, 32)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 19=
2));" stroke=3D"#36393d" pointer-events=3D"all"/></g><g><g transform=3D"tra=
nslate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-=
align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requir=
edFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsa=
fe center; justify-content: unsafe center; width: 1px; height: 1px; padding=
-top: 843px; margin-left: 482px;"><div style=3D"box-sizing: border-box; fon=
t-size: 0; text-align: center; color: #000000; "><div style=3D"display: inl=
ine-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color=
: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; whit=
e-space: nowrap; "><font data-font-src=3D"https://fonts.googleapis.com/css?=
family=3DArchitects+Daughter">do_compile<br /></font></div></div></div></fo=
reignObject><text x=3D"482" y=3D"846" fill=3D"light-dark(#000000, #ffffff)"=
 font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=
=3D"middle">do_compile&#xa;</text></switch></g></g></g><g data-cell-id=3D"e=
V5wDCu3Df9HtTySJIbg-228"><g><ellipse cx=3D"422" cy=3D"842.5" rx=3D"15" ry=
=3D"15" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 2=
37, 237)); stroke: light-dark(rgb(86, 81, 126), rgb(164, 160, 198));" strok=
e=3D"#56517e" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5=
 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-align: left=
;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=
=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://=
www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; =
justify-content: unsafe center; width: 28px; height: 1px; padding-top: 843p=
x; margin-left: 408px;"><div style=3D"box-sizing: border-box; font-size: 0;=
 text-align: center; color: #000000; "><div style=3D"display: inline-block;=
 font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: light-da=
rk(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-space: n=
ormal; word-wrap: normal; "><font data-font-src=3D"https://fonts.googleapis=
.com/css?family=3DArchitects+Daughter" color=3D"#ffffff" size=3D"1" style=
=3D"color: light-dark(rgb(255, 255, 255), rgb(18, 18, 18));"><b style=3D"fo=
nt-size: 15px;">9</b></font></div></div></div></foreignObject><text x=3D"42=
2" y=3D"846" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Lib=
eration Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">9</text></swi=
tch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-231"><g><ellipse cx=
=3D"672" cy=3D"935" rx=3D"15" ry=3D"15" fill=3D"#000000" style=3D"fill: lig=
ht-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: light-dark(rgb(86, 81, 1=
26), rgb(164, 160, 198));" stroke=3D"#56517e" pointer-events=3D"all"/></g><=
g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"ove=
rflow: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" h=
eight=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Exten=
sibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: fle=
x; align-items: unsafe center; justify-content: unsafe center; width: 28px;=
 height: 1px; padding-top: 935px; margin-left: 658px;"><div style=3D"box-si=
zing: border-box; font-size: 0; text-align: center; color: #000000; "><div =
style=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberat=
ion Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; poin=
ter-events: all; white-space: normal; word-wrap: normal; "><font data-font-=
src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter" color=
=3D"#ffffff" size=3D"1" style=3D"color: light-dark(rgb(255, 255, 255), rgb(=
18, 18, 18));"><b style=3D"font-size: 15px;">10</b></font></div></div></div=
></foreignObject><text x=3D"672" y=3D"939" fill=3D"light-dark(#000000, #fff=
fff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-a=
nchor=3D"middle">10</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3D=
f9HtTySJIbg-235"><g><rect x=3D"932" y=3D"920" width=3D"160" height=3D"30" f=
ill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 238), rgb(32, 32, 3=
2)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192));" stroke=3D"#3=
6393d" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"=
><switch><foreignObject style=3D"overflow: visible; text-align: left;" poin=
ter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http=
://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.o=
rg/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-=
content: unsafe center; width: 1px; height: 1px; padding-top: 935px; margin=
-left: 1012px;"><div style=3D"box-sizing: border-box; font-size: 0; text-al=
ign: center; color: #000000; "><div style=3D"display: inline-block; font-si=
ze: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#0000=
00, #ffffff); line-height: 1.2; pointer-events: all; white-space: nowrap; "=
><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitect=
s+Daughter">do_populate_sysroot</font></div></div></div></foreignObject><te=
xt x=3D"1012" y=3D"939" fill=3D"light-dark(#000000, #ffffff)" font-family=
=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">=
do_populate_sysroot</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3D=
f9HtTySJIbg-236"><g><ellipse cx=3D"917" cy=3D"935" rx=3D"15" ry=3D"15" fill=
=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); s=
troke: light-dark(rgb(86, 81, 126), rgb(164, 160, 198));" stroke=3D"#56517e=
" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><swi=
tch><foreignObject style=3D"overflow: visible; text-align: left;" pointer-e=
vents=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://ww=
w.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/19=
99/xhtml" style=3D"display: flex; align-items: unsafe center; justify-conte=
nt: unsafe center; width: 28px; height: 1px; padding-top: 935px; margin-lef=
t: 903px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: =
center; color: #000000; "><div style=3D"display: inline-block; font-size: 1=
2px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#000000, #=
ffffff); line-height: 1.2; pointer-events: all; white-space: normal; word-w=
rap: normal; "><font data-font-src=3D"https://fonts.googleapis.com/css?fami=
ly=3DArchitects+Daughter" color=3D"#ffffff" size=3D"1" style=3D"color: ligh=
t-dark(rgb(255, 255, 255), rgb(18, 18, 18));"><b style=3D"font-size: 15px;"=
>11</b></font></div></div></div></foreignObject><text x=3D"917" y=3D"939" f=
ill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&q=
uot;" font-size=3D"12px" text-anchor=3D"middle">11</text></switch></g></g><=
/g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-355"><g><path d=3D"M 1757 820 Q =
1757 940 1843 940 Q 1929 940 1928.99 910.1" fill=3D"none" stroke=3D"#000000=
" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke-wi=
dth=3D"3" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M =
1928.99 903.35 L 1933.49 912.35 L 1928.99 910.1 L 1924.49 912.36 Z" fill=3D=
"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stro=
ke: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"#000000" strok=
e-width=3D"3" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g d=
ata-cell-id=3D"eV5wDCu3Df9HtTySJIbg-238"><g><rect x=3D"1687" y=3D"660" widt=
h=3D"140" height=3D"160" rx=3D"21" ry=3D"21" fill=3D"none" stroke=3D"#00000=
0" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-d=
asharray=3D"3 3" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu=
3Df9HtTySJIbg-239"><g><path d=3D"M 1756.5 580 Q 1756.5 620 1756.92 653.63" =
fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), =
rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><=
path d=3D"M 1756.99 658.88 L 1753.4 651.93 L 1756.92 653.63 L 1760.4 651.84=
 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, =
255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#00=
0000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cell=
-id=3D"w4JjUiD6-ryT0rcgaIPJ-1"><g><path d=3D"M 1724 560 L 1723.37 560" fill=
=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(=
255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path=
 d=3D"M 1718.12 560 L 1725.12 556.5 L 1723.37 560 L 1725.12 563.5 Z" fill=
=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); s=
troke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" st=
roke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"e=
V5wDCu3Df9HtTySJIbg-240"><g><rect x=3D"1724" y=3D"540" width=3D"65" height=
=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-dark(#fffff=
f, var(--ge-dark-color, #121212)); stroke: light-dark(rgb(0, 0, 0), rgb(255=
, 255, 255));" stroke=3D"#000000" pointer-events=3D"all"/></g><g><g transfo=
rm=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visib=
le; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100=
%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><d=
iv xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-ite=
ms: unsafe center; justify-content: unsafe center; width: 63px; height: 1px=
; padding-top: 560px; margin-left: 1725px;"><div style=3D"box-sizing: borde=
r-box; font-size: 0; text-align: center; color: #000000; "><div style=3D"di=
splay: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&qu=
ot;; color: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events:=
 all; white-space: normal; word-wrap: normal; "><div>sources/sayhello-0.1</=
div><div><br /></div></div></div></div></foreignObject><text x=3D"1757" y=
=3D"564" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberat=
ion Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">sources/say...</t=
ext></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-241"><g><r=
ect x=3D"1700" y=3D"680" width=3D"114" height=3D"20" rx=3D"3" ry=3D"3" fill=
=3D"#f5f5f5" style=3D"fill: light-dark(rgb(245, 245, 245), rgb(26, 26, 26))=
; stroke: light-dark(rgb(102, 102, 102), rgb(149, 149, 149));" stroke=3D"#6=
66666" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"=
><switch><foreignObject style=3D"overflow: visible; text-align: left;" poin=
ter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http=
://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.o=
rg/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-=
content: unsafe center; width: 112px; height: 1px; padding-top: 690px; marg=
in-left: 1701px;"><div style=3D"box-sizing: border-box; font-size: 0; text-=
align: center; color: #333333; "><div style=3D"display: inline-block; font-=
size: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#33=
3333, #c1c1c1); line-height: 1.2; pointer-events: all; white-space: normal;=
 word-wrap: normal; ">Makefile</div></div></div></foreignObject><text x=3D"=
1757" y=3D"694" fill=3D"#333333" font-family=3D"&quot;Liberation Sans&quot;=
" font-size=3D"12px" text-anchor=3D"middle">Makefile</text></switch></g></g=
></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-242"><g><rect x=3D"1700" y=3D"=
710" width=3D"114" height=3D"20" rx=3D"3" ry=3D"3" fill=3D"#f5f5f5" style=
=3D"fill: light-dark(rgb(245, 245, 245), rgb(26, 26, 26)); stroke: light-da=
rk(rgb(102, 102, 102), rgb(149, 149, 149));" stroke=3D"#666666" pointer-eve=
nts=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignO=
bject style=3D"overflow: visible; text-align: left;" pointer-events=3D"none=
" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/S=
VG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" sty=
le=3D"display: flex; align-items: unsafe center; justify-content: unsafe ce=
nter; width: 112px; height: 1px; padding-top: 720px; margin-left: 1701px;">=
<div style=3D"box-sizing: border-box; font-size: 0; text-align: center; col=
or: #333333; "><div style=3D"display: inline-block; font-size: 12px; font-f=
amily: &quot;Liberation Sans&quot;; color: light-dark(#333333, #c1c1c1); li=
ne-height: 1.2; pointer-events: all; white-space: normal; word-wrap: normal=
; ">LICENSE</div></div></div></foreignObject><text x=3D"1757" y=3D"724" fil=
l=3D"#333333" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px=
" text-anchor=3D"middle">LICENSE</text></switch></g></g></g><g data-cell-id=
=3D"eV5wDCu3Df9HtTySJIbg-330"><g><path d=3D"M 1700 750 Q 1647 750 1647 771.=
9 Q 1647 793.8 1689.9 793.76" fill=3D"none" stroke=3D"#000000" style=3D"str=
oke: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke-width=3D"3" stro=
ke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 1696.65 793.75=
 L 1687.65 798.26 L 1689.9 793.76 L 1687.64 789.26 Z" fill=3D"#000000" styl=
e=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: light-dark=
(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"#000000" stroke-width=3D"3" =
stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D=
"eV5wDCu3Df9HtTySJIbg-244"><g><rect x=3D"1700" y=3D"740" width=3D"114" heig=
ht=3D"20" rx=3D"3" ry=3D"3" fill=3D"#f5f5f5" style=3D"fill: light-dark(rgb(=
245, 245, 245), rgb(26, 26, 26)); stroke: light-dark(rgb(102, 102, 102), rg=
b(149, 149, 149));" stroke=3D"#666666" pointer-events=3D"all"/></g><g><g tr=
ansform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: =
visible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=
=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibil=
ity"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; al=
ign-items: unsafe center; justify-content: unsafe center; width: 112px; hei=
ght: 1px; padding-top: 750px; margin-left: 1701px;"><div style=3D"box-sizin=
g: border-box; font-size: 0; text-align: center; color: #333333; "><div sty=
le=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation=
 Sans&quot;; color: light-dark(#333333, #c1c1c1); line-height: 1.2; pointer=
-events: all; white-space: normal; word-wrap: normal; ">sayhello.c</div></d=
iv></div></foreignObject><text x=3D"1757" y=3D"754" fill=3D"#333333" font-f=
amily=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"mid=
dle">sayhello.c</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9Ht=
TySJIbg-245"><g><rect x=3D"1700" y=3D"780" width=3D"114" height=3D"27.5" rx=
=3D"4.13" ry=3D"4.13" fill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 2=
38, 238), rgb(32, 32, 32)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 18=
9, 192));" stroke=3D"#36393d" pointer-events=3D"all"/></g><g><g transform=
=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible=
; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%"=
 requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div=
 xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items=
: unsafe center; justify-content: unsafe center; width: 112px; height: 1px;=
 padding-top: 794px; margin-left: 1701px;"><div style=3D"box-sizing: border=
-box; font-size: 0; text-align: center; color: #000000; "><div style=3D"dis=
play: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quo=
t;; color: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: =
all; white-space: normal; word-wrap: normal; ">sayhello</div></div></div></=
foreignObject><text x=3D"1757" y=3D"797" fill=3D"light-dark(#000000, #fffff=
f)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anc=
hor=3D"middle">sayhello</text></switch></g></g></g><g data-cell-id=3D"eV5wD=
Cu3Df9HtTySJIbg-363"><g><path d=3D"M 1958.99 900 Q 1957 900 1957 920 Q 1957=
 940 2022.75 940 Q 2088.5 940 2088.5 910.1" fill=3D"none" stroke=3D"#000000=
" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke-wi=
dth=3D"3" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M =
2088.5 903.35 L 2093 912.35 L 2088.5 910.1 L 2084 912.35 Z" fill=3D"#000000=
" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: ligh=
t-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"#000000" stroke-width=
=3D"3" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cel=
l-id=3D"eV5wDCu3Df9HtTySJIbg-247"><g><rect x=3D"1868.99" y=3D"660" width=3D=
"120" height=3D"240" rx=3D"18" ry=3D"18" fill=3D"none" stroke=3D"#000000" s=
tyle=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-dasha=
rray=3D"3 3" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9=
HtTySJIbg-248"><g><path d=3D"M 1928.99 580 L 1928.99 653.63" fill=3D"none" =
stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, =
255));" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 19=
28.99 658.88 L 1926.66 651.88 L 1928.99 653.63 L 1931.32 651.88 Z" fill=3D"=
#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); strok=
e: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke=
-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wD=
Cu3Df9HtTySJIbg-249"><g><rect x=3D"1897.49" y=3D"540" width=3D"63" height=
=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-dark(#fffff=
f, var(--ge-dark-color, #121212)); stroke: light-dark(rgb(0, 0, 0), rgb(255=
, 255, 255));" stroke=3D"#000000" pointer-events=3D"all"/></g><g><g transfo=
rm=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visib=
le; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100=
%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><d=
iv xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-ite=
ms: unsafe center; justify-content: unsafe center; width: 61px; height: 1px=
; padding-top: 560px; margin-left: 1898px;"><div style=3D"box-sizing: borde=
r-box; font-size: 0; text-align: center; color: #000000; "><div style=3D"di=
splay: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&qu=
ot;; color: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events:=
 all; white-space: normal; word-wrap: normal; "><font data-font-src=3D"http=
s://fonts.googleapis.com/css?family=3DArchitects+Daughter">image</font></di=
v></div></div></foreignObject><text x=3D"1929" y=3D"564" fill=3D"light-dark=
(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=
=3D"12px" text-anchor=3D"middle">image</text></switch></g></g></g><g data-c=
ell-id=3D"eV5wDCu3Df9HtTySJIbg-250"><g><path d=3D"M 1929.1 720 L 1929.1 735=
 Q 1929.1 745 1929.06 754.32 L 1929.03 763.63" fill=3D"none" stroke=3D"#000=
000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=
-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 1929.01 768.88 L=
 1926.7 761.87 L 1929.03 763.63 L 1931.37 761.89 Z" fill=3D"#000000" style=
=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(=
rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D=
"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIb=
g-252"><g><rect x=3D"1907.25" y=3D"680" width=3D"43.5" height=3D"40" rx=3D"=
6" ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-da=
rk-color, #121212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));"=
 stroke=3D"#000000" pointer-events=3D"all"/></g><g><g transform=3D"translat=
e(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-align=
: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFea=
tures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"ht=
tp://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe cen=
ter; justify-content: unsafe center; width: 42px; height: 1px; padding-top:=
 700px; margin-left: 1908px;"><div style=3D"box-sizing: border-box; font-si=
ze: 0; text-align: center; color: #000000; "><div style=3D"display: inline-=
block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: li=
ght-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-sp=
ace: normal; word-wrap: normal; "><font data-font-src=3D"https://fonts.goog=
leapis.com/css?family=3DArchitects+Daughter">usr</font></div></div></div></=
foreignObject><text x=3D"1929" y=3D"704" fill=3D"light-dark(#000000, #fffff=
f)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anc=
hor=3D"middle">usr</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df=
9HtTySJIbg-253"><g><path d=3D"M 1929.01 810 L 1929 848.63" fill=3D"none" st=
roke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 25=
5));" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 1929=
 853.88 L 1926.67 846.88 L 1929 848.63 L 1931.33 846.88 Z" fill=3D"#000000"=
 style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light=
-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterli=
mit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9Ht=
TySJIbg-254"><g><rect x=3D"1902.13" y=3D"770" width=3D"53.75" height=3D"40"=
 rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(=
--ge-dark-color, #121212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, =
255));" stroke=3D"#000000" pointer-events=3D"all"/></g><g><g transform=3D"t=
ranslate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; tex=
t-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requ=
iredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmln=
s=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: uns=
afe center; justify-content: unsafe center; width: 52px; height: 1px; paddi=
ng-top: 790px; margin-left: 1903px;"><div style=3D"box-sizing: border-box; =
font-size: 0; text-align: center; color: #000000; "><div style=3D"display: =
inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; co=
lor: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; w=
hite-space: normal; word-wrap: normal; "><font data-font-src=3D"https://fon=
ts.googleapis.com/css?family=3DArchitects+Daughter">bin</font></div></div><=
/div></foreignObject><text x=3D"1929" y=3D"794" fill=3D"light-dark(#000000,=
 #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" t=
ext-anchor=3D"middle">bin</text></switch></g></g></g><g data-cell-id=3D"eV5=
wDCu3Df9HtTySJIbg-266"><g><path d=3D"M 416.5 430 Q 506.5 430 506.5 507.5 Q =
506.5 585 558.76 585" fill=3D"none" stroke=3D"#000000" style=3D"stroke: lig=
ht-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke-width=3D"2" stroke-miter=
limit=3D"10" stroke-dasharray=3D"2 4" pointer-events=3D"stroke"/><path d=3D=
"M 564.76 585 L 556.76 587.67 L 558.76 585 L 556.76 582.33 Z" fill=3D"#0000=
00" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: li=
ght-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"#000000" stroke-widt=
h=3D"2" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g><g data-cell-i=
d=3D"eV5wDCu3Df9HtTySJIbg-267"><g><g transform=3D"translate(-0.5 -0.5)"><sw=
itch><foreignObject style=3D"overflow: visible; text-align: left;" pointer-=
events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://w=
ww.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1=
999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-cont=
ent: unsafe center; width: 1px; height: 1px; padding-top: 421px; margin-lef=
t: 438px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: =
center; color: #000000; background-color: #ffffff; border-color: #000000; "=
><div style=3D"display: inline-block; font-size: 11px; font-family: &quot;L=
iberation Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2=
; pointer-events: all; background-color: light-dark(#ffffff, var(--ge-dark-=
color, #121212)); border-width: 1px; border-style: solid; border-color: inh=
erit; border: 1px solid light-dark(#000000, #ffffff); white-space: nowrap; =
"><div><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArc=
hitects+Daughter" style=3D"font-size: 14px;">S =3D "${UNPACKDIR}/${BP}"</fo=
nt></div></div></div></div></foreignObject><text x=3D"438" y=3D"424" fill=
=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot=
;" font-size=3D"11px" text-anchor=3D"middle">S =3D "${UNPACKDIR}/${BP}"</te=
xt></switch></g></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-270"><g=
><rect x=3D"800.75" y=3D"405" width=3D"63" height=3D"25" rx=3D"3.75" ry=3D"=
3.75" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237=
, 237));" stroke=3D"none" pointer-events=3D"all"/></g><g><g transform=3D"tr=
anslate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text=
-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requi=
redFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsa=
fe center; justify-content: unsafe center; width: 61px; height: 1px; paddin=
g-top: 418px; margin-left: 802px;"><div style=3D"box-sizing: border-box; fo=
nt-size: 0; text-align: center; color: #ffffff; "><div style=3D"display: in=
line-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; colo=
r: light-dark(#ffffff, #121212); line-height: 1.2; pointer-events: all; fon=
t-weight: bold; white-space: normal; word-wrap: normal; "><font data-font-s=
rc=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">WORKDI=
R</font></div></div></div></foreignObject><text x=3D"832" y=3D"421" fill=3D=
"#ffffff" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" te=
xt-anchor=3D"middle" font-weight=3D"bold">WORKDIR</text></switch></g></g></=
g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-271"><g><rect x=3D"730.75" y=3D"5=
40" width=3D"26.5" height=3D"25" rx=3D"3.75" ry=3D"3.75" fill=3D"#000000" s=
tyle=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"none=
" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><swi=
tch><foreignObject style=3D"overflow: visible; text-align: left;" pointer-e=
vents=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://ww=
w.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/19=
99/xhtml" style=3D"display: flex; align-items: unsafe center; justify-conte=
nt: unsafe center; width: 25px; height: 1px; padding-top: 553px; margin-lef=
t: 732px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: =
center; color: #ffffff; "><div style=3D"display: inline-block; font-size: 1=
2px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#ffffff, #=
121212); line-height: 1.2; pointer-events: all; font-weight: bold; white-sp=
ace: normal; word-wrap: normal; "><font data-font-src=3D"https://fonts.goog=
leapis.com/css?family=3DArchitects+Daughter">D</font></div></div></div></fo=
reignObject><text x=3D"744" y=3D"556" fill=3D"#ffffff" font-family=3D"&quot=
;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle" font-weig=
ht=3D"bold">D</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTy=
SJIbg-272"><g><rect x=3D"567" y=3D"540" width=3D"26.5" height=3D"25" rx=3D"=
3.75" ry=3D"3.75" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), =
rgb(237, 237, 237));" stroke=3D"none" pointer-events=3D"all"/></g><g><g tra=
nsform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: v=
isible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D=
"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility=
"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align=
-items: unsafe center; justify-content: unsafe center; width: 25px; height:=
 1px; padding-top: 553px; margin-left: 568px;"><div style=3D"box-sizing: bo=
rder-box; font-size: 0; text-align: center; color: #ffffff; "><div style=3D=
"display: inline-block; font-size: 12px; font-family: &quot;Liberation Sans=
&quot;; color: light-dark(#ffffff, #121212); line-height: 1.2; pointer-even=
ts: all; font-weight: bold; white-space: normal; word-wrap: normal; "><font=
 data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daug=
hter">S</font></div></div></div></foreignObject><text x=3D"580" y=3D"556" f=
ill=3D"#ffffff" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12=
px" text-anchor=3D"middle" font-weight=3D"bold">S</text></switch></g></g></=
g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-273"><g><rect x=3D"540.5" y=3D"54=
0" width=3D"26.5" height=3D"25" rx=3D"3.75" ry=3D"3.75" fill=3D"#000000" st=
yle=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"none"=
 pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><swit=
ch><foreignObject style=3D"overflow: visible; text-align: left;" pointer-ev=
ents=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www=
.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/199=
9/xhtml" style=3D"display: flex; align-items: unsafe center; justify-conten=
t: unsafe center; width: 25px; height: 1px; padding-top: 553px; margin-left=
: 542px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: c=
enter; color: #ffffff; "><div style=3D"display: inline-block; font-size: 12=
px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#ffffff, #1=
21212); line-height: 1.2; pointer-events: all; font-weight: bold; white-spa=
ce: normal; word-wrap: normal; "><font data-font-src=3D"https://fonts.googl=
eapis.com/css?family=3DArchitects+Daughter">B</font></div></div></div></for=
eignObject><text x=3D"554" y=3D"556" fill=3D"#ffffff" font-family=3D"&quot;=
Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle" font-weigh=
t=3D"bold">B</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTyS=
JIbg-275"><g><rect x=3D"458.75" y=3D"540" width=3D"26.5" height=3D"25" rx=
=3D"3.75" ry=3D"3.75" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, =
0), rgb(237, 237, 237));" stroke=3D"none" pointer-events=3D"all"/></g><g><g=
 transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflo=
w: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" heigh=
t=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibi=
lity"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; a=
lign-items: unsafe center; justify-content: unsafe center; width: 25px; hei=
ght: 1px; padding-top: 553px; margin-left: 460px;"><div style=3D"box-sizing=
: border-box; font-size: 0; text-align: center; color: #ffffff; "><div styl=
e=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation =
Sans&quot;; color: light-dark(#ffffff, #121212); line-height: 1.2; pointer-=
events: all; font-weight: bold; white-space: normal; word-wrap: normal; "><=
font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+=
Daughter">T</font></div></div></div></foreignObject><text x=3D"472" y=3D"55=
6" fill=3D"#ffffff" font-family=3D"&quot;Liberation Sans&quot;" font-size=
=3D"12px" text-anchor=3D"middle" font-weight=3D"bold">T</text></switch></g>=
</g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-276"><g><rect x=3D"907" y=
=3D"790" width=3D"50" height=3D"25" rx=3D"3.75" ry=3D"3.75" fill=3D"#000000=
" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"n=
one" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><=
switch><foreignObject style=3D"overflow: visible; text-align: left;" pointe=
r-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http:/=
/www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org=
/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-co=
ntent: unsafe center; width: 48px; height: 1px; padding-top: 803px; margin-=
left: 908px;"><div style=3D"box-sizing: border-box; font-size: 0; text-alig=
n: center; color: #ffffff; "><div style=3D"display: inline-block; font-size=
: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#ffffff=
, #121212); line-height: 1.2; pointer-events: all; font-weight: bold; white=
-space: normal; word-wrap: normal; "><font data-font-src=3D"https://fonts.g=
oogleapis.com/css?family=3DArchitects+Daughter">libdir</font></div></div></=
div></foreignObject><text x=3D"932" y=3D"806" fill=3D"#ffffff" font-family=
=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle" =
font-weight=3D"bold">libdir</text></switch></g></g></g><g data-cell-id=3D"e=
V5wDCu3Df9HtTySJIbg-277"><g><rect x=3D"783.75" y=3D"790" width=3D"80" heigh=
t=3D"25" rx=3D"3.75" ry=3D"3.75" fill=3D"#000000" style=3D"fill: light-dark=
(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"none" pointer-events=3D"all"=
/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=
=3D"overflow: visible; text-align: left;" pointer-events=3D"none" width=3D"=
100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/featur=
e#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"displ=
ay: flex; align-items: unsafe center; justify-content: unsafe center; width=
: 78px; height: 1px; padding-top: 803px; margin-left: 785px;"><div style=3D=
"box-sizing: border-box; font-size: 0; text-align: center; color: #ffffff; =
"><div style=3D"display: inline-block; font-size: 12px; font-family: &quot;=
Liberation Sans&quot;; color: light-dark(#ffffff, #121212); line-height: 1.=
2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: =
normal; "><font data-font-src=3D"https://fonts.googleapis.com/css?family=3D=
Architects+Daughter">includedir</font></div></div></div></foreignObject><te=
xt x=3D"824" y=3D"806" fill=3D"#ffffff" font-family=3D"&quot;Liberation San=
s&quot;" font-size=3D"12px" text-anchor=3D"middle" font-weight=3D"bold">inc=
ludedir</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-=
279"><g><rect x=3D"1400.87" y=3D"570" width=3D"116.13" height=3D"25" rx=3D"=
3.75" ry=3D"3.75" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), =
rgb(237, 237, 237));" stroke=3D"none" pointer-events=3D"all"/></g><g><g tra=
nsform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: v=
isible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D=
"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility=
"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align=
-items: unsafe center; justify-content: unsafe center; width: 114px; height=
: 1px; padding-top: 583px; margin-left: 1402px;"><div style=3D"box-sizing: =
border-box; font-size: 0; text-align: center; color: #ffffff; "><div style=
=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation S=
ans&quot;; color: light-dark(#ffffff, #121212); line-height: 1.2; pointer-e=
vents: all; font-weight: bold; white-space: normal; word-wrap: normal; "><f=
ont data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+D=
aughter">RECIPE_SYSROOT</font></div></div></div></foreignObject><text x=3D"=
1459" y=3D"586" fill=3D"#ffffff" font-family=3D"&quot;Liberation Sans&quot;=
" font-size=3D"12px" text-anchor=3D"middle" font-weight=3D"bold">RECIPE_SYS=
ROOT</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-351=
"><g><path d=3D"M 1806.8 565 Q 1806.8 527.5 1799.35 527.5 Q 1791.9 527.5 17=
91.88 496.37" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(=
rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" stroke-dasharr=
ay=3D"3 3" pointer-events=3D"stroke"/><path d=3D"M 1791.88 491.12 L 1794.21=
 498.12 L 1791.88 496.37 L 1789.55 498.12 Z" fill=3D"#000000" style=3D"fill=
: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0=
, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" poi=
nter-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-281"><=
g><rect x=3D"1793.5" y=3D"565" width=3D"26.5" height=3D"25" rx=3D"3.75" ry=
=3D"3.75" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237,=
 237, 237));" stroke=3D"none" pointer-events=3D"all"/></g><g><g transform=
=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible=
; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%"=
 requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div=
 xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items=
: unsafe center; justify-content: unsafe center; width: 25px; height: 1px; =
padding-top: 578px; margin-left: 1795px;"><div style=3D"box-sizing: border-=
box; font-size: 0; text-align: center; color: #ffffff; "><div style=3D"disp=
lay: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot=
;; color: light-dark(#ffffff, #121212); line-height: 1.2; pointer-events: a=
ll; font-weight: bold; white-space: normal; word-wrap: normal; "><font data=
-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter"=
>S</font></div></div></div></foreignObject><text x=3D"1807" y=3D"581" fill=
=3D"#ffffff" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px"=
 text-anchor=3D"middle" font-weight=3D"bold">S</text></switch></g></g></g><=
g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-282"><g><rect x=3D"1767" y=3D"565" w=
idth=3D"26.5" height=3D"25" rx=3D"3.75" ry=3D"3.75" fill=3D"#000000" style=
=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"none" po=
inter-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch>=
<foreignObject style=3D"overflow: visible; text-align: left;" pointer-event=
s=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3=
.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/x=
html" style=3D"display: flex; align-items: unsafe center; justify-content: =
unsafe center; width: 25px; height: 1px; padding-top: 578px; margin-left: 1=
768px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: cen=
ter; color: #ffffff; "><div style=3D"display: inline-block; font-size: 12px=
; font-family: &quot;Liberation Sans&quot;; color: light-dark(#ffffff, #121=
212); line-height: 1.2; pointer-events: all; font-weight: bold; white-space=
: normal; word-wrap: normal; "><font data-font-src=3D"https://fonts.googlea=
pis.com/css?family=3DArchitects+Daughter">B</font></div></div></div></forei=
gnObject><text x=3D"1780" y=3D"581" fill=3D"#ffffff" font-family=3D"&quot;L=
iberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle" font-weight=
=3D"bold">B</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJ=
Ibg-283"><g><rect x=3D"1950.75" y=3D"565" width=3D"26.5" height=3D"25" rx=
=3D"3.75" ry=3D"3.75" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, =
0), rgb(237, 237, 237));" stroke=3D"none" pointer-events=3D"all"/></g><g><g=
 transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflo=
w: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" heigh=
t=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibi=
lity"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; a=
lign-items: unsafe center; justify-content: unsafe center; width: 25px; hei=
ght: 1px; padding-top: 578px; margin-left: 1952px;"><div style=3D"box-sizin=
g: border-box; font-size: 0; text-align: center; color: #ffffff; "><div sty=
le=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation=
 Sans&quot;; color: light-dark(#ffffff, #121212); line-height: 1.2; pointer=
-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">=
<font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects=
+Daughter">D</font></div></div></div></foreignObject><text x=3D"1964" y=3D"=
581" fill=3D"#ffffff" font-family=3D"&quot;Liberation Sans&quot;" font-size=
=3D"12px" text-anchor=3D"middle" font-weight=3D"bold">D</text></switch></g>=
</g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-284"><g><rect x=3D"1447" y=
=3D"395" width=3D"63" height=3D"25" rx=3D"3.75" ry=3D"3.75" fill=3D"#000000=
" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"n=
one" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><=
switch><foreignObject style=3D"overflow: visible; text-align: left;" pointe=
r-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http:/=
/www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org=
/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-co=
ntent: unsafe center; width: 61px; height: 1px; padding-top: 408px; margin-=
left: 1448px;"><div style=3D"box-sizing: border-box; font-size: 0; text-ali=
gn: center; color: #ffffff; "><div style=3D"display: inline-block; font-siz=
e: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#fffff=
f, #121212); line-height: 1.2; pointer-events: all; font-weight: bold; whit=
e-space: normal; word-wrap: normal; "><font data-font-src=3D"https://fonts.=
googleapis.com/css?family=3DArchitects+Daughter">WORKDIR</font></div></div>=
</div></foreignObject><text x=3D"1479" y=3D"411" fill=3D"#ffffff" font-fami=
ly=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle=
" font-weight=3D"bold">WORKDIR</text></switch></g></g></g><g data-cell-id=
=3D"eV5wDCu3Df9HtTySJIbg-287"><g><rect x=3D"1160" y=3D"920" width=3D"200" h=
eight=3D"30" fill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 238),=
 rgb(32, 32, 32)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192));=
" stroke=3D"#36393d" pointer-events=3D"all"/></g><g><g transform=3D"transla=
te(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-alig=
n: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFe=
atures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"h=
ttp://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe ce=
nter; justify-content: unsafe center; width: 1px; height: 1px; padding-top:=
 935px; margin-left: 1260px;"><div style=3D"box-sizing: border-box; font-si=
ze: 0; text-align: center; color: #000000; "><div style=3D"display: inline-=
block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: li=
ght-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-sp=
ace: nowrap; "><font data-font-src=3D"https://fonts.googleapis.com/css?fami=
ly=3DArchitects+Daughter">do_prepare_recipe_sysroot</font></div></div></div=
></foreignObject><text x=3D"1260" y=3D"939" fill=3D"light-dark(#000000, #ff=
ffff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-=
anchor=3D"middle">do_prepare_recipe_sysroot</text></switch></g></g></g><g d=
ata-cell-id=3D"eV5wDCu3Df9HtTySJIbg-292"><g><rect x=3D"1884" y=3D"855" widt=
h=3D"90" height=3D"27.5" rx=3D"4.13" ry=3D"4.13" fill=3D"#eeeeee" style=3D"=
fill: light-dark(rgb(238, 238, 238), rgb(32, 32, 32)); stroke: light-dark(r=
gb(54, 57, 61), rgb(186, 189, 192));" stroke=3D"#36393d" pointer-events=3D"=
all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject s=
tyle=3D"overflow: visible; text-align: left;" pointer-events=3D"none" width=
=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/fe=
ature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"d=
isplay: flex; align-items: unsafe center; justify-content: unsafe center; w=
idth: 88px; height: 1px; padding-top: 869px; margin-left: 1885px;"><div sty=
le=3D"box-sizing: border-box; font-size: 0; text-align: center; color: #000=
000; "><div style=3D"display: inline-block; font-size: 12px; font-family: &=
quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-heigh=
t: 1.2; pointer-events: all; white-space: normal; word-wrap: normal; ">sayh=
ello</div></div></div></foreignObject><text x=3D"1929" y=3D"872" fill=3D"li=
ght-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" fon=
t-size=3D"12px" text-anchor=3D"middle">sayhello</text></switch></g></g></g>=
<g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-293"><g><rect x=3D"1247" y=3D"660" =
width=3D"270" height=3D"240" rx=3D"36" ry=3D"36" fill=3D"none" stroke=3D"#0=
00000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stro=
ke-dasharray=3D"3 3" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5=
wDCu3Df9HtTySJIbg-294"><g><path d=3D"M 1309.1 720 Q 1309.1 740 1309.03 753.=
63" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, =
0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=3D"stroke=
"/><path d=3D"M 1309 758.88 L 1306.7 751.87 L 1309.03 753.63 L 1311.37 751.=
89 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255=
, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#=
000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-ce=
ll-id=3D"eV5wDCu3Df9HtTySJIbg-295"><g><path d=3D"M 1309 720 Q 1309 740 1368=
.75 740 Q 1428.5 740 1428.5 753.63" fill=3D"none" stroke=3D"#000000" style=
=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimi=
t=3D"10" pointer-events=3D"stroke"/><path d=3D"M 1428.5 758.88 L 1426.17 75=
1.88 L 1428.5 753.63 L 1430.83 751.88 Z" fill=3D"#000000" style=3D"fill: li=
ght-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0)=
, rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer=
-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-296"><g><r=
ect x=3D"1287.25" y=3D"680" width=3D"43.5" height=3D"40" rx=3D"6" ry=3D"6" =
fill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #1=
21212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#=
000000" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)=
"><switch><foreignObject style=3D"overflow: visible; text-align: left;" poi=
nter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"htt=
p://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.=
org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify=
-content: unsafe center; width: 42px; height: 1px; padding-top: 700px; marg=
in-left: 1288px;"><div style=3D"box-sizing: border-box; font-size: 0; text-=
align: center; color: #000000; "><div style=3D"display: inline-block; font-=
size: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#00=
0000, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal;=
 word-wrap: normal; "><font data-font-src=3D"https://fonts.googleapis.com/c=
ss?family=3DArchitects+Daughter">usr</font></div></div></div></foreignObjec=
t><text x=3D"1309" y=3D"704" fill=3D"light-dark(#000000, #ffffff)" font-fam=
ily=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middl=
e">usr</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-2=
97"><g><path d=3D"M 1308.99 800 L 1309 823.63" fill=3D"none" stroke=3D"#000=
000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=
-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 1309 828.88 L 13=
06.67 821.88 L 1309 823.63 L 1311.33 821.88 Z" fill=3D"#000000" style=3D"fi=
ll: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0,=
 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" p=
ointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-298"=
><g><rect x=3D"1282.12" y=3D"760" width=3D"53.75" height=3D"40" rx=3D"6" ry=
=3D"6" fill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-co=
lor, #121212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stro=
ke=3D"#000000" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.=
5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-align: lef=
t;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=
=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://=
www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; =
justify-content: unsafe center; width: 52px; height: 1px; padding-top: 780p=
x; margin-left: 1283px;"><div style=3D"box-sizing: border-box; font-size: 0=
; text-align: center; color: #000000; "><div style=3D"display: inline-block=
; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: light-d=
ark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-space: =
normal; word-wrap: normal; "><font data-font-src=3D"https://fonts.googleapi=
s.com/css?family=3DArchitects+Daughter">include</font></div></div></div></f=
oreignObject><text x=3D"1309" y=3D"784" fill=3D"light-dark(#000000, #ffffff=
)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anch=
or=3D"middle">include</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu=
3Df9HtTySJIbg-299"><g><path d=3D"M 1428.6 800 L 1428.6 810 Q 1428.6 820 142=
8.58 821.82 L 1428.56 823.63" fill=3D"none" stroke=3D"#000000" style=3D"str=
oke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10=
" pointer-events=3D"stroke"/><path d=3D"M 1428.51 828.88 L 1426.25 821.86 L=
 1428.56 823.63 L 1430.91 821.91 Z" fill=3D"#000000" style=3D"fill: light-d=
ark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb=
(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-even=
ts=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-300"><g><rect x=
=3D"1406.75" y=3D"760" width=3D"43.5" height=3D"40" rx=3D"6" ry=3D"6" fill=
=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #12121=
2)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#0000=
00" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><s=
witch><foreignObject style=3D"overflow: visible; text-align: left;" pointer=
-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://=
www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-con=
tent: unsafe center; width: 42px; height: 1px; padding-top: 780px; margin-l=
eft: 1408px;"><div style=3D"box-sizing: border-box; font-size: 0; text-alig=
n: center; color: #000000; "><div style=3D"display: inline-block; font-size=
: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#000000=
, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal; wor=
d-wrap: normal; "><font data-font-src=3D"https://fonts.googleapis.com/css?f=
amily=3DArchitects+Daughter">lib</font></div></div></div></foreignObject><t=
ext x=3D"1429" y=3D"784" fill=3D"light-dark(#000000, #ffffff)" font-family=
=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">=
lib</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-301"=
><g><rect x=3D"1269" y=3D"830" width=3D"80" height=3D"25" rx=3D"3.75" ry=3D=
"3.75" fill=3D"#f5f5f5" style=3D"fill: light-dark(rgb(245, 245, 245), rgb(2=
6, 26, 26)); stroke: light-dark(rgb(102, 102, 102), rgb(149, 149, 149));" s=
troke=3D"#666666" pointer-events=3D"all"/></g><g><g transform=3D"translate(=
-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-align: =
left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatu=
res=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http=
://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe cente=
r; justify-content: unsafe center; width: 78px; height: 1px; padding-top: 8=
43px; margin-left: 1270px;"><div style=3D"box-sizing: border-box; font-size=
: 0; text-align: center; color: #333333; "><div style=3D"display: inline-bl=
ock; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: ligh=
t-dark(#333333, #c1c1c1); line-height: 1.2; pointer-events: all; white-spac=
e: normal; word-wrap: normal; ">hellolib.h</div></div></div></foreignObject=
><text x=3D"1309" y=3D"846" fill=3D"#333333" font-family=3D"&quot;Liberatio=
n Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">hellolib.h</text></=
switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-302"><g><rect x=
=3D"1367" y=3D"837.5" width=3D"120" height=3D"20" rx=3D"3" ry=3D"3" fill=3D=
"#f5f5f5" style=3D"fill: light-dark(rgb(245, 245, 245), rgb(26, 26, 26)); s=
troke: light-dark(rgb(102, 102, 102), rgb(149, 149, 149));" stroke=3D"#6666=
66" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><s=
witch><foreignObject style=3D"overflow: visible; text-align: left;" pointer=
-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://=
www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-con=
tent: unsafe center; width: 118px; height: 1px; padding-top: 848px; margin-=
left: 1368px;"><div style=3D"box-sizing: border-box; font-size: 0; text-ali=
gn: center; color: #333333; "><div style=3D"display: inline-block; font-siz=
e: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#33333=
3, #c1c1c1); line-height: 1.2; pointer-events: all; white-space: normal; wo=
rd-wrap: normal; ">libhello.so.1</div></div></div></foreignObject><text x=
=3D"1427" y=3D"851" fill=3D"#333333" font-family=3D"&quot;Liberation Sans&q=
uot;" font-size=3D"12px" text-anchor=3D"middle">libhello.so.1</text></switc=
h></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-303"><g><rect x=3D"13=
67" y=3D"862.5" width=3D"120" height=3D"25" rx=3D"3.75" ry=3D"3.75" fill=3D=
"#f5f5f5" style=3D"fill: light-dark(rgb(245, 245, 245), rgb(26, 26, 26)); s=
troke: light-dark(rgb(102, 102, 102), rgb(149, 149, 149));" stroke=3D"#6666=
66" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><s=
witch><foreignObject style=3D"overflow: visible; text-align: left;" pointer=
-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://=
www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-con=
tent: unsafe center; width: 118px; height: 1px; padding-top: 875px; margin-=
left: 1368px;"><div style=3D"box-sizing: border-box; font-size: 0; text-ali=
gn: center; color: #333333; "><div style=3D"display: inline-block; font-siz=
e: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#33333=
3, #c1c1c1); line-height: 1.2; pointer-events: all; white-space: normal; wo=
rd-wrap: normal; ">libhello.so.1.0</div></div></div></foreignObject><text x=
=3D"1427" y=3D"879" fill=3D"#333333" font-family=3D"&quot;Liberation Sans&q=
uot;" font-size=3D"12px" text-anchor=3D"middle">libhello.so.1.0</text></swi=
tch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-304"><g><rect x=3D"=
1360" y=3D"830" width=3D"137" height=3D"62.5" fill=3D"none" stroke=3D"#0000=
00" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-=
dasharray=3D"3 3" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDC=
u3Df9HtTySJIbg-308"><g><rect x=3D"970" y=3D"420" width=3D"390" height=3D"70=
" fill=3D"none" stroke=3D"#36393d" style=3D"stroke: light-dark(rgb(54, 57, =
61), rgb(186, 189, 192));" stroke-dasharray=3D"3 3" pointer-events=3D"all"/=
></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=
=3D"overflow: visible; text-align: left;" pointer-events=3D"none" width=3D"=
100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/featur=
e#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"displ=
ay: flex; align-items: unsafe center; justify-content: unsafe center; width=
: 1px; height: 1px; padding-top: 455px; margin-left: 1165px;"><div style=3D=
"box-sizing: border-box; font-size: 0; text-align: center; color: #000000; =
"><div style=3D"display: inline-block; font-size: 12px; font-family: &quot;=
Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.=
2; pointer-events: all; white-space: nowrap; "><font data-font-src=3D"https=
://fonts.googleapis.com/css?family=3DArchitects+Daughter" style=3D"font-siz=
e: 15px;">This also contains other files from other=C2=A0<br />dependencies=
. Default dependencies are:<br />basically <b style=3D""><u>gcc</u></b>, <b=
 style=3D""><u>compilerlibs</u></b> and <b style=3D""><u style=3D"">libc</u=
></b></font></div></div></div></foreignObject><text x=3D"1165" y=3D"459" fi=
ll=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&qu=
ot;" font-size=3D"12px" text-anchor=3D"middle">This also contains other fil=
es from other...</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9H=
tTySJIbg-310"><g><rect x=3D"1092" y=3D"570" width=3D"127.5" height=3D"25" r=
x=3D"3.75" ry=3D"3.75" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0,=
 0), rgb(237, 237, 237));" stroke=3D"none" pointer-events=3D"all"/></g><g><=
g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overfl=
ow: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" heig=
ht=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensib=
ility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; =
align-items: unsafe center; justify-content: unsafe center; width: 126px; h=
eight: 1px; padding-top: 583px; margin-left: 1093px;"><div style=3D"box-siz=
ing: border-box; font-size: 0; text-align: center; color: #ffffff; "><div s=
tyle=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberati=
on Sans&quot;; color: light-dark(#ffffff, #121212); line-height: 1.2; point=
er-events: all; font-weight: bold; white-space: normal; word-wrap: normal; =
"><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitec=
ts+Daughter">SYSROOT_DESTDIR</font></div></div></div></foreignObject><text =
x=3D"1156" y=3D"586" fill=3D"#ffffff" font-family=3D"&quot;Liberation Sans&=
quot;" font-size=3D"12px" text-anchor=3D"middle" font-weight=3D"bold">SYSRO=
OT_DESTDIR</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJI=
bg-322"><g><path d=3D"M 82.5 240 L 280.4 240" fill=3D"none" stroke=3D"#0000=
00" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke-=
width=3D"3" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"=
M 287.15 240 L 278.15 244.5 L 280.4 240 L 278.15 235.5 Z" fill=3D"#000000" =
style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: light-=
dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"#000000" stroke-width=3D=
"3" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-i=
d=3D"eV5wDCu3Df9HtTySJIbg-323"><g><path d=3D"M 82.5 290 L 280.4 290" fill=
=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(=
237, 237, 237));" stroke-width=3D"3" stroke-miterlimit=3D"10" pointer-event=
s=3D"stroke"/><path d=3D"M 287.15 290 L 278.15 294.5 L 280.4 290 L 278.15 2=
85.5 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 2=
37, 237)); stroke: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D=
"#000000" stroke-width=3D"3" stroke-miterlimit=3D"10" pointer-events=3D"all=
"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-314"><g><rect x=3D"0.5" =
y=3D"215" width=3D"82" height=3D"100" rx=3D"12.3" ry=3D"12.3" fill=3D"#0000=
00" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: li=
ght-dark(rgb(35, 68, 93), rgb(160, 188, 210));" stroke=3D"#23445d" pointer-=
events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><forei=
gnObject style=3D"overflow: visible; text-align: left;" pointer-events=3D"n=
one" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/T=
R/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" =
style=3D"display: flex; align-items: unsafe center; justify-content: unsafe=
 center; width: 80px; height: 1px; padding-top: 265px; margin-left: 2px;"><=
div style=3D"box-sizing: border-box; font-size: 0; text-align: center; colo=
r: #000000; "><div style=3D"display: inline-block; font-size: 12px; font-fa=
mily: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); lin=
e-height: 1.2; pointer-events: all; white-space: normal; word-wrap: normal;=
 "><font color=3D"#fcfcfc" style=3D"color: light-dark(rgb(252, 252, 252), r=
gb(20, 20, 20));">Github</font></div></div></div></foreignObject><text x=3D=
"42" y=3D"269" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;L=
iberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">Github</tex=
t></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-316"><g><rec=
t x=3D"133.75" y=3D"225" width=3D"80" height=3D"30" fill=3D"#eeeeee" style=
=3D"fill: light-dark(rgb(238, 238, 238), rgb(32, 32, 32)); stroke: light-da=
rk(rgb(54, 57, 61), rgb(186, 189, 192));" stroke=3D"#36393d" pointer-events=
=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObje=
ct style=3D"overflow: visible; text-align: left;" pointer-events=3D"none" w=
idth=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG1=
1/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 1px; height: 1px; padding-top: 240px; margin-left: 174px;"><div =
style=3D"box-sizing: border-box; font-size: 0; text-align: center; color: #=
000000; "><div style=3D"display: inline-block; font-size: 12px; font-family=
: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-he=
ight: 1.2; pointer-events: all; white-space: nowrap; "><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">do_fetch=
<br /></font></div></div></div></foreignObject><text x=3D"174" y=3D"244" fi=
ll=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&qu=
ot;" font-size=3D"12px" text-anchor=3D"middle">do_fetch&#xa;</text></switch=
></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-317"><g><ellipse cx=3D=
"118.75" cy=3D"240" rx=3D"15" ry=3D"15" fill=3D"#000000" style=3D"fill: lig=
ht-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: light-dark(rgb(86, 81, 1=
26), rgb(164, 160, 198));" stroke=3D"#56517e" pointer-events=3D"all"/></g><=
g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"ove=
rflow: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" h=
eight=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Exten=
sibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: fle=
x; align-items: unsafe center; justify-content: unsafe center; width: 28px;=
 height: 1px; padding-top: 240px; margin-left: 105px;"><div style=3D"box-si=
zing: border-box; font-size: 0; text-align: center; color: #000000; "><div =
style=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberat=
ion Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; poin=
ter-events: all; white-space: normal; word-wrap: normal; "><font data-font-=
src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter" color=
=3D"#ffffff" size=3D"1" style=3D"color: light-dark(rgb(255, 255, 255), rgb(=
18, 18, 18));"><b style=3D"font-size: 15px;">1</b></font></div></div></div>=
</foreignObject><text x=3D"119" y=3D"244" fill=3D"light-dark(#000000, #ffff=
ff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-an=
chor=3D"middle">1</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9=
HtTySJIbg-326"><g><rect x=3D"133.75" y=3D"275" width=3D"80" height=3D"30" f=
ill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 238), rgb(32, 32, 3=
2)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192));" stroke=3D"#3=
6393d" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"=
><switch><foreignObject style=3D"overflow: visible; text-align: left;" poin=
ter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http=
://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.o=
rg/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-=
content: unsafe center; width: 1px; height: 1px; padding-top: 290px; margin=
-left: 174px;"><div style=3D"box-sizing: border-box; font-size: 0; text-ali=
gn: center; color: #000000; "><div style=3D"display: inline-block; font-siz=
e: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#00000=
0, #ffffff); line-height: 1.2; pointer-events: all; white-space: nowrap; ">=
<font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects=
+Daughter">do_fetch<br /></font></div></div></div></foreignObject><text x=
=3D"174" y=3D"294" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&qu=
ot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">do_fetc=
h&#xa;</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-3=
27"><g><ellipse cx=3D"118.75" cy=3D"290" rx=3D"15" ry=3D"15" fill=3D"#00000=
0" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: lig=
ht-dark(rgb(86, 81, 126), rgb(164, 160, 198));" stroke=3D"#56517e" pointer-=
events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><forei=
gnObject style=3D"overflow: visible; text-align: left;" pointer-events=3D"n=
one" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/T=
R/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" =
style=3D"display: flex; align-items: unsafe center; justify-content: unsafe=
 center; width: 28px; height: 1px; padding-top: 290px; margin-left: 105px;"=
><div style=3D"box-sizing: border-box; font-size: 0; text-align: center; co=
lor: #000000; "><div style=3D"display: inline-block; font-size: 12px; font-=
family: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); l=
ine-height: 1.2; pointer-events: all; white-space: normal; word-wrap: norma=
l; "><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchi=
tects+Daughter" color=3D"#ffffff" size=3D"1" style=3D"color: light-dark(rgb=
(255, 255, 255), rgb(18, 18, 18));"><b style=3D"font-size: 15px;">5</b></fo=
nt></div></div></div></foreignObject><text x=3D"119" y=3D"294" fill=3D"ligh=
t-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-=
size=3D"12px" text-anchor=3D"middle">5</text></switch></g></g></g><g data-c=
ell-id=3D"eV5wDCu3Df9HtTySJIbg-331"><g><rect x=3D"1557" y=3D"745" width=3D"=
110" height=3D"30" fill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238,=
 238), rgb(32, 32, 32)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, =
192));" stroke=3D"#36393d" pointer-events=3D"all"/></g><g><g transform=3D"t=
ranslate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; tex=
t-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requ=
iredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmln=
s=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: uns=
afe center; justify-content: unsafe center; width: 1px; height: 1px; paddin=
g-top: 760px; margin-left: 1612px;"><div style=3D"box-sizing: border-box; f=
ont-size: 0; text-align: center; color: #000000; "><div style=3D"display: i=
nline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; col=
or: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; wh=
ite-space: nowrap; "><font data-font-src=3D"https://fonts.googleapis.com/cs=
s?family=3DArchitects+Daughter">do_configure<br /></font></div></div></div>=
</foreignObject><text x=3D"1612" y=3D"764" fill=3D"light-dark(#000000, #fff=
fff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-a=
nchor=3D"middle">do_configure&#xa;</text></switch></g></g></g><g data-cell-=
id=3D"eV5wDCu3Df9HtTySJIbg-332"><g><ellipse cx=3D"1542" cy=3D"760" rx=3D"15=
" ry=3D"15" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(23=
7, 237, 237)); stroke: light-dark(rgb(86, 81, 126), rgb(164, 160, 198));" s=
troke=3D"#56517e" pointer-events=3D"all"/></g><g><g transform=3D"translate(=
-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-align: =
left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatu=
res=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http=
://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe cente=
r; justify-content: unsafe center; width: 28px; height: 1px; padding-top: 7=
60px; margin-left: 1528px;"><div style=3D"box-sizing: border-box; font-size=
: 0; text-align: center; color: #000000; "><div style=3D"display: inline-bl=
ock; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: ligh=
t-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-spac=
e: normal; word-wrap: normal; "><font data-font-src=3D"https://fonts.google=
apis.com/css?family=3DArchitects+Daughter" color=3D"#ffffff" size=3D"1" sty=
le=3D"color: light-dark(rgb(255, 255, 255), rgb(18, 18, 18));"><b style=3D"=
font-size: 15px;">12</b></font></div></div></div></foreignObject><text x=3D=
"1542" y=3D"764" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot=
;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">12</text>=
</switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-333"><g><rect =
x=3D"1577" y=3D"777.5" width=3D"90" height=3D"30" fill=3D"#eeeeee" style=3D=
"fill: light-dark(rgb(238, 238, 238), rgb(32, 32, 32)); stroke: light-dark(=
rgb(54, 57, 61), rgb(186, 189, 192));" stroke=3D"#36393d" pointer-events=3D=
"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject =
style=3D"overflow: visible; text-align: left;" pointer-events=3D"none" widt=
h=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/f=
eature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"=
display: flex; align-items: unsafe center; justify-content: unsafe center; =
width: 1px; height: 1px; padding-top: 793px; margin-left: 1622px;"><div sty=
le=3D"box-sizing: border-box; font-size: 0; text-align: center; color: #000=
000; "><div style=3D"display: inline-block; font-size: 12px; font-family: &=
quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-heigh=
t: 1.2; pointer-events: all; white-space: nowrap; "><font data-font-src=3D"=
https://fonts.googleapis.com/css?family=3DArchitects+Daughter">do_compile<b=
r /></font></div></div></div></foreignObject><text x=3D"1622" y=3D"796" fil=
l=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quo=
t;" font-size=3D"12px" text-anchor=3D"middle">do_compile&#xa;</text></switc=
h></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-334"><g><ellipse cx=
=3D"1562" cy=3D"792.5" rx=3D"15" ry=3D"15" fill=3D"#000000" style=3D"fill: =
light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: light-dark(rgb(86, 81=
, 126), rgb(164, 160, 198));" stroke=3D"#56517e" pointer-events=3D"all"/></=
g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"=
overflow: visible; text-align: left;" pointer-events=3D"none" width=3D"100%=
" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Ex=
tensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: =
flex; align-items: unsafe center; justify-content: unsafe center; width: 28=
px; height: 1px; padding-top: 793px; margin-left: 1548px;"><div style=3D"bo=
x-sizing: border-box; font-size: 0; text-align: center; color: #000000; "><=
div style=3D"display: inline-block; font-size: 12px; font-family: &quot;Lib=
eration Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; =
pointer-events: all; white-space: normal; word-wrap: normal; "><font data-f=
ont-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter" c=
olor=3D"#ffffff" size=3D"1" style=3D"color: light-dark(rgb(255, 255, 255), =
rgb(18, 18, 18));"><b style=3D"font-size: 15px;">13</b></font></div></div><=
/div></foreignObject><text x=3D"1562" y=3D"796" fill=3D"light-dark(#000000,=
 #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" t=
ext-anchor=3D"middle">13</text></switch></g></g></g><g data-cell-id=3D"eV5w=
DCu3Df9HtTySJIbg-340"><g><rect x=3D"627" y=3D"225" width=3D"90" height=3D"3=
0" fill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 238), rgb(32, 3=
2, 32)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192));" stroke=
=3D"#36393d" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 =
-0.5)"><switch><foreignObject style=3D"overflow: visible; text-align: left;=
" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=
=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://=
www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; =
justify-content: unsafe center; width: 1px; height: 1px; padding-top: 240px=
; margin-left: 672px;"><div style=3D"box-sizing: border-box; font-size: 0; =
text-align: center; color: #000000; "><div style=3D"display: inline-block; =
font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dar=
k(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-space: no=
wrap; "><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DAr=
chitects+Daughter">do_unpack<br /></font></div></div></div></foreignObject>=
<text x=3D"672" y=3D"244" fill=3D"light-dark(#000000, #ffffff)" font-family=
=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">=
do_unpack&#xa;</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtT=
ySJIbg-341"><g><ellipse cx=3D"612" cy=3D"240" rx=3D"15" ry=3D"15" fill=3D"#=
000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke=
: light-dark(rgb(86, 81, 126), rgb(164, 160, 198));" stroke=3D"#56517e" poi=
nter-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><=
foreignObject style=3D"overflow: visible; text-align: left;" pointer-events=
=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.=
org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xh=
tml" style=3D"display: flex; align-items: unsafe center; justify-content: u=
nsafe center; width: 28px; height: 1px; padding-top: 240px; margin-left: 59=
8px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: cente=
r; color: #000000; "><div style=3D"display: inline-block; font-size: 12px; =
font-family: &quot;Liberation Sans&quot;; color: light-dark(#000000, #fffff=
f); line-height: 1.2; pointer-events: all; white-space: normal; word-wrap: =
normal; "><font data-font-src=3D"https://fonts.googleapis.com/css?family=3D=
Architects+Daughter" color=3D"#ffffff" size=3D"1" style=3D"color: light-dar=
k(rgb(255, 255, 255), rgb(18, 18, 18));"><b style=3D"font-size: 15px;">2</b=
></font></div></div></div></foreignObject><text x=3D"612" y=3D"244" fill=3D=
"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" =
font-size=3D"12px" text-anchor=3D"middle">2</text></switch></g></g></g><g d=
ata-cell-id=3D"eV5wDCu3Df9HtTySJIbg-349"><g><path d=3D"M 1462 130 Q 1462 15=
0 1462.07 148.64" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-d=
ark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-ev=
ents=3D"stroke"/><path d=3D"M 1461.81 153.88 L 1458.66 146.72 L 1462.07 148=
.64 L 1465.65 147.07 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0=
, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 2=
55));" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/>=
</g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-438"><g><path d=3D"M 1462 1=
30 Q 1462 140 1398.15 140 Q 1334.3 140 1334.27 148.63" fill=3D"none" stroke=
=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));=
" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 1334.25 =
153.88 L 1330.78 146.87 L 1334.27 148.63 L 1337.78 146.89 Z" fill=3D"#00000=
0" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: lig=
ht-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miter=
limit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9=
HtTySJIbg-439"><g><path d=3D"M 1462 130 Q 1462 140 1527 140 Q 1592 140 1592=
 148.63" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0=
, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=3D"s=
troke"/><path d=3D"M 1592 153.88 L 1588.5 146.88 L 1592 148.63 L 1595.5 146=
.88 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 25=
5, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"=
#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-c=
ell-id=3D"eV5wDCu3Df9HtTySJIbg-343"><g><rect x=3D"1427" y=3D"90" width=3D"7=
0" height=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-da=
rk(#ffffff, var(--ge-dark-color, #121212)); stroke: light-dark(rgb(0, 0, 0)=
, rgb(255, 255, 255));" stroke=3D"#000000" pointer-events=3D"all"/></g><g><=
g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overfl=
ow: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" heig=
ht=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensib=
ility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; =
align-items: unsafe center; justify-content: unsafe center; width: 68px; he=
ight: 1px; padding-top: 110px; margin-left: 1428px;"><div style=3D"box-sizi=
ng: border-box; font-size: 0; text-align: center; color: #000000; "><div st=
yle=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberatio=
n Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; pointe=
r-events: all; white-space: normal; word-wrap: normal; "><font data-font-sr=
c=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">conf</f=
ont></div></div></div></foreignObject><text x=3D"1462" y=3D"114" fill=3D"li=
ght-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" fon=
t-size=3D"12px" text-anchor=3D"middle">conf</text></switch></g></g></g><g d=
ata-cell-id=3D"utO5BPZsFb6q0V3ioqD--26"><g><path d=3D"M 1287.25 165 Q 1277 =
165 1277 127.5 Q 1277 90 1313 90 Q 1349 90 1349 51.37" fill=3D"none" stroke=
=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));=
" stroke-miterlimit=3D"10" stroke-dasharray=3D"3 3" pointer-events=3D"strok=
e"/><path d=3D"M 1349 46.12 L 1351.33 53.12 L 1349 51.37 L 1346.67 53.12 Z"=
 fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255=
)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#00000=
0" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=
=3D"eV5wDCu3Df9HtTySJIbg-345"><g><rect x=3D"1287.25" y=3D"155" width=3D"94"=
 height=3D"20" rx=3D"3" ry=3D"3" fill=3D"#eeeeee" style=3D"fill: light-dark=
(rgb(238, 238, 238), rgb(32, 32, 32)); stroke: light-dark(rgb(54, 57, 61), =
rgb(186, 189, 192));" stroke=3D"#36393d" pointer-events=3D"all"/></g><g><g =
transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow=
: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=
=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibil=
ity"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; al=
ign-items: unsafe center; justify-content: unsafe center; width: 92px; heig=
ht: 1px; padding-top: 165px; margin-left: 1288px;"><div style=3D"box-sizing=
: border-box; font-size: 0; text-align: center; color: #000000; "><div styl=
e=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation =
Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; pointer-=
events: all; white-space: normal; word-wrap: normal; ">local.conf</div></di=
v></div></foreignObject><text x=3D"1334" y=3D"169" fill=3D"light-dark(#0000=
00, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px=
" text-anchor=3D"middle">local.conf</text></switch></g></g></g><g data-cell=
-id=3D"utO5BPZsFb6q0V3ioqD--24"><g><path d=3D"M 1461.8 175 Q 1461.8 215 151=
1.9 215 Q 1562 215 1562 248.63" fill=3D"none" stroke=3D"#000000" style=3D"s=
troke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"=
10" stroke-dasharray=3D"3 3" pointer-events=3D"stroke"/><path d=3D"M 1562 2=
53.88 L 1559.67 246.88 L 1562 248.63 L 1564.33 246.88 Z" fill=3D"#000000" s=
tyle=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-d=
ark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimi=
t=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTy=
SJIbg-346"><g><rect x=3D"1406.75" y=3D"155" width=3D"110" height=3D"20" rx=
=3D"3" ry=3D"3" fill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 23=
8), rgb(32, 32, 32)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192=
));" stroke=3D"#36393d" pointer-events=3D"all"/></g><g><g transform=3D"tran=
slate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-a=
lign: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" require=
dFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsa=
fe center; justify-content: unsafe center; width: 108px; height: 1px; paddi=
ng-top: 165px; margin-left: 1408px;"><div style=3D"box-sizing: border-box; =
font-size: 0; text-align: center; color: #000000; "><div style=3D"display: =
inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; co=
lor: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; w=
hite-space: normal; word-wrap: normal; ">bblayers.conf</div></div></div></f=
oreignObject><text x=3D"1462" y=3D"169" fill=3D"light-dark(#000000, #ffffff=
)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anch=
or=3D"middle">bblayers.conf</text></switch></g></g></g><g data-cell-id=3D"e=
V5wDCu3Df9HtTySJIbg-350"><g><rect x=3D"1676.75" y=3D"340" width=3D"230.25" =
height=3D"150" fill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge=
-dark-color, #121212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)=
);" stroke=3D"#000000" stroke-dasharray=3D"3 3" pointer-events=3D"all"/></g=
><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"o=
verflow: visible; text-align: left;" pointer-events=3D"none" width=3D"100%"=
 height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Ext=
ensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: f=
lex; align-items: unsafe center; justify-content: unsafe center; width: 228=
px; height: 1px; padding-top: 415px; margin-left: 1678px;"><div style=3D"bo=
x-sizing: border-box; font-size: 0; text-align: center; color: #000000; "><=
div style=3D"display: inline-block; font-size: 12px; font-family: &quot;Lib=
eration Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; =
pointer-events: all; white-space: normal; word-wrap: normal; "><font style=
=3D"font-size: 15px;"><b><u>S</u></b> defaults generally to <b><u>${UNPACKD=
IR}/${BP}</u></b><br /></font></div></div></div></foreignObject><text x=3D"=
1792" y=3D"419" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;=
Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">S defaults=
 generally to ${UNPACKDIR}/$...</text></switch></g></g></g><g data-cell-id=
=3D"eV5wDCu3Df9HtTySJIbg-352"><g><rect x=3D"1557" y=3D"675" width=3D"110" h=
eight=3D"40" fill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 238),=
 rgb(32, 32, 32)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192));=
" stroke=3D"#36393d" pointer-events=3D"all"/></g><g><g transform=3D"transla=
te(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-alig=
n: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFe=
atures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"h=
ttp://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe ce=
nter; justify-content: unsafe center; width: 1px; height: 1px; padding-top:=
 695px; margin-left: 1612px;"><div style=3D"box-sizing: border-box; font-si=
ze: 0; text-align: center; color: #000000; "><div style=3D"display: inline-=
block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: li=
ght-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-sp=
ace: nowrap; "><font data-font-src=3D"https://fonts.googleapis.com/css?fami=
ly=3DArchitects+Daughter">do_patch<br /><i>(No patches)</i><br /></font></d=
iv></div></div></foreignObject><text x=3D"1612" y=3D"699" fill=3D"light-dar=
k(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=
=3D"12px" text-anchor=3D"middle">do_patch...</text></switch></g></g></g><g =
data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-353"><g><ellipse cx=3D"1542" cy=3D"695=
" rx=3D"15" ry=3D"15" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, =
0), rgb(237, 237, 237)); stroke: light-dark(rgb(86, 81, 126), rgb(164, 160,=
 198));" stroke=3D"#56517e" pointer-events=3D"all"/></g><g><g transform=3D"=
translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; te=
xt-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" req=
uiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xml=
ns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: un=
safe center; justify-content: unsafe center; width: 28px; height: 1px; padd=
ing-top: 695px; margin-left: 1528px;"><div style=3D"box-sizing: border-box;=
 font-size: 0; text-align: center; color: #000000; "><div style=3D"display:=
 inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; c=
olor: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; =
white-space: normal; word-wrap: normal; "><font data-font-src=3D"https://fo=
nts.googleapis.com/css?family=3DArchitects+Daughter" color=3D"#ffffff" size=
=3D"1" style=3D"color: light-dark(rgb(255, 255, 255), rgb(18, 18, 18));"><b=
 style=3D"font-size: 15px;">3</b></font></div></div></div></foreignObject><=
text x=3D"1542" y=3D"699" fill=3D"light-dark(#000000, #ffffff)" font-family=
=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">=
3</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-354"><=
g><ellipse cx=3D"1145" cy=3D"935" rx=3D"15" ry=3D"15" fill=3D"#000000" styl=
e=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: light-dark=
(rgb(86, 81, 126), rgb(164, 160, 198));" stroke=3D"#56517e" pointer-events=
=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObje=
ct style=3D"overflow: visible; text-align: left;" pointer-events=3D"none" w=
idth=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG1=
1/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 28px; height: 1px; padding-top: 935px; margin-left: 1131px;"><di=
v style=3D"box-sizing: border-box; font-size: 0; text-align: center; color:=
 #000000; "><div style=3D"display: inline-block; font-size: 12px; font-fami=
ly: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-=
height: 1.2; pointer-events: all; white-space: normal; word-wrap: normal; "=
><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitect=
s+Daughter" color=3D"#ffffff" size=3D"1" style=3D"color: light-dark(rgb(255=
, 255, 255), rgb(18, 18, 18));"><b style=3D"font-size: 15px;">4</b></font><=
/div></div></div></foreignObject><text x=3D"1145" y=3D"939" fill=3D"light-d=
ark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-siz=
e=3D"12px" text-anchor=3D"middle">4</text></switch></g></g></g><g data-cell=
-id=3D"eV5wDCu3Df9HtTySJIbg-356"><g><rect x=3D"1731.75" y=3D"890" width=3D"=
90" height=3D"30" fill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, =
238), rgb(32, 32, 32)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 1=
92));" stroke=3D"#36393d" pointer-events=3D"all"/></g><g><g transform=3D"tr=
anslate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text=
-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requi=
redFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsa=
fe center; justify-content: unsafe center; width: 1px; height: 1px; padding=
-top: 905px; margin-left: 1777px;"><div style=3D"box-sizing: border-box; fo=
nt-size: 0; text-align: center; color: #000000; "><div style=3D"display: in=
line-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; colo=
r: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; whi=
te-space: nowrap; "><font data-font-src=3D"https://fonts.googleapis.com/css=
?family=3DArchitects+Daughter">do_install<br /></font></div></div></div></f=
oreignObject><text x=3D"1777" y=3D"909" fill=3D"light-dark(#000000, #ffffff=
)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anch=
or=3D"middle">do_install&#xa;</text></switch></g></g></g><g data-cell-id=3D=
"eV5wDCu3Df9HtTySJIbg-357"><g><ellipse cx=3D"1717" cy=3D"905" rx=3D"15" ry=
=3D"15" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 2=
37, 237)); stroke: light-dark(rgb(86, 81, 126), rgb(164, 160, 198));" strok=
e=3D"#56517e" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5=
 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-align: left=
;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=
=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://=
www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; =
justify-content: unsafe center; width: 28px; height: 1px; padding-top: 905p=
x; margin-left: 1703px;"><div style=3D"box-sizing: border-box; font-size: 0=
; text-align: center; color: #000000; "><div style=3D"display: inline-block=
; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: light-d=
ark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-space: =
normal; word-wrap: normal; "><font data-font-src=3D"https://fonts.googleapi=
s.com/css?family=3DArchitects+Daughter" color=3D"#ffffff" size=3D"1" style=
=3D"color: light-dark(rgb(255, 255, 255), rgb(18, 18, 18));"><b style=3D"fo=
nt-size: 15px;">14</b></font></div></div></div></foreignObject><text x=3D"1=
717" y=3D"909" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;L=
iberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">14</text></=
switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-362"><g><path d=
=3D"M 2088.51 580 L 2088.51 653.63" fill=3D"none" stroke=3D"#000000" style=
=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimi=
t=3D"10" pointer-events=3D"stroke"/><path d=3D"M 2088.51 658.88 L 2086.17 6=
51.88 L 2088.51 653.63 L 2090.84 651.88 Z" fill=3D"#000000" style=3D"fill: =
light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, =
0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" point=
er-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-358"><g>=
<rect x=3D"2057" y=3D"540" width=3D"63" height=3D"40" rx=3D"6" ry=3D"6" fil=
l=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #1212=
12)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000=
000" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><=
switch><foreignObject style=3D"overflow: visible; text-align: left;" pointe=
r-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http:/=
/www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org=
/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-co=
ntent: unsafe center; width: 61px; height: 1px; padding-top: 560px; margin-=
left: 2058px;"><div style=3D"box-sizing: border-box; font-size: 0; text-ali=
gn: center; color: #000000; "><div style=3D"display: inline-block; font-siz=
e: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#00000=
0, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal; wo=
rd-wrap: normal; "><font data-font-src=3D"https://fonts.googleapis.com/css?=
family=3DArchitects+Daughter">package</font></div></div></div></foreignObje=
ct><text x=3D"2089" y=3D"564" fill=3D"light-dark(#000000, #ffffff)" font-fa=
mily=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"midd=
le">package</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJ=
Ibg-359"><g><rect x=3D"2110.26" y=3D"565" width=3D"36.74" height=3D"25" rx=
=3D"3.75" ry=3D"3.75" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, =
0), rgb(237, 237, 237));" stroke=3D"none" pointer-events=3D"all"/></g><g><g=
 transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflo=
w: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" heigh=
t=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibi=
lity"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; a=
lign-items: unsafe center; justify-content: unsafe center; width: 35px; hei=
ght: 1px; padding-top: 578px; margin-left: 2111px;"><div style=3D"box-sizin=
g: border-box; font-size: 0; text-align: center; color: #ffffff; "><div sty=
le=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation=
 Sans&quot;; color: light-dark(#ffffff, #121212); line-height: 1.2; pointer=
-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">=
<font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects=
+Daughter">PKGD</font></div></div></div></foreignObject><text x=3D"2129" y=
=3D"581" fill=3D"#ffffff" font-family=3D"&quot;Liberation Sans&quot;" font-=
size=3D"12px" text-anchor=3D"middle" font-weight=3D"bold">PKGD</text></swit=
ch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-384"><g><path d=3D"M=
 2115.44 900 Q 2115.4 940 2196.2 940 Q 2277 940 2277 910.1" fill=3D"none" s=
troke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(237, 237, 2=
37));" stroke-width=3D"3" stroke-miterlimit=3D"10" pointer-events=3D"stroke=
"/><path d=3D"M 2277 903.35 L 2281.5 912.35 L 2277 910.1 L 2272.5 912.35 Z"=
 fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237=
)); stroke: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"#00000=
0" stroke-width=3D"3" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g>=
</g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-361"><g><rect x=3D"2034.63" y=
=3D"660" width=3D"107.75" height=3D"240" rx=3D"16.16" ry=3D"16.16" fill=3D"=
#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 238), rgb(32, 32, 32)); st=
roke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192));" stroke=3D"#36393d" =
stroke-dasharray=3D"3 3" pointer-events=3D"all"/></g><g><g transform=3D"tra=
nslate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-=
align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requir=
edFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsa=
fe center; justify-content: unsafe center; width: 106px; height: 1px; paddi=
ng-top: 780px; margin-left: 2036px;"><div style=3D"box-sizing: border-box; =
font-size: 0; text-align: center; color: #000000; "><div style=3D"display: =
inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; co=
lor: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; w=
hite-space: normal; word-wrap: normal; ">A copy of=C2=A0<b>${D}<br /></b>ex=
cluding<br /><b>/sysroot-only</b></div></div></div></foreignObject><text x=
=3D"2089" y=3D"784" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&q=
uot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">A copy=
 of=C2=A0${D}...</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9H=
tTySJIbg-364"><g><rect x=3D"1990.24" y=3D"920" width=3D"90" height=3D"30" f=
ill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 238), rgb(32, 32, 3=
2)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192));" stroke=3D"#3=
6393d" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"=
><switch><foreignObject style=3D"overflow: visible; text-align: left;" poin=
ter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http=
://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.o=
rg/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-=
content: unsafe center; width: 1px; height: 1px; padding-top: 935px; margin=
-left: 2035px;"><div style=3D"box-sizing: border-box; font-size: 0; text-al=
ign: center; color: #000000; "><div style=3D"display: inline-block; font-si=
ze: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#0000=
00, #ffffff); line-height: 1.2; pointer-events: all; white-space: nowrap; "=
><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitect=
s+Daughter">do_package<br /></font></div></div></div></foreignObject><text =
x=3D"2035" y=3D"939" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&=
quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">do_pa=
ckage&#xa;</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJI=
bg-365"><g><ellipse cx=3D"1975.49" cy=3D"935" rx=3D"15" ry=3D"15" fill=3D"#=
000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke=
: light-dark(rgb(86, 81, 126), rgb(164, 160, 198));" stroke=3D"#56517e" poi=
nter-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><=
foreignObject style=3D"overflow: visible; text-align: left;" pointer-events=
=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.=
org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xh=
tml" style=3D"display: flex; align-items: unsafe center; justify-content: u=
nsafe center; width: 28px; height: 1px; padding-top: 935px; margin-left: 19=
61px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: cent=
er; color: #000000; "><div style=3D"display: inline-block; font-size: 12px;=
 font-family: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffff=
ff); line-height: 1.2; pointer-events: all; white-space: normal; word-wrap:=
 normal; "><font data-font-src=3D"https://fonts.googleapis.com/css?family=
=3DArchitects+Daughter" color=3D"#ffffff" size=3D"1" style=3D"color: light-=
dark(rgb(255, 255, 255), rgb(18, 18, 18));"><b style=3D"font-size: 15px;">1=
5</b></font></div></div></div></foreignObject><text x=3D"1975" y=3D"939" fi=
ll=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&qu=
ot;" font-size=3D"12px" text-anchor=3D"middle">15</text></switch></g></g></=
g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-381"><g><path d=3D"M 2277 580 L 2=
277 653.63" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rg=
b(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=
=3D"stroke"/><path d=3D"M 2277 658.88 L 2274.67 651.88 L 2277 653.63 L 2279=
.33 651.88 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(=
255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" str=
oke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g=
 data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-366"><g><rect x=3D"2217" y=3D"540" wi=
dth=3D"120" height=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"fill:=
 light-dark(#ffffff, var(--ge-dark-color, #121212)); stroke: light-dark(rgb=
(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" pointer-events=3D"all"/=
></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=
=3D"overflow: visible; text-align: left;" pointer-events=3D"none" width=3D"=
100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/featur=
e#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"displ=
ay: flex; align-items: unsafe center; justify-content: unsafe center; width=
: 118px; height: 1px; padding-top: 560px; margin-left: 2218px;"><div style=
=3D"box-sizing: border-box; font-size: 0; text-align: center; color: #00000=
0; "><div style=3D"display: inline-block; font-size: 12px; font-family: &qu=
ot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-height:=
 1.2; pointer-events: all; white-space: normal; word-wrap: normal; "><font =
data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daugh=
ter">packages-split</font></div></div></div></foreignObject><text x=3D"2277=
" y=3D"564" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Libe=
ration Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">packages-split=
</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-367"><g=
><rect x=3D"2327" y=3D"565" width=3D"60" height=3D"25" rx=3D"3.75" ry=3D"3.=
75" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, =
237));" stroke=3D"none" pointer-events=3D"all"/></g><g><g transform=3D"tran=
slate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-a=
lign: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" require=
dFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsa=
fe center; justify-content: unsafe center; width: 58px; height: 1px; paddin=
g-top: 578px; margin-left: 2328px;"><div style=3D"box-sizing: border-box; f=
ont-size: 0; text-align: center; color: #ffffff; "><div style=3D"display: i=
nline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; col=
or: light-dark(#ffffff, #121212); line-height: 1.2; pointer-events: all; fo=
nt-weight: bold; white-space: normal; word-wrap: normal; "><font data-font-=
src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">PKGDE=
ST</font></div></div></div></foreignObject><text x=3D"2357" y=3D"581" fill=
=3D"#ffffff" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px"=
 text-anchor=3D"middle" font-weight=3D"bold">PKGDEST</text></switch></g></g=
></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-377"><g><path d=3D"M 2277 710 =
L 2277 723.63" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark=
(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-event=
s=3D"stroke"/><path d=3D"M 2277 728.88 L 2274.67 721.88 L 2277 723.63 L 227=
9.33 721.88 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb=
(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" st=
roke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><=
g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-369"><g><rect x=3D"2245.5" y=3D"670"=
 width=3D"63" height=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"fil=
l: light-dark(#ffffff, var(--ge-dark-color, #121212)); stroke: light-dark(r=
gb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" pointer-events=3D"all=
"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject styl=
e=3D"overflow: visible; text-align: left;" pointer-events=3D"none" width=3D=
"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/featu=
re#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"disp=
lay: flex; align-items: unsafe center; justify-content: unsafe center; widt=
h: 61px; height: 1px; padding-top: 690px; margin-left: 2247px;"><div style=
=3D"box-sizing: border-box; font-size: 0; text-align: center; color: #00000=
0; "><div style=3D"display: inline-block; font-size: 12px; font-family: &qu=
ot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-height:=
 1.2; pointer-events: all; white-space: normal; word-wrap: normal; "><font =
data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daugh=
ter">sayhello</font></div></div></div></foreignObject><text x=3D"2277" y=3D=
"694" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation=
 Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">sayhello</text></swi=
tch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-372"><g><path d=3D"=
M 2277.1 770 L 2277.1 780 Q 2277.1 790 2277.09 790.57 L 2277.08 791.13" fil=
l=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb=
(255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><pat=
h d=3D"M 2277.01 796.38 L 2274.78 789.35 L 2277.08 791.13 L 2279.44 789.42 =
Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 2=
55)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000=
000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-=
id=3D"eV5wDCu3Df9HtTySJIbg-373"><g><rect x=3D"2255.25" y=3D"730" width=3D"4=
3.5" height=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-=
dark(#ffffff, var(--ge-dark-color, #121212)); stroke: light-dark(rgb(0, 0, =
0), rgb(255, 255, 255));" stroke=3D"#000000" pointer-events=3D"all"/></g><g=
><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"over=
flow: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" he=
ight=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extens=
ibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex=
; align-items: unsafe center; justify-content: unsafe center; width: 42px; =
height: 1px; padding-top: 750px; margin-left: 2256px;"><div style=3D"box-si=
zing: border-box; font-size: 0; text-align: center; color: #000000; "><div =
style=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberat=
ion Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; poin=
ter-events: all; white-space: normal; word-wrap: normal; "><font data-font-=
src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">usr</=
font></div></div></div></foreignObject><text x=3D"2277" y=3D"754" fill=3D"l=
ight-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" fo=
nt-size=3D"12px" text-anchor=3D"middle">usr</text></switch></g></g></g><g d=
ata-cell-id=3D"eV5wDCu3Df9HtTySJIbg-374"><g><path d=3D"M 2276.99 837.5 L 22=
76.99 853.63" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(=
rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=
=3D"stroke"/><path d=3D"M 2276.99 858.88 L 2274.66 851.88 L 2276.99 853.63 =
L 2279.33 851.88 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0)=
, rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255))=
;" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g>=
</g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-375"><g><rect x=3D"2250.12" y=
=3D"797.5" width=3D"53.75" height=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff"=
 style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #121212)); stroke:=
 light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" pointer-=
events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><forei=
gnObject style=3D"overflow: visible; text-align: left;" pointer-events=3D"n=
one" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/T=
R/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" =
style=3D"display: flex; align-items: unsafe center; justify-content: unsafe=
 center; width: 52px; height: 1px; padding-top: 818px; margin-left: 2251px;=
"><div style=3D"box-sizing: border-box; font-size: 0; text-align: center; c=
olor: #000000; "><div style=3D"display: inline-block; font-size: 12px; font=
-family: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); =
line-height: 1.2; pointer-events: all; white-space: normal; word-wrap: norm=
al; "><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArch=
itects+Daughter">bin</font></div></div></div></foreignObject><text x=3D"227=
7" y=3D"821" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Lib=
eration Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">bin</text></s=
witch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-382"><g><rect x=
=3D"1922.37" y=3D"340" width=3D"321.75" height=3D"148.75" fill=3D"#ffffff" =
style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #121212)); stroke: =
light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-da=
sharray=3D"3 3" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0=
.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-align: le=
ft;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeature=
s=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http:/=
/www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center;=
 justify-content: unsafe center; width: 320px; height: 1px; padding-top: 41=
4px; margin-left: 1923px;"><div style=3D"box-sizing: border-box; font-size:=
 0; text-align: center; color: #000000; "><div style=3D"display: inline-blo=
ck; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: light=
-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-space=
: normal; word-wrap: normal; "><span style=3D"font-size: 15px;">Folders cre=
ated here are present in <b><u>PACKAGES</u></b> variable, BitBake knows wha=
t and where to put things using the <b><u>FILES</u></b> variable, example: =
<b><u>FILES:${PN}</u></b> files will go to <b><u>${PN}</u></b>=C2=A0folder =
which is in <b><u>PACKAGES</u></b></span></div></div></div></foreignObject>=
<text x=3D"2083" y=3D"418" fill=3D"light-dark(#000000, #ffffff)" font-famil=
y=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle"=
>Folders created here are present in PACKAGES variable...</text></switch></=
g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-385"><g><rect x=3D"2160.1=
2" y=3D"920" width=3D"90" height=3D"30" fill=3D"#eeeeee" style=3D"fill: lig=
ht-dark(rgb(238, 238, 238), rgb(32, 32, 32)); stroke: light-dark(rgb(54, 57=
, 61), rgb(186, 189, 192));" stroke=3D"#36393d" pointer-events=3D"all"/></g=
><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"o=
verflow: visible; text-align: left;" pointer-events=3D"none" width=3D"100%"=
 height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Ext=
ensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: f=
lex; align-items: unsafe center; justify-content: unsafe center; width: 1px=
; height: 1px; padding-top: 935px; margin-left: 2205px;"><div style=3D"box-=
sizing: border-box; font-size: 0; text-align: center; color: #000000; "><di=
v style=3D"display: inline-block; font-size: 12px; font-family: &quot;Liber=
ation Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; po=
inter-events: all; white-space: nowrap; "><font data-font-src=3D"https://fo=
nts.googleapis.com/css?family=3DArchitects+Daughter">do_package<br /></font=
></div></div></div></foreignObject><text x=3D"2205" y=3D"939" fill=3D"light=
-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-s=
ize=3D"12px" text-anchor=3D"middle">do_package&#xa;</text></switch></g></g>=
</g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-386"><g><ellipse cx=3D"2145.37"=
 cy=3D"935" rx=3D"15" ry=3D"15" fill=3D"#000000" style=3D"fill: light-dark(=
rgb(0, 0, 0), rgb(237, 237, 237)); stroke: light-dark(rgb(86, 81, 126), rgb=
(164, 160, 198));" stroke=3D"#56517e" pointer-events=3D"all"/></g><g><g tra=
nsform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: v=
isible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D=
"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility=
"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align=
-items: unsafe center; justify-content: unsafe center; width: 28px; height:=
 1px; padding-top: 935px; margin-left: 2131px;"><div style=3D"box-sizing: b=
order-box; font-size: 0; text-align: center; color: #000000; "><div style=
=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation S=
ans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; pointer-e=
vents: all; white-space: normal; word-wrap: normal; "><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter" color=3D=
"#ffffff" size=3D"1" style=3D"color: light-dark(rgb(255, 255, 255), rgb(18,=
 18, 18));"><b style=3D"font-size: 15px;">16</b></font></div></div></div></=
foreignObject><text x=3D"2145" y=3D"939" fill=3D"light-dark(#000000, #fffff=
f)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anc=
hor=3D"middle">16</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9=
HtTySJIbg-390"><g><path d=3D"M 2497 580 L 2497 668.63" fill=3D"none" stroke=
=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));=
" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path d=3D"M 2497 673=
.88 L 2494.67 666.88 L 2497 668.63 L 2499.33 666.88 Z" fill=3D"#000000" sty=
le=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dar=
k(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=
=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTyS=
JIbg-387"><g><rect x=3D"2437" y=3D"540" width=3D"120" height=3D"40" rx=3D"6=
" ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dar=
k-color, #121212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" =
stroke=3D"#000000" pointer-events=3D"all"/></g><g><g transform=3D"translate=
(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-align:=
 left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeat=
ures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"htt=
p://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe cent=
er; justify-content: unsafe center; width: 118px; height: 1px; padding-top:=
 560px; margin-left: 2438px;"><div style=3D"box-sizing: border-box; font-si=
ze: 0; text-align: center; color: #000000; "><div style=3D"display: inline-=
block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: li=
ght-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-sp=
ace: normal; word-wrap: normal; "><font data-font-src=3D"https://fonts.goog=
leapis.com/css?family=3DArchitects+Daughter">deploy-<b><i>pkg</i></b></font=
></div></div></div></foreignObject><text x=3D"2497" y=3D"564" fill=3D"light=
-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-s=
ize=3D"12px" text-anchor=3D"middle">deploy-pkg</text></switch></g></g></g><=
g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-396"><g><path d=3D"M 2497 715 L 2497=
 753.63" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0=
, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=3D"s=
troke"/><path d=3D"M 2497 758.88 L 2494.67 751.88 L 2497 753.63 L 2499.33 7=
51.88 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, =
255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=
=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g da=
ta-cell-id=3D"eV5wDCu3Df9HtTySJIbg-389"><g><rect x=3D"2437" y=3D"675" width=
=3D"120" height=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"fill: li=
ght-dark(#ffffff, var(--ge-dark-color, #121212)); stroke: light-dark(rgb(0,=
 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" pointer-events=3D"all"/></=
g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"=
overflow: visible; text-align: left;" pointer-events=3D"none" width=3D"100%=
" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Ex=
tensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: =
flex; align-items: unsafe center; justify-content: unsafe center; width: 11=
8px; height: 1px; padding-top: 695px; margin-left: 2438px;"><div style=3D"b=
ox-sizing: border-box; font-size: 0; text-align: center; color: #000000; ">=
<div style=3D"display: inline-block; font-size: 12px; font-family: &quot;Li=
beration Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2;=
 pointer-events: all; white-space: normal; word-wrap: normal; "><font data-=
font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daughter">=
<b>${PACKAGE_ARCH}</b></font></div></div></div></foreignObject><text x=3D"2=
497" y=3D"699" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;L=
iberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">${PACKAGE_A=
RCH}</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-393=
"><g><rect x=3D"2257" y=3D"340" width=3D"410" height=3D"148.75" fill=3D"#ff=
ffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #121212)); st=
roke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" str=
oke-dasharray=3D"3 3" pointer-events=3D"all"/></g><g><g transform=3D"transl=
ate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-ali=
gn: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredF=
eatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"=
http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe c=
enter; justify-content: unsafe center; width: 408px; height: 1px; padding-t=
op: 414px; margin-left: 2258px;"><div style=3D"box-sizing: border-box; font=
-size: 0; text-align: center; color: #000000; "><div style=3D"display: inli=
ne-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color:=
 light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white=
-space: normal; word-wrap: normal; "><font style=3D"font-size: 15px;">This =
can be <b><u>rpms</u></b>, <b><u>debs</u></b> or <b><u>ipks</u></b>.<br />T=
hese are provided by<br /><b><u>package_rpm</u></b>, <b><u>package_deb</u><=
/b> and <b><u>package_ipk</u></b> classes respectively, use <b><u>PACKAGE_C=
LASSES</u></b> for that as<br />content of <b><u>PACKAGE_CLASSES</u></b> wi=
ll be appended<br />to <b><u>INHERIT</u></b><br /></font></div></div></div>=
</foreignObject><text x=3D"2462" y=3D"418" fill=3D"light-dark(#000000, #fff=
fff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-a=
nchor=3D"middle">This can be rpms, debs or ipks....</text></switch></g></g>=
</g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-415"><g><path d=3D"M 2630.5 776=
.25 L 2677 776.29 Q 2687 776.3 2687 766.3 L 2687 330 Q 2687 320 2677 320 L =
1838.5 320 Q 1828.5 320 1828.5 310 L 1828.5 295.1" fill=3D"none" stroke=3D"=
#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" st=
roke-width=3D"3" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><path =
d=3D"M 1828.5 288.35 L 1833 297.35 L 1828.5 295.1 L 1824 297.35 Z" fill=3D"=
#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); strok=
e: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"#000000" stroke=
-width=3D"3" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g da=
ta-cell-id=3D"eV5wDCu3Df9HtTySJIbg-395"><g><rect x=3D"2363.5" y=3D"760" wid=
th=3D"267" height=3D"32.5" rx=3D"4.88" ry=3D"4.88" fill=3D"#eeeeee" style=
=3D"fill: light-dark(rgb(238, 238, 238), rgb(32, 32, 32)); stroke: light-da=
rk(rgb(54, 57, 61), rgb(186, 189, 192));" stroke=3D"#36393d" pointer-events=
=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObje=
ct style=3D"overflow: visible; text-align: left;" pointer-events=3D"none" w=
idth=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG1=
1/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 265px; height: 1px; padding-top: 776px; margin-left: 2365px;"><d=
iv style=3D"box-sizing: border-box; font-size: 0; text-align: center; color=
: #000000; "><div style=3D"display: inline-block; font-size: 12px; font-fam=
ily: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line=
-height: 1.2; pointer-events: all; white-space: normal; word-wrap: normal; =
">sayhello-0.1-r0.${PACKAGE_ARCH}.<i>pkg</i></div></div></div></foreignObje=
ct><text x=3D"2497" y=3D"780" fill=3D"light-dark(#000000, #ffffff)" font-fa=
mily=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"midd=
le">sayhello-0.1-r0.${PACKAGE_ARCH}.pkg</text></switch></g></g></g><g data-=
cell-id=3D"eV5wDCu3Df9HtTySJIbg-397"><g><rect x=3D"2697" y=3D"660" width=3D=
"370" height=3D"170" fill=3D"none" stroke=3D"#36393d" style=3D"stroke: ligh=
t-dark(rgb(54, 57, 61), rgb(186, 189, 192));" stroke-dasharray=3D"3 3" poin=
ter-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><f=
oreignObject style=3D"overflow: visible; text-align: left;" pointer-events=
=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.=
org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xh=
tml" style=3D"display: flex; align-items: unsafe center; justify-content: u=
nsafe center; width: 368px; height: 1px; padding-top: 745px; margin-left: 2=
698px;"><div style=3D"box-sizing: border-box; font-size: 0; text-align: cen=
ter; color: #000000; "><div style=3D"display: inline-block; font-size: 12px=
; font-family: &quot;Liberation Sans&quot;; color: light-dark(#000000, #fff=
fff); line-height: 1.2; pointer-events: all; white-space: normal; word-wrap=
: normal; "><font style=3D"font-size: 15px;">This task also depends on <b><=
u>PACKAGE_CLASSES</u></b>,<br /><b><u><i>pkg</i></u></b>=C2=A0can be <b><u>=
rpm</u></b>, <b><u>deb</u></b> or <b><u>ipk</u></b> for <b><u>package_rpm</=
u></b>,<br /><b><u>package_deb</u></b> or <u style=3D"font-weight: bold;">p=
ackage_ipk</u>=C2=A0respectively.<br />The generated package generally name=
d using:<br /><b><u>${PN}</u></b>, <b><u>${PR}</u></b>, <b><u>${PACKAGE_ARC=
H}</u></b> and=C2=A0<b><u><i>pkg</i></u></b><br /></font></div></div></div>=
</foreignObject><text x=3D"2882" y=3D"749" fill=3D"light-dark(#000000, #fff=
fff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-a=
nchor=3D"middle">This task also depends on PACKAGE_CLASSES,...</text></swit=
ch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-404"><g><path d=3D"M=
 1828.5 130 L 1828.5 163.63" fill=3D"none" stroke=3D"#000000" style=3D"stro=
ke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10"=
 pointer-events=3D"stroke"/><path d=3D"M 1828.5 168.88 L 1825 161.88 L 1828=
.5 163.63 L 1832 161.88 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0=
, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255=
, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all=
"/></g></g><g data-cell-id=3D"utO5BPZsFb6q0V3ioqD--21"><g><path d=3D"M 1863=
.5 110 Q 1863.5 110 1935.63 110" fill=3D"none" stroke=3D"#000000" style=3D"=
stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D=
"10" stroke-dasharray=3D"3 3" pointer-events=3D"stroke"/><path d=3D"M 1940.=
88 110 L 1933.88 112.33 L 1935.63 110 L 1933.88 107.67 Z" fill=3D"#000000" =
style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-=
dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlim=
it=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtT=
ySJIbg-401"><g><rect x=3D"1793.5" y=3D"90" width=3D"70" height=3D"40" rx=3D=
"6" ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-d=
ark-color, #121212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));=
" stroke=3D"#000000" pointer-events=3D"all"/></g><g><g transform=3D"transla=
te(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-alig=
n: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFe=
atures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"h=
ttp://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe ce=
nter; justify-content: unsafe center; width: 68px; height: 1px; padding-top=
: 110px; margin-left: 1795px;"><div style=3D"box-sizing: border-box; font-s=
ize: 0; text-align: center; color: #000000; "><div style=3D"display: inline=
-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: l=
ight-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-s=
pace: normal; word-wrap: normal; "><font data-font-src=3D"https://fonts.goo=
gleapis.com/css?family=3DArchitects+Daughter">deploy</font></div></div></di=
v></foreignObject><text x=3D"1829" y=3D"114" fill=3D"light-dark(#000000, #f=
fffff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text=
-anchor=3D"middle">deploy</text></switch></g></g></g><g data-cell-id=3D"eV5=
wDCu3Df9HtTySJIbg-414"><g><path d=3D"M 1828.5 210 L 1828.5 220 Q 1828.5 230=
 1828.5 227.5 L 1828.5 226.25 Q 1828.5 225 1828.5 231.82 L 1828.5 238.63" f=
ill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), r=
gb(255, 255, 255));" stroke-miterlimit=3D"10" pointer-events=3D"stroke"/><p=
ath d=3D"M 1828.5 243.88 L 1825 236.88 L 1828.5 238.63 L 1832 236.88 Z" fil=
l=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); =
stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" s=
troke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"=
eV5wDCu3Df9HtTySJIbg-403"><g><rect x=3D"1763.62" y=3D"170" width=3D"129.75"=
 height=3D"40" rx=3D"6" ry=3D"6" fill=3D"#ffffff" style=3D"fill: light-dark=
(#ffffff, var(--ge-dark-color, #121212)); stroke: light-dark(rgb(0, 0, 0), =
rgb(255, 255, 255));" stroke=3D"#000000" pointer-events=3D"all"/></g><g><g =
transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow=
: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=
=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibil=
ity"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; al=
ign-items: unsafe center; justify-content: unsafe center; width: 128px; hei=
ght: 1px; padding-top: 190px; margin-left: 1765px;"><div style=3D"box-sizin=
g: border-box; font-size: 0; text-align: center; color: #000000; "><div sty=
le=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberation=
 Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; pointer=
-events: all; white-space: normal; word-wrap: normal; "><b>${DEPLOY_DIR_<i>=
pkg</i>}</b></div></div></div></foreignObject><text x=3D"1828" y=3D"194" fi=
ll=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&qu=
ot;" font-size=3D"12px" text-anchor=3D"middle">${DEPLOY_DIR_pkg}</text></sw=
itch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-408"><g><rect x=3D=
"2372" y=3D"920" width=3D"150" height=3D"30" fill=3D"#eeeeee" style=3D"fill=
: light-dark(rgb(238, 238, 238), rgb(32, 32, 32)); stroke: light-dark(rgb(5=
4, 57, 61), rgb(186, 189, 192));" stroke=3D"#36393d" pointer-events=3D"all"=
/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=
=3D"overflow: visible; text-align: left;" pointer-events=3D"none" width=3D"=
100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/featur=
e#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"displ=
ay: flex; align-items: unsafe center; justify-content: unsafe center; width=
: 1px; height: 1px; padding-top: 935px; margin-left: 2447px;"><div style=3D=
"box-sizing: border-box; font-size: 0; text-align: center; color: #000000; =
"><div style=3D"display: inline-block; font-size: 12px; font-family: &quot;=
Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.=
2; pointer-events: all; white-space: nowrap; "><font data-font-src=3D"https=
://fonts.googleapis.com/css?family=3DArchitects+Daughter">do_package_write_=
<i>pkg</i><br /></font></div></div></div></foreignObject><text x=3D"2447" y=
=3D"939" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberat=
ion Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">do_package_write_=
pkg&#xa;</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg=
-409"><g><ellipse cx=3D"2352" cy=3D"935" rx=3D"15" ry=3D"15" fill=3D"#00000=
0" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: lig=
ht-dark(rgb(86, 81, 126), rgb(164, 160, 198));" stroke=3D"#56517e" pointer-=
events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><forei=
gnObject style=3D"overflow: visible; text-align: left;" pointer-events=3D"n=
one" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/T=
R/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" =
style=3D"display: flex; align-items: unsafe center; justify-content: unsafe=
 center; width: 28px; height: 1px; padding-top: 935px; margin-left: 2338px;=
"><div style=3D"box-sizing: border-box; font-size: 0; text-align: center; c=
olor: #000000; "><div style=3D"display: inline-block; font-size: 12px; font=
-family: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); =
line-height: 1.2; pointer-events: all; white-space: normal; word-wrap: norm=
al; "><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArch=
itects+Daughter" color=3D"#ffffff" size=3D"1" style=3D"color: light-dark(rg=
b(255, 255, 255), rgb(18, 18, 18));"><b style=3D"font-size: 15px;">17</b></=
font></div></div></div></foreignObject><text x=3D"2352" y=3D"939" fill=3D"l=
ight-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" fo=
nt-size=3D"12px" text-anchor=3D"middle">17</text></switch></g></g></g><g da=
ta-cell-id=3D"utO5BPZsFb6q0V3ioqD--11"><g><path d=3D"M 2512 935 Q 2882 935 =
2882 836.37" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(r=
gb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" stroke-dasharra=
y=3D"3 3" pointer-events=3D"stroke"/><path d=3D"M 2882 831.12 L 2884.33 838=
.12 L 2882 836.37 L 2879.67 838.12 Z" fill=3D"#000000" style=3D"fill: light=
-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), r=
gb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-ev=
ents=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-413"><g><rect=
 x=3D"1768.5" y=3D"245" width=3D"120" height=3D"40" rx=3D"6" ry=3D"6" fill=
=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #12121=
2)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#0000=
00" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><s=
witch><foreignObject style=3D"overflow: visible; text-align: left;" pointer=
-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://=
www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify-con=
tent: unsafe center; width: 118px; height: 1px; padding-top: 265px; margin-=
left: 1770px;"><div style=3D"box-sizing: border-box; font-size: 0; text-ali=
gn: center; color: #000000; "><div style=3D"display: inline-block; font-siz=
e: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#00000=
0, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal; wo=
rd-wrap: normal; ">${PACKAGE_ARCH}</div></div></div></foreignObject><text x=
=3D"1829" y=3D"269" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&q=
uot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">${PACK=
AGE_ARCH}</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIb=
g-416"><g><rect x=3D"1942" y=3D"168.13" width=3D"415" height=3D"41.87" fill=
=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #12121=
2)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#0000=
00" stroke-dasharray=3D"3 3" pointer-events=3D"all"/></g><g><g transform=3D=
"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; t=
ext-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" re=
quiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xm=
lns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: u=
nsafe center; justify-content: unsafe center; width: 413px; height: 1px; pa=
dding-top: 189px; margin-left: 1943px;"><div style=3D"box-sizing: border-bo=
x; font-size: 0; text-align: center; color: #000000; "><div style=3D"displa=
y: inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;;=
 color: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all=
; white-space: normal; word-wrap: normal; "><font style=3D"font-size: 15px;=
">For packages, this can be <b><u>IPK</u></b>, <b><u>RPM</u></b> or <b><u>D=
EB</u></b> (<i>check step 17</i>)</font></div></div></div></foreignObject><=
text x=3D"2150" y=3D"193" fill=3D"light-dark(#000000, #ffffff)" font-family=
=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">=
For packages, this can be IPK, RPM or DEB (check step 17)</text></switch></=
g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-417"><g><rect x=3D"1842.3=
7" y=3D"120" width=3D"80" height=3D"25" rx=3D"3.75" ry=3D"3.75" fill=3D"#00=
0000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=
=3D"none" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.=
5)"><switch><foreignObject style=3D"overflow: visible; text-align: left;" p=
ointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"h=
ttp://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w=
3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justi=
fy-content: unsafe center; width: 78px; height: 1px; padding-top: 133px; ma=
rgin-left: 1843px;"><div style=3D"box-sizing: border-box; font-size: 0; tex=
t-align: center; color: #ffffff; "><div style=3D"display: inline-block; fon=
t-size: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#=
ffffff, #121212); line-height: 1.2; pointer-events: all; font-weight: bold;=
 white-space: normal; word-wrap: normal; "><font data-font-src=3D"https://f=
onts.googleapis.com/css?family=3DArchitects+Daughter">DEPLOY_DIR</font></di=
v></div></div></foreignObject><text x=3D"1882" y=3D"136" fill=3D"#ffffff" f=
ont-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=
=3D"middle" font-weight=3D"bold">DEPLOY_DIR</text></switch></g></g></g><g d=
ata-cell-id=3D"eV5wDCu3Df9HtTySJIbg-418"><g><rect x=3D"1247" y=3D"20" width=
=3D"60" height=3D"25" rx=3D"3.75" ry=3D"3.75" fill=3D"#000000" style=3D"fil=
l: light-dark(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"none" pointer-e=
vents=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreig=
nObject style=3D"overflow: visible; text-align: left;" pointer-events=3D"no=
ne" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR=
/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" s=
tyle=3D"display: flex; align-items: unsafe center; justify-content: unsafe =
center; width: 58px; height: 1px; padding-top: 33px; margin-left: 1248px;">=
<div style=3D"box-sizing: border-box; font-size: 0; text-align: center; col=
or: #ffffff; "><div style=3D"display: inline-block; font-size: 12px; font-f=
amily: &quot;Liberation Sans&quot;; color: light-dark(#ffffff, #121212); li=
ne-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal=
; word-wrap: normal; "><font data-font-src=3D"https://fonts.googleapis.com/=
css?family=3DArchitects+Daughter">TMPDIR</font></div></div></div></foreignO=
bject><text x=3D"1277" y=3D"36" fill=3D"#ffffff" font-family=3D"&quot;Liber=
ation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle" font-weight=3D"=
bold">TMPDIR</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTyS=
JIbg-419"><g><rect x=3D"417" y=3D"120" width=3D"62.68" height=3D"25" rx=3D"=
3.75" ry=3D"3.75" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), =
rgb(237, 237, 237));" stroke=3D"none" pointer-events=3D"all"/></g><g><g tra=
nsform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: v=
isible; text-align: left;" pointer-events=3D"none" width=3D"100%" height=3D=
"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility=
"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align=
-items: unsafe center; justify-content: unsafe center; width: 61px; height:=
 1px; padding-top: 133px; margin-left: 418px;"><div style=3D"box-sizing: bo=
rder-box; font-size: 0; text-align: center; color: #ffffff; "><div style=3D=
"display: inline-block; font-size: 12px; font-family: &quot;Liberation Sans=
&quot;; color: light-dark(#ffffff, #121212); line-height: 1.2; pointer-even=
ts: all; font-weight: bold; white-space: normal; word-wrap: normal; "><font=
 data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitects+Daug=
hter">DL_DIR</font></div></div></div></foreignObject><text x=3D"448" y=3D"1=
36" fill=3D"#ffffff" font-family=3D"&quot;Liberation Sans&quot;" font-size=
=3D"12px" text-anchor=3D"middle" font-weight=3D"bold">DL_DIR</text></switch=
></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-422"><g><path d=3D"M 1=
893.37 190 L 1907.7 190 Q 1917.7 190 1926.67 189.65 L 1935.64 189.31" fill=
=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(=
255, 255, 255));" stroke-miterlimit=3D"10" stroke-dasharray=3D"3 3" pointer=
-events=3D"stroke"/><path d=3D"M 1940.88 189.11 L 1933.98 191.71 L 1935.64 =
189.31 L 1933.8 187.05 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0,=
 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255,=
 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"=
/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-424"><g><rect x=3D"2622" =
y=3D"595" width=3D"150" height=3D"30" fill=3D"#eeeeee" style=3D"fill: light=
-dark(rgb(238, 238, 238), rgb(32, 32, 32)); stroke: light-dark(rgb(54, 57, =
61), rgb(186, 189, 192));" stroke=3D"#36393d" pointer-events=3D"all"/></g><=
g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"ove=
rflow: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" h=
eight=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Exten=
sibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: fle=
x; align-items: unsafe center; justify-content: unsafe center; width: 1px; =
height: 1px; padding-top: 610px; margin-left: 2697px;"><div style=3D"box-si=
zing: border-box; font-size: 0; text-align: center; color: #000000; "><div =
style=3D"display: inline-block; font-size: 12px; font-family: &quot;Liberat=
ion Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; poin=
ter-events: all; white-space: nowrap; "><font data-font-src=3D"https://font=
s.googleapis.com/css?family=3DArchitects+Daughter">do_package_write_<i>pkg<=
/i><br /></font></div></div></div></foreignObject><text x=3D"2697" y=3D"614=
" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation San=
s&quot;" font-size=3D"12px" text-anchor=3D"middle">do_package_write_pkg&#xa=
;</text></switch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-425"><=
g><ellipse cx=3D"2602" cy=3D"610" rx=3D"15" ry=3D"15" fill=3D"#000000" styl=
e=3D"fill: light-dark(rgb(0, 0, 0), rgb(237, 237, 237)); stroke: light-dark=
(rgb(86, 81, 126), rgb(164, 160, 198));" stroke=3D"#56517e" pointer-events=
=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObje=
ct style=3D"overflow: visible; text-align: left;" pointer-events=3D"none" w=
idth=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG1=
1/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 28px; height: 1px; padding-top: 610px; margin-left: 2588px;"><di=
v style=3D"box-sizing: border-box; font-size: 0; text-align: center; color:=
 #000000; "><div style=3D"display: inline-block; font-size: 12px; font-fami=
ly: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-=
height: 1.2; pointer-events: all; white-space: normal; word-wrap: normal; "=
><font data-font-src=3D"https://fonts.googleapis.com/css?family=3DArchitect=
s+Daughter" color=3D"#ffffff" size=3D"1" style=3D"color: light-dark(rgb(255=
, 255, 255), rgb(18, 18, 18));"><b style=3D"font-size: 15px;">18</b></font>=
</div></div></div></foreignObject><text x=3D"2602" y=3D"614" fill=3D"light-=
dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" font-si=
ze=3D"12px" text-anchor=3D"middle">18</text></switch></g></g></g><g data-ce=
ll-id=3D"utO5BPZsFb6q0V3ioqD--8"><g><path d=3D"M 2567 577.5 Q 2720 577.5 27=
20 499.75 Q 2720 422 2719.68 285.12" fill=3D"none" stroke=3D"#000000" style=
=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimi=
t=3D"10" stroke-dasharray=3D"3 3" pointer-events=3D"stroke"/><path d=3D"M 2=
719.66 279.87 L 2722.01 286.86 L 2719.68 285.12 L 2717.35 286.87 Z" fill=3D=
"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stro=
ke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" strok=
e-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5w=
DCu3Df9HtTySJIbg-427"><g><rect x=3D"2537" y=3D"565" width=3D"30" height=3D"=
25" rx=3D"3.75" ry=3D"3.75" fill=3D"#000000" style=3D"fill: light-dark(rgb(=
0, 0, 0), rgb(237, 237, 237));" stroke=3D"none" pointer-events=3D"all"/></g=
></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-428"><g><path d=3D"M 2522 550 =
Q 2522 519.4 2543.25 519.4 Q 2564.5 519.4 2564.5 495.12" fill=3D"none" stro=
ke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)=
);" stroke-miterlimit=3D"10" stroke-dasharray=3D"3 3" pointer-events=3D"str=
oke"/><path d=3D"M 2564.5 489.87 L 2566.83 496.87 L 2564.5 495.12 L 2562.17=
 496.87 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(255=
, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=
=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g da=
ta-cell-id=3D"eV5wDCu3Df9HtTySJIbg-429"><g><rect x=3D"2407" y=3D"201.25" wi=
dth=3D"416.88" height=3D"77.5" fill=3D"#ffffff" style=3D"fill: light-dark(#=
ffffff, var(--ge-dark-color, #121212)); stroke: light-dark(rgb(0, 0, 0), rg=
b(255, 255, 255));" stroke=3D"#000000" stroke-dasharray=3D"3 3" pointer-eve=
nts=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignO=
bject style=3D"overflow: visible; text-align: left;" pointer-events=3D"none=
" width=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/S=
VG11/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" sty=
le=3D"display: flex; align-items: unsafe center; justify-content: unsafe ce=
nter; width: 415px; height: 1px; padding-top: 240px; margin-left: 2408px;">=
<div style=3D"box-sizing: border-box; font-size: 0; text-align: center; col=
or: #000000; "><div style=3D"display: inline-block; font-size: 12px; font-f=
amily: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); li=
ne-height: 1.2; pointer-events: all; white-space: normal; word-wrap: normal=
; "><font style=3D"font-size: 15px;">This can be <b><u>PKGWRITEDIRRPM</u></=
b>, <b><u>PKGWRITEDIRDEB</u></b> or <b><u>PKGWRITEDIRIPK</u></b> for <b><u>=
package_rpm</u></b>, <b><u>package_deb</u></b><br />or <b><u>package_ipk</u=
></b> respectively<br /></font></div></div></div></foreignObject><text x=3D=
"2615" y=3D"244" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot=
;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">This can =
be PKGWRITEDIRRPM, PKGWRITEDIRDEB or PKGWRITEDIRIPK for pack...</text></swi=
tch></g></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-432"><g><rect x=3D"=
157" y=3D"617.5" width=3D"328.25" height=3D"102.5" fill=3D"none" stroke=3D"=
#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" st=
roke-dasharray=3D"3 3" pointer-events=3D"all"/></g><g><g transform=3D"trans=
late(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-al=
ign: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" required=
Features=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D=
"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe =
center; justify-content: unsafe center; width: 326px; height: 1px; padding-=
top: 669px; margin-left: 158px;"><div style=3D"box-sizing: border-box; font=
-size: 0; text-align: center; color: #000000; "><div style=3D"display: inli=
ne-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color:=
 light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white=
-space: normal; word-wrap: normal; "><span style=3D"font-size: 15px;">Licen=
se checking happens in <b><u>do_populate_lic</u></b> after <b><u>do_patch<b=
r /></u></b>and before that a checksum check<br />happends on=C2=A0<b><u>LI=
C_FILES_CHKSUM</u></b> if the<br />license is not <b><u>CLOSED</u></b><br /=
></span></div></div></div></foreignObject><text x=3D"321" y=3D"672" fill=3D=
"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quot;" =
font-size=3D"12px" text-anchor=3D"middle">License checking happens in do_po=
pulate_lic after do_pa...</text></switch></g></g></g><g data-cell-id=3D"eV5=
wDCu3Df9HtTySJIbg-434"><g><rect x=3D"882.12" y=3D"340" width=3D"434.88" hei=
ght=3D"70" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb=
(0, 0, 0), rgb(255, 255, 255));" stroke-dasharray=3D"3 3" pointer-events=3D=
"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject =
style=3D"overflow: visible; text-align: left;" pointer-events=3D"none" widt=
h=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/f=
eature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"=
display: flex; align-items: unsafe center; justify-content: unsafe center; =
width: 433px; height: 1px; padding-top: 375px; margin-left: 883px;"><div st=
yle=3D"box-sizing: border-box; font-size: 0; text-align: center; color: #00=
0000; "><div style=3D"display: inline-block; font-size: 12px; font-family: =
&quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line-heig=
ht: 1.2; pointer-events: all; white-space: normal; word-wrap: normal; "><sp=
an style=3D"font-size: 15px;">This variable is used to separate recipes<br =
/>based on their target. This has value of<br /><b><u>${PACKAGE_ARCH}${TARG=
ET_VENDOR}-${TARGET_OS}</u></b><br /></span></div></div></div></foreignObje=
ct><text x=3D"1100" y=3D"379" fill=3D"light-dark(#000000, #ffffff)" font-fa=
mily=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"midd=
le">This variable is used to separate recipes...</text></switch></g></g></g=
><g data-cell-id=3D"utO5BPZsFb6q0V3ioqD--28"><g><path d=3D"M 1647 165 Q 171=
5.8 165 1715.84 126.37" fill=3D"none" stroke=3D"#000000" style=3D"stroke: l=
ight-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" stro=
ke-dasharray=3D"3 3" pointer-events=3D"stroke"/><path d=3D"M 1715.85 121.12=
 L 1718.17 128.12 L 1715.84 126.37 L 1713.51 128.12 Z" fill=3D"#000000" sty=
le=3D"fill: light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dar=
k(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=
=3D"10" pointer-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTyS=
JIbg-436"><g><rect x=3D"1537" y=3D"155" width=3D"110" height=3D"20" rx=3D"3=
" ry=3D"3" fill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 238), r=
gb(32, 32, 32)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192));" =
stroke=3D"#36393d" pointer-events=3D"all"/></g><g><g transform=3D"translate=
(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-align:=
 left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requiredFeat=
ures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"htt=
p://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe cent=
er; justify-content: unsafe center; width: 108px; height: 1px; padding-top:=
 165px; margin-left: 1538px;"><div style=3D"box-sizing: border-box; font-si=
ze: 0; text-align: center; color: #000000; "><div style=3D"display: inline-=
block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color: li=
ght-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white-sp=
ace: normal; word-wrap: normal; ">conf-notes.txt</div></div></div></foreign=
Object><text x=3D"1592" y=3D"169" fill=3D"light-dark(#000000, #ffffff)" fon=
t-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"=
middle">conf-notes.txt</text></switch></g></g></g><g data-cell-id=3D"utO5BP=
ZsFb6q0V3ioqD--16"><g><path d=3D"M 645.01 130 Q 645 165 760.63 165" fill=3D=
"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255=
, 255, 255));" stroke-miterlimit=3D"10" stroke-dasharray=3D"3 3" pointer-ev=
ents=3D"stroke"/><path d=3D"M 765.88 165 L 758.88 167.33 L 760.63 165 L 758=
.88 162.67 Z" fill=3D"#000000" style=3D"fill: light-dark(rgb(0, 0, 0), rgb(=
255, 255, 255)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" str=
oke=3D"#000000" stroke-miterlimit=3D"10" pointer-events=3D"all"/></g></g><g=
 data-cell-id=3D"utO5BPZsFb6q0V3ioqD--18"><g><path d=3D"M 593.5 110 Q 553.8=
 110 553.75 51.37" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-=
dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" stroke-da=
sharray=3D"3 3" pointer-events=3D"stroke"/><path d=3D"M 553.75 46.12 L 556.=
09 53.12 L 553.75 51.37 L 551.42 53.12 Z" fill=3D"#000000" style=3D"fill: l=
ight-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, 0=
), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" pointe=
r-events=3D"all"/></g></g><g data-cell-id=3D"eV5wDCu3Df9HtTySJIbg-440"><g><=
rect x=3D"593.5" y=3D"90" width=3D"103.01" height=3D"40" rx=3D"6" ry=3D"6" =
fill=3D"#ffffff" style=3D"fill: light-dark(#ffffff, var(--ge-dark-color, #1=
21212)); stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke=3D"#=
000000" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)=
"><switch><foreignObject style=3D"overflow: visible; text-align: left;" poi=
nter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"htt=
p://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3.=
org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justify=
-content: unsafe center; width: 101px; height: 1px; padding-top: 110px; mar=
gin-left: 595px;"><div style=3D"box-sizing: border-box; font-size: 0; text-=
align: center; color: #000000; "><div style=3D"display: inline-block; font-=
size: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#00=
0000, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal;=
 word-wrap: normal; "><font data-font-src=3D"https://fonts.googleapis.com/c=
ss?family=3DArchitects+Daughter">sstate-cache</font></div></div></div></for=
eignObject><text x=3D"645" y=3D"114" fill=3D"light-dark(#000000, #ffffff)" =
font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=
=3D"middle">sstate-cache</text></switch></g></g></g><g data-cell-id=3D"eV5w=
DCu3Df9HtTySJIbg-442"><g><rect x=3D"660.98" y=3D"120" width=3D"83.01" heigh=
t=3D"25" rx=3D"3.75" ry=3D"3.75" fill=3D"#000000" style=3D"fill: light-dark=
(rgb(0, 0, 0), rgb(237, 237, 237));" stroke=3D"none" pointer-events=3D"all"=
/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=
=3D"overflow: visible; text-align: left;" pointer-events=3D"none" width=3D"=
100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/featur=
e#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"displ=
ay: flex; align-items: unsafe center; justify-content: unsafe center; width=
: 81px; height: 1px; padding-top: 133px; margin-left: 662px;"><div style=3D=
"box-sizing: border-box; font-size: 0; text-align: center; color: #ffffff; =
"><div style=3D"display: inline-block; font-size: 12px; font-family: &quot;=
Liberation Sans&quot;; color: light-dark(#ffffff, #121212); line-height: 1.=
2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: =
normal; "><font data-font-src=3D"https://fonts.googleapis.com/css?family=3D=
Architects+Daughter">SSTATE_DIR</font></div></div></div></foreignObject><te=
xt x=3D"702" y=3D"136" fill=3D"#ffffff" font-family=3D"&quot;Liberation San=
s&quot;" font-size=3D"12px" text-anchor=3D"middle" font-weight=3D"bold">SST=
ATE_DIR</text></switch></g></g></g><g data-cell-id=3D"utO5BPZsFb6q0V3ioqD--=
10"><g><rect x=3D"2231.99" y=3D"860" width=3D"90" height=3D"27.5" rx=3D"4.1=
3" ry=3D"4.13" fill=3D"#eeeeee" style=3D"fill: light-dark(rgb(238, 238, 238=
), rgb(32, 32, 32)); stroke: light-dark(rgb(54, 57, 61), rgb(186, 189, 192)=
);" stroke=3D"#36393d" pointer-events=3D"all"/></g><g><g transform=3D"trans=
late(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; text-al=
ign: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" required=
Features=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D=
"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: unsafe =
center; justify-content: unsafe center; width: 88px; height: 1px; padding-t=
op: 874px; margin-left: 2233px;"><div style=3D"box-sizing: border-box; font=
-size: 0; text-align: center; color: #000000; "><div style=3D"display: inli=
ne-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; color:=
 light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; white=
-space: normal; word-wrap: normal; ">sayhello</div></div></div></foreignObj=
ect><text x=3D"2277" y=3D"877" fill=3D"light-dark(#000000, #ffffff)" font-f=
amily=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-anchor=3D"mid=
dle">sayhello</text></switch></g></g></g><g data-cell-id=3D"utO5BPZsFb6q0V3=
ioqD--13"><g><path d=3D"M 1165 490 Q 1165 575 1226.1 575 Q 1287.2 575 1287.=
23 652.91" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb=
(0, 0, 0), rgb(255, 255, 255));" stroke-miterlimit=3D"10" stroke-dasharray=
=3D"3 3" pointer-events=3D"stroke"/><path d=3D"M 1287.23 658.16 L 1284.89 6=
51.16 L 1287.23 652.91 L 1289.56 651.16 Z" fill=3D"#000000" style=3D"fill: =
light-dark(rgb(0, 0, 0), rgb(255, 255, 255)); stroke: light-dark(rgb(0, 0, =
0), rgb(255, 255, 255));" stroke=3D"#000000" stroke-miterlimit=3D"10" point=
er-events=3D"all"/></g></g><g data-cell-id=3D"utO5BPZsFb6q0V3ioqD--15"><g><=
rect x=3D"767" y=3D"120" width=3D"410" height=3D"90" fill=3D"none" stroke=
=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));=
" stroke-dasharray=3D"3 3" pointer-events=3D"all"/></g><g><g transform=3D"t=
ranslate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; tex=
t-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" requ=
iredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmln=
s=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: uns=
afe center; justify-content: unsafe center; width: 408px; height: 1px; padd=
ing-top: 165px; margin-left: 768px;"><div style=3D"box-sizing: border-box; =
font-size: 0; text-align: center; color: #000000; "><div style=3D"display: =
inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; co=
lor: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; w=
hite-space: normal; word-wrap: normal; "><span style=3D"font-size: 15px;">T=
his folder contains cache for recipes build output, this is used by BitBake=
, if the recipe checksum did not change it knows that the output to use is =
the same.<br /></span></div></div></div></foreignObject><text x=3D"972" y=
=3D"169" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberat=
ion Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">This folder conta=
ins cache for recipes build output, this is used by...</text></switch></g><=
/g></g><g data-cell-id=3D"utO5BPZsFb6q0V3ioqD--17"><g><rect x=3D"348.75" y=
=3D"0" width=3D"410" height=3D"45" fill=3D"none" stroke=3D"#000000" style=
=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-dasharray=
=3D"3 3" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5=
)"><switch><foreignObject style=3D"overflow: visible; text-align: left;" po=
inter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"ht=
tp://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3=
.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justif=
y-content: unsafe center; width: 408px; height: 1px; padding-top: 23px; mar=
gin-left: 350px;"><div style=3D"box-sizing: border-box; font-size: 0; text-=
align: center; color: #000000; "><div style=3D"display: inline-block; font-=
size: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#00=
0000, #ffffff); line-height: 1.2; pointer-events: all; white-space: normal;=
 word-wrap: normal; "><span style=3D"font-size: 15px;"><font data-font-src=
=3D"https://fonts.googleapis.com/css?family=3DLiberation+Sans">These direct=
ories can be shared accross builds to save disk space and build time</font>=
<br /></span></div></div></div></foreignObject><text x=3D"554" y=3D"26" fil=
l=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&quo=
t;" font-size=3D"12px" text-anchor=3D"middle">These directories can be shar=
ed accross builds to save disk space an...</text></switch></g></g></g><g da=
ta-cell-id=3D"utO5BPZsFb6q0V3ioqD--20"><g><rect x=3D"1942" y=3D"87.5" width=
=3D"416.88" height=3D"45" fill=3D"#ffffff" style=3D"fill: light-dark(#fffff=
f, var(--ge-dark-color, #121212)); stroke: light-dark(rgb(0, 0, 0), rgb(255=
, 255, 255));" stroke=3D"#000000" stroke-dasharray=3D"3 3" pointer-events=
=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObje=
ct style=3D"overflow: visible; text-align: left;" pointer-events=3D"none" w=
idth=3D"100%" height=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG1=
1/feature#Extensibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=
=3D"display: flex; align-items: unsafe center; justify-content: unsafe cent=
er; width: 415px; height: 1px; padding-top: 110px; margin-left: 1943px;"><d=
iv style=3D"box-sizing: border-box; font-size: 0; text-align: center; color=
: #000000; "><div style=3D"display: inline-block; font-size: 12px; font-fam=
ily: &quot;Liberation Sans&quot;; color: light-dark(#000000, #ffffff); line=
-height: 1.2; pointer-events: all; white-space: normal; word-wrap: normal; =
"><font style=3D"font-size: 15px;">This directory contains other output dir=
ectories such as <b><u>images</u></b>, <b><u>sdk</u></b> and <b><u>licenses=
</u></b><br /></font></div></div></div></foreignObject><text x=3D"2150" y=
=3D"114" fill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberat=
ion Sans&quot;" font-size=3D"12px" text-anchor=3D"middle">This directory co=
ntains other output directories such as images, sdk...</text></switch></g><=
/g></g><g data-cell-id=3D"utO5BPZsFb6q0V3ioqD--22"><g><rect x=3D"1477" y=3D=
"255" width=3D"170" height=3D"130" fill=3D"none" stroke=3D"#000000" style=
=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));" stroke-dasharray=
=3D"3 3" pointer-events=3D"all"/></g><g><g transform=3D"translate(-0.5 -0.5=
)"><switch><foreignObject style=3D"overflow: visible; text-align: left;" po=
inter-events=3D"none" width=3D"100%" height=3D"100%" requiredFeatures=3D"ht=
tp://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns=3D"http://www.w3=
.org/1999/xhtml" style=3D"display: flex; align-items: unsafe center; justif=
y-content: unsafe center; width: 168px; height: 1px; padding-top: 320px; ma=
rgin-left: 1478px;"><div style=3D"box-sizing: border-box; font-size: 0; tex=
t-align: center; color: #000000; "><div style=3D"display: inline-block; fon=
t-size: 12px; font-family: &quot;Liberation Sans&quot;; color: light-dark(#=
000000, #ffffff); line-height: 1.2; pointer-events: all; white-space: norma=
l; word-wrap: normal; "><font style=3D"font-size: 15px;">This file contains=
 all <b>layers</b> that BitBake should consider when looking for metadata.<=
br /></font></div></div></div></foreignObject><text x=3D"1562" y=3D"324" fi=
ll=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&qu=
ot;" font-size=3D"12px" text-anchor=3D"middle">This file contains all layer=
...</text></switch></g></g></g><g data-cell-id=3D"utO5BPZsFb6q0V3ioqD--25">=
<g><rect x=3D"1349" y=3D"5" width=3D"440" height=3D"40" fill=3D"none" strok=
e=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(255, 255, 255))=
;" stroke-dasharray=3D"3 3" pointer-events=3D"all"/></g><g><g transform=3D"=
translate(-0.5 -0.5)"><switch><foreignObject style=3D"overflow: visible; te=
xt-align: left;" pointer-events=3D"none" width=3D"100%" height=3D"100%" req=
uiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extensibility"><div xml=
ns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex; align-items: un=
safe center; justify-content: unsafe center; width: 438px; height: 1px; pad=
ding-top: 25px; margin-left: 1350px;"><div style=3D"box-sizing: border-box;=
 font-size: 0; text-align: center; color: #000000; "><div style=3D"display:=
 inline-block; font-size: 12px; font-family: &quot;Liberation Sans&quot;; c=
olor: light-dark(#000000, #ffffff); line-height: 1.2; pointer-events: all; =
white-space: normal; word-wrap: normal; "><font style=3D"font-size: 15px;">=
This is base configuration file containing essential user config such as <b=
><u>MACHINE</u></b> and <b><u>DISTRO</u></b><br /></font></div></div></div>=
</foreignObject><text x=3D"1569" y=3D"29" fill=3D"light-dark(#000000, #ffff=
ff)" font-family=3D"&quot;Liberation Sans&quot;" font-size=3D"12px" text-an=
chor=3D"middle">This is base configuration file containing essential user c=
onfig such as...</text></switch></g></g></g><g data-cell-id=3D"utO5BPZsFb6q=
0V3ioqD--27"><g><rect x=3D"1535" y=3D"80" width=3D"241.13" height=3D"40" fi=
ll=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rg=
b(255, 255, 255));" stroke-dasharray=3D"3 3" pointer-events=3D"all"/></g><g=
><g transform=3D"translate(-0.5 -0.5)"><switch><foreignObject style=3D"over=
flow: visible; text-align: left;" pointer-events=3D"none" width=3D"100%" he=
ight=3D"100%" requiredFeatures=3D"http://www.w3.org/TR/SVG11/feature#Extens=
ibility"><div xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"display: flex=
; align-items: unsafe center; justify-content: unsafe center; width: 239px;=
 height: 1px; padding-top: 100px; margin-left: 1536px;"><div style=3D"box-s=
izing: border-box; font-size: 0; text-align: center; color: #000000; "><div=
 style=3D"display: inline-block; font-size: 12px; font-family: &quot;Libera=
tion Sans&quot;; color: light-dark(#000000, #ffffff); line-height: 1.2; poi=
nter-events: all; white-space: normal; word-wrap: normal; "><font style=3D"=
font-size: 15px;">The message to show after <b>source oe-init-build-env</b>=
<br /></font></div></div></div></foreignObject><text x=3D"1656" y=3D"104" f=
ill=3D"light-dark(#000000, #ffffff)" font-family=3D"&quot;Liberation Sans&q=
uot;" font-size=3D"12px" text-anchor=3D"middle">The message to show after s=
ource oe-init...</text></switch></g></g></g><g data-cell-id=3D"IR5jgyizBFAp=
jn6Bth0e-1"><g><rect x=3D"2737" y=3D"600" width=3D"30" height=3D"20" fill=
=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0), rgb(=
255, 255, 255));" pointer-events=3D"all"/></g></g><g data-cell-id=3D"IR5jgy=
izBFApjn6Bth0e-2"><g><rect x=3D"2587" y=3D"766.25" width=3D"20" height=3D"2=
0" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0, 0, 0=
), rgb(255, 255, 255));" pointer-events=3D"all"/></g></g><g data-cell-id=3D=
"IR5jgyizBFApjn6Bth0e-3"><g><rect x=3D"2487" y=3D"925" width=3D"25" height=
=3D"20" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rgb(0,=
 0, 0), rgb(255, 255, 255));" pointer-events=3D"all"/></g></g><g data-cell-=
id=3D"IR5jgyizBFApjn6Bth0e-4"><g><rect x=3D"2507" y=3D"550" width=3D"20" he=
ight=3D"20" fill=3D"none" stroke=3D"#000000" style=3D"stroke: light-dark(rg=
b(0, 0, 0), rgb(255, 255, 255));" pointer-events=3D"all"/></g></g><g data-c=
ell-id=3D"IR5jgyizBFApjn6Bth0e-5"><g><rect x=3D"1863.5" y=3D"181.25" width=
=3D"20" height=3D"20" fill=3D"none" stroke=3D"#000000" style=3D"stroke: lig=
ht-dark(rgb(0, 0, 0), rgb(255, 255, 255));" pointer-events=3D"all"/></g></g=
></g></g></g><switch><g requiredFeatures=3D"http://www.w3.org/TR/SVG11/feat=
ure#Extensibility"/><a transform=3D"translate(0,-5)" xlink:href=3D"https://=
www.drawio.com/doc/faq/svg-export-text-problems" target=3D"_blank"><text te=
xt-anchor=3D"middle" font-size=3D"10px" x=3D"50%" y=3D"100%">Text is not SV=
G - cannot display</text></a></switch></svg>
\ No newline at end of file
--=20
2.39.5


