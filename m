Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.4977.1615787879448941656
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Mar 2021 22:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=ANahIJwL;
 spf=pass (domain: mvista.com, ip: 209.85.218.49, mailfrom: mshah@mvista.com)
Received: by mail-ej1-f49.google.com with SMTP id ox4so48520758ejb.11
        for <docs@lists.yoctoproject.org>; Sun, 14 Mar 2021 22:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SR0bOo+p/kR/DkasssNic8ZqFdzQiDklWeVqs+AeZuc=;
        b=ANahIJwLEONtijcCRuwpsJ4wT75kUzb6Ydg4FdlvZRFklSZ+wy+ytJB4SGP8VMmXyD
         6b4cR4pHpbOriVtcO/6EvhnlxNZu4dIUMRt42lSyb6CUvGNeAWXgUN0WMueiF/9utGUY
         HQil6JOdGwfFN0/N6+SQ42Burj2I8OWqIVLvKpKcw8/Ukp1LR1iYn97YBmyOai+HR0HY
         87PWsOx5SHzwO7FIU4z39sLMRAhnUGTLV+FoYdsiV3uICNJ+Ar6PXIZ+q1WgDExeiJ40
         ychvWJ863s9+IU1ZbALmmcknenTmo7jwAs3MOWV1mEWUE6O8RvgiWBS+0LrTS2h1bFFi
         TwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SR0bOo+p/kR/DkasssNic8ZqFdzQiDklWeVqs+AeZuc=;
        b=ctDwgg7d0qi8fENqztLbYYtLDBwBTMYtPCIa2GovzjLKvN0kYirwKJHphB5dCMOzEU
         FucUd+m6k0aRkOYxSrFTV2vZTFxZ3Sb0puqSzrR2Yb2u7fpkvDXGn3Pov2tKOLK5xY6W
         eEh3dgEsl7O6tHlYV/jjr/FTD+8qFTvSM5fL/pyEJHx+ah/tl+FmHDl5pBT07c2StboS
         8M8KjvmHU/7TnFoKncpl8x/t1r5TaZjUmMWiETb+LhilnDeMkYFKe2CshQias9LW5g5Q
         k7hKQAlj02eopbVvXMzofNIOyKxj3ZHCgBFuPOOw9odiORvOSxpPWxXNmFZER94OJ12i
         MDQQ==
X-Gm-Message-State: AOAM530JN1kwdmXj6BCJbeDgqXuzqpMWg3i43L9m584iWHy7QnZEwtjg
	rNFKzEqXA3WKBddv7ZBaGsvwBhJ+Z4y+ccMVG6nETg==
X-Google-Smtp-Source: ABdhPJz6IlkXDNHdl6I4PWXBCNA1uJB4d9iug5GqyglR/ILXAgSEldpauxCOpwzsbEGMOiQQLS1Gmaoy32T3B3D6oSA=
X-Received: by 2002:a17:906:934c:: with SMTP id p12mr21461718ejw.131.1615787877810;
 Sun, 14 Mar 2021 22:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <1615552603-31220-1-git-send-email-mshah@mvista.com>
 <20210312145402.pah3wae7wuew2i6x@qschulz> <CAP71WjxiupxNDYeQSu0gVjNkOSUkiumax8zTRVH1AOicfxWerg@mail.gmail.com>
In-Reply-To: <CAP71WjxiupxNDYeQSu0gVjNkOSUkiumax8zTRVH1AOicfxWerg@mail.gmail.com>
From: "Milan Shah" <mshah@mvista.com>
Date: Mon, 15 Mar 2021 11:27:21 +0530
Message-ID: <CA+=qD9MgVwHv2GaNsRgBMayZhmaGJ5ONAZeQbUyOz4BvFpvUTA@mail.gmail.com>
Subject: Re: [docs] [yocto-docs][PATCH] ref-manual: added new section library-functions
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Quentin Schulz <quentin.schulz@streamunlimited.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Randy MacLeod <randy.macleod@windriver.com>, Scott Rifenbark <srifenbark@gmail.com>, 
	Paul Eggleton <bluelightning@bluelightning.org>
Content-Type: multipart/alternative; boundary="0000000000007d530405bd8ceeb8"

--0000000000007d530405bd8ceeb8
Content-Type: text/plain; charset="UTF-8"

Hi,

Please find my comments inline.

Thanks & Regards,
Milan Shah

<https://www.mvista.com/>
*Milan Shah* * | Software Engineer*
*a: * MontaVista Software, LLC | Bangalore, India
*e:* info@mvista.com | *w:* www.mvista.com/
*p:* +91-80-4939-5000


On Fri, Mar 12, 2021 at 9:02 PM Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

