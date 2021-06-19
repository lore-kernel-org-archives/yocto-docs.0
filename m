Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.18246.1624080649950909565
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Jun 2021 22:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ieee.org header.s=google header.b=AoUtdUas;
 spf=pass (domain: ieee.org, ip: 209.85.222.179, mailfrom: yates@ieee.org)
Received: by mail-qk1-f179.google.com with SMTP id i68so16364915qke.3
        for <docs@lists.yoctoproject.org>; Fri, 18 Jun 2021 22:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=KFABu1nrIOGXMaazhYEiDVtFkMIuKGq3aodTMmftIkg=;
        b=AoUtdUasTozI+OSwu6i0TaO/FVqJ0n2q08knUWjZoab6xAwprc/CsLVOHPjDkSI2I8
         VTSvCu0wICnj7Ns6YKyUHl1W7uHjwIMyePukhimddXs2eoXOwZAyVBltbnUiNjUadhSW
         +zZ2QkQcJQl06H9W1GpE7Gf0JOr1W/9K+Mkz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=KFABu1nrIOGXMaazhYEiDVtFkMIuKGq3aodTMmftIkg=;
        b=KuVLLdwf3NJ+jftq3gy1sQDHVqwp5VzFBVei9iXwYm+65EhZWkA2tjb914ddWO7DCv
         Dsiollx5f/yJEcU0UnyJCE1S7eKQdd87pi1zYAYGG1oNkryaquS+C4aF0okdDApOcbE3
         uC9G+oHgwJRYiLOtRmxYp1PvGvkwGMPI+ekN1xvDjhrkUioGZPDkJgW5X3xARWY4U+yJ
         FIyXQCVWy3ASbYXD2AwRT5AukEX2sydHhIh0By7s1YxE5b3hKcXMMpUxOOpYayNqJSTj
         XuGN+vkDuPIAQ81gk72Qr0QRR8o67mznIhXwPE76MI8s2eHlDKO435gsH6ugjXycp1Pv
         86sA==
X-Gm-Message-State: AOAM530vYm7Ea/br1zSbo52wzFrpuknqngL39RjA4H7/zMSi1BR141X1
	JhwK9AQdjDgVxjRZFC6TVTwNPnbLeRSco5xHM2kL0p0etO/tEMie
X-Google-Smtp-Source: ABdhPJzx0357hgL2UjoNiX/60/9dHztqVzbYcgat43lqohVKKvJt/aCUgFPko0DmaINxOg0t3Dvb1E7WZeXjKXlpNl8=
X-Received: by 2002:a25:7089:: with SMTP id l131mr18114325ybc.1.1624080648541;
 Fri, 18 Jun 2021 22:30:48 -0700 (PDT)
MIME-Version: 1.0
From: yates@ieee.org
Date: Sat, 19 Jun 2021 01:30:37 -0400
Message-ID: <CALJBDKjUGx=xWMzypOLCMWRVfW6vCvv3=9fWFnZpeqZ_O7q62w@mail.gmail.com>
Subject: Yocto Doc Thoughts
To: docs@lists.yoctoproject.org
X-Groupsio-MsgNum: 1499
Content-Type: multipart/related; boundary="000000000000253e7905c517be8f"

--000000000000253e7905c517be8f
Content-Type: multipart/alternative; boundary="000000000000253e7805c517be8e"

--000000000000253e7805c517be8e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello All,

I was asked to provide my feedback on the Yocto documentation on the #yocto
irc channel a few weeks ago, so here goes. Sorry it=E2=80=99s taken me so l=
ong to
get around to it.

First I want to say thank you to all who have volunteered their time to
create the Yocto documentation. The documentation has improved
significantly over the past few years I=E2=80=99ve been using Yocto (since =
about
2016). The sheer amount and number of documents means this was/is a
Herculean task, even for a large group of volunteers such as yourselves.

Also let me say (as will become obvious) that these ideas are not on
specific problems but address general attributes of the documentation that
I feel could be improved.

OK, so the feedback:

   1.

   Be less flowery. Many of the docs seem to be written with more words
   than are necessary, as if embedding the information in some amount of
   niceties helps engage the reader. In my opinion, it hurts. The overridin=
g
   goal of documentation should be to state things as precisely and succinc=
