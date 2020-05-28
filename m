Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web12.7756.1590652470346162836
 for <docs@lists.yoctoproject.org>;
 Thu, 28 May 2020 00:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YOSdvX4d;
 spf=pass (domain: linaro.org, ip: 209.85.219.175, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f175.google.com with SMTP id l17so12903104ybk.1
        for <docs@lists.yoctoproject.org>; Thu, 28 May 2020 00:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VM3H6qlHRvVD5LkOuX8ynR19ulroJWOgkebUBEz91Dk=;
        b=YOSdvX4d+knwBufhJ+3PpAWAVWqQAl9Kg1VB8vuLK3QsChQ1mNNshjJF3yxUFyOH5p
         S3HVg21FgDGSLEEVGtbURsmdwGx1AsY+77BRHvUyYoo9ho978a5e/Tcf3HbrviFxbjTq
         RqPtTNLa0dFKtLvZwhaMY36C3NaHTAxZnt2Z/Wi2gN3nUJ4ZaggIpo9BfdhC10efMsxt
         YNVOCBJrHE8F+2Gt9zNnDUUqgfbq/gdB2gP6a16wSaFgtVZperiLJRisqZxcyq94O1Jz
         iR8brJ98dLn0aAjDPSACyNrFF4ctfHc86v167p9gjNvMbAJbD+2S4ojFACOb23aQJhLp
         1bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VM3H6qlHRvVD5LkOuX8ynR19ulroJWOgkebUBEz91Dk=;
        b=PEE3uPF+qiFRLS69KePX93ULlLQ1Im4GxW3MVYhC7LUXconlwHnCVrEE4+piqJPgd8
         G7h3I3pJrU+HIRoq171BUDaPN56TTV01PaTzJIF1Ff6YL86rsj+GU6KnMIlcHmuVpU60
         Jk4lIdJp83yShWLghdIR+5K0uki6zYID6gFhEApZuq1Ig3AXCOsRP6AoqOLEa1EpKefv
         brw4VK5PzmZ2bkXInDJLtt0pRleJsrf0ix+R5hZlcWcn66mk2ehn43DruWYKalJVQuCK
         fsavRJ+YzKxvSs5QIOHp+61uoOUU/LztBhXpMAey1gA0IJjqBqYo8LqzDAkZKHy5TtMV
         fySg==
X-Gm-Message-State: AOAM531xGeFWg2sWLdkFjm1UhUoDOQtrePCkRw+zmLwHG1WrRYojCW+w
	QZXbJqPHpd4CcoSI92wMe1U1wZuuCunVXM6VgkNKYQ==
X-Google-Smtp-Source: ABdhPJz1RxT7k9cyu8IMIoh6Tn0DBhoeX4gJvLsndbHCqt/mnWRbTFv6/btK2MTxo4fmuqQQVtm3TZaa59WTB4OQ0J8=
X-Received: by 2002:a25:d18c:: with SMTP id i134mr3221107ybg.133.1590652469284;
 Thu, 28 May 2020 00:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjzD-AMauxpgbydY2fryU6+JU599UPRPXi_c582WvvfV6w@mail.gmail.com>
 <18306.1590644951892762393@lists.yoctoproject.org>
In-Reply-To: <18306.1590644951892762393@lists.yoctoproject.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 28 May 2020 09:54:17 +0200
Message-ID: <CAP71WjxpZAVr8VeGv3AiRiGFscTJsRGDT6KJBaP0TEDfzUHzNQ@mail.gmail.com>
Subject: Re: [docs] Possible changes to the project docs
To: Mark Van De Vyver <mark@taqtiqa.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000064aaf405a6b0a3a4"

--00000000000064aaf405a6b0a3a4
Content-Type: text/plain; charset="UTF-8"

hi Mark,

thanks a lot for joining the discussion! This is very helpful and much
appreciated.

On Thu, May 28, 2020 at 7:49 AM Mark Van De Vyver <mark@taqtiqa.com> wrote:

> Hmm, it seems the interwebs ate my prior message.   TLDR;
>

I believe you replied privately to me, your message is not lost and is in
good hands , well mine ;)


>
> Considering AsciiDoc, MkDoc-Materialize, Docusarus, Sphinx and Antora
>
> * A switch from DocBook is a net benefit regardless of what you switch too.
> * Making docs more accessible to dev and user contributors is the key.
> * I regard ascidoc/md/rst as near enough that they don't swing the
> decision - in terms of being approachable to devs and users.

* A potential discriminator is l10n/i18n - on the face of it they all seem
> to be imperfect (wip) and adequate.
>

We don't have plans for that now, even if it might be a good thing for the
project, I think we struggle enough with one language today.


> * Is there any other strategic benefit to be obtained?
>
The main goal is to ensure documentation is 'easier' to read and write,
encouraging more contributors, while keeping the reputation of the quality
of the project's documentation.


>
> I think so.  Looking at https://antora.org/ this stands out:
> *The ability to retrieve and aggregate all the content from different git
> repositories.*