>
>
> On Fri, Mar 12, 2021 at 3:54 PM Quentin Schulz <
> quentin.schulz@streamunlimited.com> wrote:
>
>> Hi Milan,
>>
>> Thanks for the patch!
>>
>> On Fri, Mar 12, 2021 at 06:06:43PM +0530, Milan Shah wrote:
>> > A number of functions in lib/bb/utils.py are used throughout the meta*/
>> recipe
>> > and bbclass files. Unfortunately the methods for the class are not
>> documented.
>> >
>> > Added a new "library functions" section to the manual in the reference
>> manual
>> > in the yocto-docs repository and document the utils functions to start
>> with.
>> >
>> > See [YOCTO #9612] for the details.
>> >
>> > Signed-off-by: Milan Shah <mshah@mvista.com>
>>
>> [...]
>>
>> > +``contains``
>> > +--------------
>> > +
>> > +Check if a variable contains all the values specified.
>> > +
>> > +Arguments:
>> > +
>> > +    `variable` -- the variable name. This will be fetched and expanded
>> (using d.getVar(variable)) and then split into a set().
>> > +
>> > +    `checkvalues` -- if this is a string it is split on whitespace
>> into a set(), otherwise coerced directly into a set().
>> > +
>> > +    `truevalue` -- the value to return if checkvalues is a subset of
>> variable.
>> > +    `falsevalue` -- the value to return if variable is empty or if
>> checkvalues is not a subset of variable.
>> > +
>> > +    `d` -- the data store.
>> > +
>> > +
>> > +
>> > +See the occurrence in :term:`TUNE_ASARGS` , :term:`TUNE_LDARGS` ,
>> :ref:`image_types.bbclass <ref-classes-image_types>` , and
>> :ref:`migration-1.8-bluez` sections.
>> > +
>>
>> I'm not sure it makes much sense to duplicate documentation.
>>
>> I see an absolute need for bb.utils functions to be documented
>> thoroughly in code, where they are implemented.
>>
>> e.g.
>> https://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/utils.py#n983
>>
>> This seems to be the case for most functions, which is a good thing.
>>
>> What I am afraid with your patch is that nobody will take care of
>> maintaining this copy of the documention from bb.utils code when there
>> will be changes, deletions or additions.
>>
>> Since one should be able to extract Python docstring from a python file
>> with e.g. bb.utils.contains.__doc__, it should be possible to have
>> something autogenerated and thus, auto-maintained.
>> You can probably iterate over all functions defined in a Python module
>> too.
>>
>> Also, I'd probably see this kind of documentation more in Bitbake docs
>> than YP docs (or both).
>>
>> I'd see something similar to what Pillow is doing here:
>> https://pillow.readthedocs.io/en/stable/reference/Image.html#functions
>> which links to:
>> https://pillow.readthedocs.io/en/stable/_modules/PIL/Image.html#open
>> if one wants to see the source code.
>>
>> With a quick google search, I found this:
>> https://www.sphinx-doc.org/en/master/usage/extensions/autodoc.html
>>
>> It probably could be something that we add to our release scripts and
>> then somehow add the resulting rst/html to the bitbake docs. No idea how
>> to hook this up though, just giving ideas (and complaining :) ).
>>
>
> It should be easier for bitbake actually, since the docs and the source
> both live in the same repo. We should definitely look into that.
> This is how it's integrated in the Kernel doc:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/sphinx/kerneldoc.py?h=v5.12-rc2
>

[MS]
Yes. This will definitely increase the feasibility and don't need to update
documents at regular intervals.

Nicolas,
I addressed all your review comments and sent new patch
<https://lists.yoctoproject.org/g/docs/message/903> to the mailing list.
Please have a look at it.


>
>
> then in the .rst file, they have:
> .. kernel-doc:: include/linux/memblock.h
>
>
>
>
>>
>> Cheers,
>> Quentin
>>
>> 
>>
>>

--0000000000007d530405bd8ceeb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:tahoma,sans-serif">Hi,</div><div class=3D"gmail_default" style=3D"=
font-family:tahoma,sans-serif"><br></div><div class=3D"gmail_default" style=
=
=3D"font-family:tahoma,sans-serif">Please find my comments inline.<br clea=
r=3D"all"></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartm=
ail=3D"gmail_signature"><div dir=3D"ltr"><div><br></div><div><span style=3D=
"font-family:tahoma,sans-serif"><font size=3D"2"><span style=3D"color:rgb(0=
,0,0)">Thanks &amp; Regards,</span></font></span></div><div><span style=3D"=
font-family:Arial,sans-serif;font-size:11pt;color:#1793d2"><span style=3D"f=
ont-family:tahoma,sans-serif"><font size=3D"2"><span style=3D"color:rgb(0,0=
,0)">Milan Shah</span></font></span><br></span></div><div><br></div><div>
<table style=3D"width:525px;font-size:11pt;font-family:Arial,sans-serif" c=
ellspacing=3D"0" cellpadding=3D"0">
<tbody>
 <tr>
  <td style=3D"font-size:10pt;font-family:Arial,sans-serif;border-right:1p=