tly
   as possible so that the reader gets to their information quickly and
   clearly. The writer should spend x amount of time once writing things
   well so that 100,000 users don=E2=80=99t have to spend 100,000=E2=81=A2x=
 hours.
   2.

   Related to the previous point, factor the information into logical
   pieces and define things once. It seems that many parts of the Yocto
   system are described across several documents. This makes it difficult t=
o
   digest.
   3.

   Be less grammatically and/or syntactically ambiguous, and provide
   sufficient context.

I should have taken some time to provide specific examples, but this is a
start. If it doesn=E2=80=99t irritate folks too much, I can put together a =
followup
with specifics.

[image: image.png] Randy Yates <:yates@ieee.org>
919-412-8994 (cell, personal)
919-577-9882 (landline, personal)
Generated on Sat Jun 19 01:10:58 2021 by LaTeXML [image: image.png]
<http://dlmf.nist.gov/LaTeXML/>

--000000000000253e7805c517be8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-ltx_page_main">
<div class=3D"gmail-ltx_page_content">

<div id=3D"gmail-p1" class=3D"gmail-ltx_para gmail-ltx_noindent">
<p class=3D"gmail-ltx_p">Hello All,</p>
</div>
<div id=3D"gmail-p2" class=3D"gmail-ltx_para gmail-ltx_noindent">
<p class=3D"gmail-ltx_p">I was asked to provide my feedback on the Yocto do=
cumentation on the
#yocto irc channel a few weeks ago, so here goes. Sorry it=E2=80=99s taken =
me
so long to get around to it.</p>
</div>
<div id=3D"gmail-p3" class=3D"gmail-ltx_para gmail-ltx_noindent">
<p class=3D"gmail-ltx_p">First I want to say thank you to all who have volu=
nteered their time
to create the Yocto documentation. The documentation has improved
significantly over the past few years I=E2=80=99ve been using Yocto (since
about 2016). The sheer amount and number of documents means this
was/is a Herculean task, even for a large group of volunteers such as
yourselves.</p>
</div>
<div id=3D"gmail-p4" class=3D"gmail-ltx_para gmail-ltx_noindent">
<p class=3D"gmail-ltx_p">Also let me say (as will become obvious) that thes=
e ideas are not on
specific problems but address general attributes of the documentation
that I feel could be improved.</p>
</div>
<div id=3D"gmail-p5" class=3D"gmail-ltx_para gmail-ltx_noindent">
<p class=3D"gmail-ltx_p">OK, so the feedback:</p>
<ol id=3D"gmail-S0.I1" class=3D"gmail-ltx_enumerate"><li id=3D"gmail-S0.I1.=
i1" class=3D"gmail-ltx_item">
<div id=3D"gmail-S0.I1.i1.p1" class=3D"gmail-ltx_para gmail-ltx_noindent">
<p class=3D"gmail-ltx_p">Be less flowery. Many of the docs seem to be writt=
en with more
words than are necessary, as if embedding the information in
some amount of niceties helps engage the reader. In my opinion,
it hurts. The overriding goal of documentation should be to
state things as precisely and succinctly as possible so that
the reader gets to their information quickly and clearly.
The writer should spend <span id=3D"gmail-S0.I1.i1.p1.m1" class=3D"gmail-lt=
x_Math"><span>x</span></span> amount of time once writing things well
so that <span id=3D"gmail-S0.I1.i1.p1.m2" class=3D"gmail-ltx_Math"><span><s=
pan>100</span><span>,</span><span>000</span></span></span> users don=E2=80=
=99t have to spend <span id=3D"gmail-S0.I1.i1.p1.m3" class=3D"gmail-ltx_Mat=
h"><span><span>100</span><span>,</span><span><span>000</span><span>=E2=81=
=A2</span><span>x</span></span></span></span>
hours.</p>
</div>
</li><li id=3D"gmail-S0.I1.i2" class=3D"gmail-ltx_item">
<div id=3D"gmail-S0.I1.i2.p1" class=3D"gmail-ltx_para gmail-ltx_noindent">
<p class=3D"gmail-ltx_p">Related to the previous point, factor the informat=
ion into
logical pieces and define things once. It <span class=3D"gmail-ltx_text gma=
il-ltx_font_italic">seems</span>
that many parts of the Yocto system are described across
several documents. This makes it difficult to digest.</p>
</div>
</li><li id=3D"gmail-S0.I1.i3" class=3D"gmail-ltx_item">
<div id=3D"gmail-S0.I1.i3.p1" class=3D"gmail-ltx_para gmail-ltx_noindent">
<p class=3D"gmail-ltx_p">Be less grammatically and/or syntactically ambiguo=
us,
and provide sufficient context.</p>
</div>
</li></ol>
</div>
<div id=3D"gmail-p6" class=3D"gmail-ltx_para gmail-ltx_noindent">
<p class=3D"gmail-ltx_p">I should have taken some time to provide specific =
examples, but this
is a start. If it doesn=E2=80=99t irritate folks too much, I can put togeth=
er
a followup with specifics.</p>
</div>
<div id=3D"gmail-p7" class=3D"gmail-ltx_para gmail-ltx_noindent">
<p class=3D"gmail-ltx_p"><span class=3D"gmail-ltx_text" style=3D"font-size:=
90%"><img src=3D"cid:ii_kq3bocyh0" alt=3D"image.png" width=3D"45" height=3D=
"45"></span><span class=3D"gmail-ltx_text" style=3D"font-size:90%">
<a href=3D"mailto::yates@ieee.org" title=3D"" class=3D"gmail-ltx_ref gmail-=
ltx_href">Randy Yates</a>
<br class=3D"gmail-ltx_break">919-412-8994 (cell, personal)=20
<br class=3D"gmail-ltx_break">919-577-9882 (landline, personal)=20
<br class=3D"gmail-ltx_break"></span></p>
</div>