I think there are 2 sides to the problem:
1. the format of the documentation: DocBook (XML) vs reST vs Asciidoc. I
think it's well accepted that Markdown is 'not enough' for large tech
documentation/book
2. the tools available to process the documentation (sphinx, asciidoctor,
antora.. ). Antora is a toolset on top of Asciidoc.

The main reasons why we've started to explore/experiment with reST/Sphinx
(as opposed to Asciidoc) are:
1. this is what Python uses, and our project is intimately linked to
Python. Sphinx can be extended with plugins in Python, and we have very
capable Python developers around here.
2. we've closely studied what happened in the Linux kernel community, and
their thought process when they moved away from Docbook a couple of years
ago, which is nicely summarized in the following articles:
https://lwn.net/Articles/671496/
https://lwn.net/Articles/692704/
https://lwn.net/Articles/692705/
Even though the initial plan was to move from Docbook to Asciidoc, they
ended up using reST/Sphinx in the end. Given the proximity of the YP and
kernel communities, we should pay close attention to what they've done.

That said, no decision has been made, Sphinx is just the first proof of
concept which have been made. So now is definitely the right time to
discuss all options!


>
> This provides the following headroom:
> * Move documentation into the repo that holds the related code.  Bringing
> documentation closer to devs who are more likely to write some preliminary
> documentation and correct documentation errors/ambiguities.
>
I agree that the project documentation would benefit from some inline
documentation. Not for everything, but maybe for classes, variables,
functions, it would be easier to maintain if the documentation was 'closer'
to the doc. The kernel documentation uses a mix of inline doc vs separate
doc already (with sphinx).


> * Allow individual repo's/tools to evolve at their own pace - a release
> that repo/tool X would like to make 'yesterday' can be made and everyone
> can be confident the docs are still consistent (assumes that tool/repo-Y
> does not make any statements about tool/repo-X in the Y-docs)
> * Allow the project to treat a repo as a 1st class citizen even if it is
> not under the openembedded.org or yoctoproject.org

I don't think there is such a concept of a 1st class citizen. The
Openembedded ecosystem is made of a very large amount of layers, and only a
minority of layers are hosted on oe.org or yp.org. I believe that all
layers are treated equally, as soon as they are listed/added to the OE
layer index maybe.


> * Corollary: Allow any repo outside of openembedded.org or
> yoctoproject.org to incorporate whichever of the tools/repos they need
> (git cloning & forking model allows/encourages that) and present
> documentation that is integrated and targeted (Antora could - eventually -
> allow/encourage that).
>

The YP documentation 'project' is about publishing documentation for what
makes up the Yocto Project (OE-core, bitbake, ..). The current Docbook
structure is probably too complex (learning curve) to be adopted in other
layers. So anything we could improve to make it simpler for other layers to
benefit from doc infrastructure would be a nice bonus.


> * Give the Yocto-project flexibility in how to organize itself going
> forward - documentation is not an impediment.
>
> Of course there is a learning curve and the docs need to be refactored
> back to their home tool/repo.
> To my mind there is a categorical distinction that can be made between the
> DocBook alternatives.
>

Can you provide more information about what Antora vs Asciidoc/asciidoctor?


>
> The questions is whether any of the above conjectures are of value or
> attractive?
>
> HTH?
> --
> Kind regards
> Mark
>
> Mark Van de Vyver, B.Bus(Hons), PhD(Dist)
> 
>

--00000000000064aaf405a6b0a3a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hi Mark,</div><div><br></div><div>thanks a lot for jo=
ining the discussion! This is very helpful and much appreciated.</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May=
 28, 2020 at 7:49 AM Mark Van De Vyver &lt;<a href=3D"mailto:mark@taqtiqa.c=
om">mark@taqtiqa.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hmm, it seems the interwebs ate my prior message.=C2=A0=
=
=C2=A0 TLDR;<br></blockquote><div><br></div><div>I believe you replied pri=
vately to me, your message is not lost and is in good hands , well mine ;)=
=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>Considering AsciiDoc, MkDoc-Materialize, Docusarus, Sphinx and Ant=
ora<br><br>* A switch from DocBook is a net benefit regardless of what you =
switch too.<br>* Making docs more accessible to dev and user contributors i=
s the key. <br>* I regard ascidoc/md/rst as near enough that they don&#39;t=
 swing the decision - in terms of being approachable to devs and users.=C2=
=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* A pote=
ntial discriminator is l10n/i18n - on the face of it they all seem to be im=
perfect (wip) and adequate.<br></blockquote><div><br></div><div>We don&#39;=
t have plans for that now, even if it might be a good thing for the project=
, I think we struggle enough with one language today.=C2=A0</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* Is there any =
other strategic benefit to be obtained?<br></blockquote><div>The main goal =
is to ensure documentation is &#39;easier&#39; to read and write, encouragi=
ng more contributors, while keeping the reputation of the quality of the pr=
oject&#39;s documentation.=C2=A0</div><div>=C2=A0<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>I think so.=C2=A0 Looking at <a href=
=3D"https://antora.org/" rel=3D"noopener" target=3D"_blank">https://antora=
.org/</a> this stands out:<br><em><strong>The ability to retrieve and aggre=
gate all the content from different git repositories.</strong></em></blockq=
uote><div><br></div><div><div>I think there are 2 sides to the problem:</di=
v><div>1. the format of the documentation: DocBook (XML) vs reST vs Asciido=
c. I think it&#39;s well accepted that Markdown is &#39;not enough&#39; for=
 large tech documentation/book</div><div>2. the tools available to process =