x solid;border-right-color:#fb6303;width:125px;padding-right:10px;vertical-=
align:top" rowspan=3D"6" width=3D"125" valign=3D"top">
	=09<a href=3D"https://www.mvista.com/" target=3D"_blank"><img src=3D"http=
s://docs.google.com/uc?export=3Ddownload&amp;id=3D1Qm7yQfvCvd_kh_U4m6GVByOd=
aJDPquiJ&amp;revid=3D0B4U1D7fiiJwsSjRjMWRWSnByanRKcyszUkE3TzNKcHVZTFlNPQ"><=
/a>
	=09  =20
  </td>
    
 <td style=3D"padding-left:10px">
  <table cellspacing=3D"0" cellpadding=3D"0">
  <tbody>
    <tr>
      <td style=3D"font-size:10pt;color:#0079ac;font-family:Arial,sans-ser=
if;width:400px;padding-bottom:5px;padding-left:10px;vertical-align:top" val=
ign=3D"top">
       <b><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color=
:#fb6303">Milan Shah</span></b>
       <b style=3D"font-family:Arial,sans-serif;font-size:11pt;color:#0000=
00"><span> | </span>Software Engineer</b>
      </td>
    </tr>=20
    <tr>
      <td style=3D"font-size:10pt;color:#444444;font-family:Arial,sans-ser=
if;padding-bottom:5px;padding-top:5px;padding-left:10px;vertical-align:top;=
line-height:17px" valign=3D"top">
	 =20
	=09<span>
	=09	<span style=3D"color:#fb6303"><b>a: </b></span>
	=09</span>
	=09<span>
	=09	<span style=3D"font-family:Arial,sans-serif;font-size:10pt;color:#000=
000">MontaVista Software, LLC</span>  =20
	=09</span>
	=09<span>
	=09	<span style=3D"font-size:10pt;font-family:Arial,sans-serif;color:#000=
000"><span> | </span>Bangalore, India</span>
	=09=09
	=09</span>
	=09
	=09<span><br></span>
	=09<span><span style=3D"color:#fb6303"><b>e:</b></span><span style=3D"fon=
t-size:10pt;font-family:Arial,sans-serif;color:#000000"> <a href=3D"mailto:=
info@mvista.com" target=3D"_blank">info@mvista.com</a></span></span>
	=09<span><span> | </span><span style=3D"color:#fb6303"><b>w:</b></span><a=
 href=3D"http://www.mvista.com/" rel=3D"noopener" style=3D"text-decoration:=
none" target=3D"_blank"><span style=3D"font-size:10pt;font-family:Arial,san=
s-serif;color:#000000"> www.mvista.com/</span></a></span>
        
	=09<span><br></span>
	=09
        <span><span style=3D"color:#fb6303"><b>p:</b></span><span style=3D=
"font-size:10pt;font-family:Arial,sans-serif;color:#000000"> +91-80-4939-50=
00</span></span>
        
      </td>
    </tr>
    
    
  </tbody>
  </table>
 </td></tr>=20
</tbody>
</table>
</div></div></div></div><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Mar 12, 2021 at 9:02 PM Nicolas Dech=
esne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dechesne@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 12, 2021 at 3:54 =
PM Quentin Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com"=
 target=3D"_blank">quentin.schulz@streamunlimited.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Milan,<br>