</div>

<div class=3D"gmail-ltx_page_logo">Generated  on Sat Jun 19 01:10:58 2021 b=
y <a href=3D"http://dlmf.nist.gov/LaTeXML/">LaTeXML <img src=3D"cid:ii_kq3b=
ocyn1" alt=3D"image.png" width=3D"11" height=3D"14"></a>
</div>
</div></div>

--000000000000253e7805c517be8e--

--000000000000253e7905c517be8f
Content-Type: image/png; name="image.png"
Content-Disposition: inline; filename="image.png"
Content-Transfer-Encoding: base64
Content-ID: <ii_kq3bocyh0>
X-Attachment-Id: ii_kq3bocyh0

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
RU5ErkJggg==

--000000000000253e7905c517be8f
Content-Type: image/png; name="image.png"
Content-Disposition: inline; filename="image.png"
Content-Transfer-Encoding: base64
Content-ID: <ii_kq3bocyn1>
X-Attachment-Id: ii_kq3bocyn1

iVBORw0KGgoAAAANSUhEUgAAAAsAAAAOCAYAAAD5YeaVAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A
/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9wKExQZLWTEaOUAAAAddEVYdENv
bW1lbnQAQ3JlYXRlZCB3aXRoIFRoZSBHSU1Q72QlbgAAAdpJREFUKM9tkL+L2nAARz9fPZNCKFap
Un8kyI0e4iRHSR1Kb8ng0lJw6FYHFwv2LwhOpcWxTjeUunYqOmqd6hEoRDhtDWdA8ApRYsSUCDHN
t5ul13vz4w0vWCgUnnEc975arX6ORqN3VqtVZbfbTQC4uEHANM3jSqXymFI6yWazP2KxWAXAL9zC
Ua1Wy2tXVxheKA9YNoR8Pt+aTqe4FVVVvz05O6MBhqUIBGk8Hn8HAOVy+T+XLJfLS4ZhTiRJgqIo
VBRFIoric47jPnmeB1mW/9rr9ZpSSn3Lsmir1fJZlqWlUonKsvwWwD8ymc/nXwVBeLjf7xEKhdBu
t9Hr9WgmkyGEkJwsy5eHG5vN5g0AKIoCAEgkEkin0wQAfN9/cXPdheu6P33fBwB4ngcAcByHJpPJ
l+fn54mD3Gg0NrquXxeLRQAAwzAYj8cwTZPwPH9/sVg8PXweDAauqqr2cDjEer1GJBLBZDJBs9mE
4zjwfZ85lAGg2+06hmGgXq+j3+/DsixYlgVN03a9Xu8jgCNCyIegIAgx13Vfd7vdu+FweG8YRkjX
dWy329+dTgeSJD3ieZ7RNO0VAXAPwDEAO5VKndi2fWrb9jWl9Esul6PZbDY9Go1OZ7PZ9z/lyuD3
OozU2wAAAABJRU5ErkJggg==

--000000000000253e7905c517be8f--