the documentation (sphinx, asciidoctor, antora.. ). Antora is a toolset on =
top of Asciidoc.=C2=A0</div></div><div><br></div><div>The main reasons why =
we&#39;ve started to explore/experiment with reST/Sphinx (as opposed to Asc=
iidoc) are:</div><div>1. this is what Python uses, and our project is intim=
ately=C2=A0linked to Python. Sphinx can be extended with plugins in Python,=
 and we have very capable Python developers around here.</div><div>2. we&#3=
9;ve closely studied what happened in the Linux kernel community, and their=
 thought process when they moved away from Docbook a couple of years ago, w=
hich is nicely summarized in the following articles:</div><div><a href=3D"h=
ttps://lwn.net/Articles/671496/">https://lwn.net/Articles/671496/</a>=C2=A0=
</div><div><a href=3D"https://lwn.net/Articles/692704/">https://lwn.net/Art=
icles/692704/</a></div><div><a href=3D"https://lwn.net/Articles/692705/">ht=
tps://lwn.net/Articles/692705/</a></div><div>Even though the initial plan w=
as to move from Docbook to Asciidoc, they ended up using reST/Sphinx in the=
 end. Given the proximity of the YP and kernel communities, we should pay c=
lose attention to what they&#39;ve done.<br></div><div><br></div><div>That =
said, no decision has been made,=20

Sphinx is just the first proof of concept which have=C2=A0been made. So no=
w is definitely the right time to discuss all options! </div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><br><br>This provides th=
e following headroom:<br>* Move documentation into the repo that holds the =
related code.=C2=A0 Bringing documentation closer to devs who are more like=
ly to write some preliminary documentation and correct documentation errors=
/ambiguities.<br></blockquote><div>I agree that the project documentation w=
ould benefit from some inline documentation. Not for everything, but maybe =
for classes, variables, functions, it would be easier to maintain if the do=
cumentation was &#39;closer&#39; to the doc. The kernel documentation uses =
a mix of inline doc vs separate doc already (with sphinx).</div><div>=C2=A0=
=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* Allow indi=
vidual repo&#39;s/tools to evolve at their own pace - a release that repo/t=
ool X would like to make &#39;yesterday&#39; can be made and everyone can b=
e confident the docs are still consistent (assumes that tool/repo-Y does no=
t make any statements about tool/repo-X in the Y-docs) <br>* Allow the proj=
ect to treat a repo as a 1st class citizen even if it is not under the <a h=
ref=3D"http://openembedded.org" target=3D"_blank">openembedded.org</a> or <=
a href=3D"http://yoctoproject.org" target=3D"_blank">yoctoproject.org</a></=
blockquote><div>I don&#39;t think there is such a concept of a 1st class ci=
tizen. The Openembedded ecosystem is made of a very large amount of layers,=
 and only a minority of layers are hosted on <a href=3D"http://oe.org">oe.o=
rg</a> or <a href=3D"http://yp.org">yp.org</a>. I believe that all layers a=
re treated equally, as soon as they are listed/added to the OE layer index =
maybe.=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><br>* Corollary: Allow any repo outside of <a href=3D"http://openem=
bedded.org" target=3D"_blank">openembedded.org</a> or <a href=3D"http://yoc=
toproject.org" target=3D"_blank">yoctoproject.org</a> to incorporate whiche=
ver of the tools/repos they need (git cloning &amp; forking model allows/en=
courages that) and present documentation that is integrated and targeted (A=
ntora could - eventually - allow/encourage that).<br></blockquote><div><br>=
</div><div>The YP documentation &#39;project&#39; is about publishing docum=
entation for what makes up the Yocto Project (OE-core, bitbake, ..). The cu=
rrent Docbook structure is probably too complex (learning curve) to be adop=
ted in other layers. So anything we could improve to make it simpler for ot=
her layers to benefit from doc infrastructure would be a nice bonus.=C2=A0<=
/div><div>=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">* Give the Yocto-project flexibility in how to organize itself going for=
ward - documentation is not an impediment.<br><br>Of course there is a lear=
ning curve and the docs need to be refactored back to their home tool/repo.=
<br>To my mind there is a categorical distinction that can be made between =
the DocBook alternatives.<br></blockquote><div><br></div><div>Can you provi=
de more information about what Antora vs Asciidoc/asciidoctor?=C2=A0</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>The q=
uestions is whether any of the above conjectures are of value or attractive=
?<br><br>HTH?<br>-- <br>
<div>Kind regards</div>
<div>Mark</div>
<div>=C2=A0</div>
<div>Mark Van de Vyver, B.Bus(Hons), PhD(Dist)</div>
<br>
</blockquote></div></div>

--00000000000064aaf405a6b0a3a4--