<br>
Thanks for the patch!<br>
<br>
On Fri, Mar 12, 2021 at 06:06:43PM +0530, Milan Shah wrote:<br>
&gt; A number of functions in lib/bb/utils.py are used throughout the meta=
*/ recipe<br>
&gt; and bbclass files. Unfortunately the methods for the class are not do=
cumented.<br>
&gt; <br>
&gt; Added a new &quot;library functions&quot; section to the manual in th=
e reference manual<br>
&gt; in the yocto-docs repository and document the utils functions to star=
t with.<br>
&gt; <br>
&gt; See [YOCTO #9612] for the details.<br>
&gt; <br>
&gt; Signed-off-by: Milan Shah &lt;<a href=3D"mailto:mshah@mvista.com" tar=
get=3D"_blank">mshah@mvista.com</a>&gt;<br>
<br>
[...]<br>
<br>
&gt; +``contains``<br>
&gt; +--------------<br>
&gt; +<br>
&gt; +Check if a variable contains all the values specified.<br>
&gt; +<br>
&gt; +Arguments:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 `variable` -- the variable name. This will be fetched =
and expanded (using d.getVar(variable)) and then split into a set().<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 `checkvalues` -- if this is a string it is split on wh=
itespace into a set(), otherwise coerced directly into a set().<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 `truevalue` -- the value to return if checkvalues is a=
 subset of variable.<br>
&gt; +=C2=A0 =C2=A0 `falsevalue` -- the value to return if variable is emp=
ty or if checkvalues is not a subset of variable.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 `d` -- the data store.<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
&gt; +See the occurrence in :term:`TUNE_ASARGS` , :term:`TUNE_LDARGS` , :r=
ef:`image_types.bbclass &lt;ref-classes-image_types&gt;` , and :ref:`migrat=
ion-1.8-bluez` sections.<br>
&gt; +<br>
<br>
I&#39;m not sure it makes much sense to duplicate documentation.<br>
<br>
I see an absolute need for bb.utils functions to be documented<br>
thoroughly in code, where they are implemented.<br>
<br>
e.g. <a href=3D"https://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/li=
b/bb/utils.py#n983" rel=3D"noreferrer" target=3D"_blank">https://git.yoctop=
roject.org/cgit.cgi/poky/tree/bitbake/lib/bb/utils.py#n983</a><br>
<br>
This seems to be the case for most functions, which is a good thing.<br>
<br>
What I am afraid with your patch is that nobody will take care of<br>
maintaining this copy of the documention from bb.utils code when there<br>
will be changes, deletions or additions.<br>
<br>
Since one should be able to extract Python docstring from a python file<br=
>
with e.g. bb.utils.contains.__doc__, it should be possible to have<br>
something autogenerated and thus, auto-maintained.<br>
You can probably iterate over all functions defined in a Python module<br>
too.<br>
<br>
Also, I&#39;d probably see this kind of documentation more in Bitbake docs=
<br>
than YP docs (or both).<br>
<br>
I&#39;d see something similar to what Pillow is doing here:<br>
<a href=3D"https://pillow.readthedocs.io/en/stable/reference/Image.html#fu=
nctions" rel=3D"noreferrer" target=3D"_blank">https://pillow.readthedocs.io=
/en/stable/reference/Image.html#functions</a><br>
which links to:<br>
<a href=3D"https://pillow.readthedocs.io/en/stable/_modules/PIL/Image.html=
#open" rel=3D"noreferrer" target=3D"_blank">https://pillow.readthedocs.io/e=
n/stable/_modules/PIL/Image.html#open</a><br>
if one wants to see the source code.<br>
<br>
With a quick google search, I found this:<br>
<a href=3D"https://www.sphinx-doc.org/en/master/usage/extensions/autodoc.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://www.sphinx-doc.org/en/mas=
ter/usage/extensions/autodoc.html</a><br>
<br>
It probably could be something that we add to our release scripts and<br>
then somehow add the resulting rst/html to the bitbake docs. No idea how<b=
r>
to hook this up though, just giving ideas (and complaining :) ).<br></bloc=
kquote><div><br></div><div>It should be easier for bitbake actually, since =
the docs and the source both live in the same repo. We should definitely lo=
ok into that.</div><div>This is how it&#39;s integrated in the Kernel doc:<=
/div><div><a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git/tree/Documentation/sphinx/kerneldoc.py?h=3Dv5.12-rc2" target=
=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git/tree/Documentation/sphinx/kerneldoc.py?h=3Dv5.12-rc2</a></div></div></=
div></blockquote><div><br></div><div><div style=3D"font-family:tahoma,sans-=
serif" class=3D"gmail_default">[MS] <br></div><div style=3D"font-family:tah=
oma,sans-serif" class=3D"gmail_default">Yes. This will definitely increase =
the feasibility and don&#39;t need to update documents at regular intervals=
.</div><div style=3D"font-family:tahoma,sans-serif" class=3D"gmail_default"=
><br></div><div style=3D"font-family:tahoma,sans-serif" class=3D"gmail_defa=
ult">Nicolas,</div><div style=3D"font-family:tahoma,sans-serif" class=3D"gm=
ail_default">I addressed all your review comments and sent new <a href=3D"h=
ttps://lists.yoctoproject.org/g/docs/message/903">patch</a> to the mailing =
list. Please have a look at it.<br></div></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail=
_quote"><div><br></div><div><br></div><div>then in the .rst file, they have=
:</div><div>.. kernel-doc:: include/linux/memblock.h<br></div><div><br></di=
v><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Cheers,<br>
Quentin<br>
<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000007d530405bd8ceeb8--
