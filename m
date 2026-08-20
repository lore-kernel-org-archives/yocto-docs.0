Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B7EC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 16:31:56 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2142.1787243506913638394
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 09:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=DMq+WVKk;
 spf=pass (domain: cherry.de, ip: 52.101.69.60, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSMtLuZ0VeMqhjGqvC2hL1QT3ixknZ3hQbJlb6i38as7V4dmt1vqjUCCt1MF1fU9tiD4hMM071RC/4lpMVWu/9INitO+bVzh9JzI9C4mY8ESqkT1MQwSmaP/kk1fvW8X+JzFKuI/LgJut3xRrVat8X5ycjrZpix9AjOrTrYCgrlAPkh9/543iQqoyvODa6wXsxhYjaRE1oNWX0vLgieg9iZCB0l6EzmiJwPC+Tr1NpKExYaEByGGpQ3Lz8tsMPgz41uEnNxk8GtlDrVuwXbeughzejiFJSeqwfhj/eEUyp3s/o1qA2Nh4wn8wD8boctz8FCbNGPNWmPQzdFJQpEa1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXrJp5785gdyhMYaJSkh8YPCYBgWFgHD/NjVaCForXY=;
 b=QDCJpRR2NXeKho47Gu3ksWQPDRMmFzIyG2RkZuhP5dTrP+uSo2dcGTrIELzUimh8gQYdifyL9iZBsNUPciW3E6JTqSc9BFfAeTSk8f7YfCfJJaYiMcja2m1GEKbwRyAIz7yU47i5N2jyqyYvpY+2UJCbffhgUFxDErkaxMmxxyfyZDTyDu9zwSCsvN8eMLdsvARrqccJjXkVBYxzqI0uCe4LTVCVeyDEhrj/xQjPX/ZJ+501V40jpVU7t0uF7mNlnqIgf99fFwPQjsnGucQ3eeATcdCN6PkwWwHJVLzqXv4nn2K+Vx7yhoeHWq7afNErzvUPD3gWHSowDZaCXRmyDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXrJp5785gdyhMYaJSkh8YPCYBgWFgHD/NjVaCForXY=;
 b=DMq+WVKkLdDkXmTlF8NTEYHBxJZK5ztbVvhp324c1/QoF8sl36LChDdDwZTxiU/CUL2P525xnexAqL1WcC1fgnCFPE4zRpECz9WBBR2f0sa5vVtt7qL51MH7HtMzDvHY/Nrxug4JR46WJW6J7RDAWHiR6VBQYIGPEr1/4it4mNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by PAXPR04MB8653.eurprd04.prod.outlook.com (2603:10a6:102:21c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 16:31:40 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 16:31:40 +0000
Message-ID: <7cb4a92a-9eaf-4592-a99d-286d65f76b5c@cherry.de>
Date: Thu, 20 Aug 2026 18:31:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] commands to do "pip install" in docs README file need
 enhancing
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
CC: tgamblin@baylibre.com, YP docs mailing list <docs@lists.yoctoproject.org>
References: <959e65b6-e7eb-bcc3-992f-bed7276c8449@crashcourse.ca>
 <DKTSXW5WZTQW.383TF2WMPIE77@baylibre.com>
 <1b02e8ba-0946-40b0-a8e7-a381fd8cb81e@cherry.de>
 <49274709-3cac-6623-0c3e-7e4b1656e034@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <49274709-3cac-6623-0c3e-7e4b1656e034@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR0102CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::35) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|PAXPR04MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: d131bd73-0f89-49df-8bb3-08defed8834a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|10070799003|376014|366016|1800799024|6133799003|3023799007|56012099006|10067099003|4143699003|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ffoSRyizkmDPYKi1tdV8paU31HAgRZGfBh4EXLq3PCx875J1NcTtKwuSZtgIhNAjVBExiXAd5Z/F3rcIN9bXi+8s/JOk+QZIwIQn4lzCAEAceE7QV1T2jFbyn4a+KQNvdZqul4yw7OTQtWoaCjuDef0pDc3KWWm1IKG+alQkxUDfCNFc45greQ9+IvMwplwq6zaewJevEt6D3RhJeATsMFLKf2vX2vyp/pdNTwuG0ynz5NgGPbPj2aCX8BkER+lm7XKdgKHG8t1+geYbsvgAM88NVBcQva0GsnKHrBc3QnWzITO3HLQ/yXUpY6KLud3YCHhXaAPknQWPsr0SYn+3fHkm6a6OmH6XQTBTvA7gTTRutMFgqBF9KO7FaMvSu5uJPXinnpuLMY7NWHG9L4CauSY6G5i1mJ/kC15dJIPWcshrQz/R1vMCc+tPKJU+FVeCb+RVeKQGRWReNnYwz59EywRhtJh6pNS+mA97lEtLmt0S/h+uO94b14IbcNJouuA7QoStUbOkOO9T/8Gm6Yj7sHqQ4oSCzg4v7zJWy0eoh1LUmdYvClqlJ6sTkHqEDC63wQcQOJsfEuXRayFq7w1ElAW2+1efb44+60AxrhJODx0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(366016)(1800799024)(6133799003)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?f896jEwTjDm5r2vStco34d232cK3Y3xcC6mIGm+vgP5e04pBrV0GWPw2QXlx?=
 =?us-ascii?Q?QvIcwlpVlDgqbKzQLYeKmAUzJZSyANlg1FTqv7rXx/PAet6C5u5YXroZkR5e?=
 =?us-ascii?Q?5Zr8Xtdgp/d+XU78yds4SgtRq9924bhz32ATnq/Yv5G5pCjy7VNYywHszrfG?=
 =?us-ascii?Q?jl2rNMQjDaDQq5YDhKsPX+AkE0d1gtUNKMMHYmg3eKjNT5qKq7H19g8/Ap7t?=
 =?us-ascii?Q?ZTzNDnJTUy+VwQPhWloOFS5lBJDnO7phQlGCLeRfjp2J0cjavBDoiD3Rr33a?=
 =?us-ascii?Q?OmQOOk1ZwUwSTg0EOgqXNdyQquAf6g+YSvk3DX0c2RSlvGwPJ5hVUCxZWXsN?=
 =?us-ascii?Q?W1MdSbXBaH3BQ9he1f/ICH4VUZVQHBtahw2yKnhUoKykaq7DQ50K779CPheo?=
 =?us-ascii?Q?+HbwVqx5beFtK/xqH2t4lCwTaqX17LftcPktBX7UlRXt0OCY7nhE8U9aXyvS?=
 =?us-ascii?Q?p2+LYj3h5GwaAR9LBIn/P8h2oUIERmYEm3hLfRQeGz3QsXqqIZxfqSndc8/f?=
 =?us-ascii?Q?lSz9VZ21NpxuKkWaKSrCHI4pa78mvaW3mFsmJQw8BeJF8h2CgAi0vStmSa/E?=
 =?us-ascii?Q?X0wJp6kD08T7inIFXWHoSxAW6SC15WqWzBeD9Pscyo9rjfa0Ugy1YUCEaKl+?=
 =?us-ascii?Q?MSoMzNMEYoq8WXbKVP9A3vnBTaM99Gic2JBIwfT0CZYDjF4AEEGYPj7KNrDo?=
 =?us-ascii?Q?lWRBUlvjTO6kCTHARRfwLSCdmYwTcTp7UVBTG8Hvk37M4t5xkMQnSitoMPOt?=
 =?us-ascii?Q?DPTYkJCe5rLdT+4KSD7bojWvJ6j3i4RFdYPatBcnDWZ/s0Tlx+zBOCP/r67P?=
 =?us-ascii?Q?cuiakrP7Ck5IDSpdCN5cfCX5FCxLM6PKIR4r19UW+LIijVRpwhx596FQvF9n?=
 =?us-ascii?Q?0seTv5c1j59NiMhVZdqcpO0rjhovD9CVKfDGQamTeFa6PPYabyrc6rmdfiwd?=
 =?us-ascii?Q?t3z9ZMeIQdfyHK+yXBedU2llgBi5GovFvQWGxMsLTA2eLg7BniPJfMS90vNU?=
 =?us-ascii?Q?lcPfLDnZjZ7IHhs2tafvpQrwfKcPwAUJnPTO7wOy7wB57FSg11h4Vc2UbqeT?=
 =?us-ascii?Q?A13yLjhe4ro57YoCm+POFyhNiS5rhTPlD6R4RvHnKxkfnr5vAisn4fjKNICY?=
 =?us-ascii?Q?6DJTv9H8j7JQbNL2U6SopZ4QBJRydadJtuKihjl9NNdJTj3DyWUgyIG9V38n?=
 =?us-ascii?Q?4U1ptOtdf//k4odlbpaN7gLaU9CJ+vHPjPaBZtte1VD5EU1wpqH3OV1S7uZj?=
 =?us-ascii?Q?ltSm4cbpewjbxfOR2XNLwZa7HcA/Tbga/MshytpGGfGcul478JTtLXRwAUrP?=
 =?us-ascii?Q?zkgE4ePN0Cjs8+Ophg87IuJVz/7myFg1U863yohPHAujJchx4nSR4BYwij8X?=
 =?us-ascii?Q?qeYFOHomkglbc1Fsby9pECNB1JyhAD8cX3npZFSjji6n0ZxZPA30HB1GyFxv?=
 =?us-ascii?Q?r8RYkr3e7zWHfLOkS428Kh9BLPW5G6Y7ll+oDeTnLk1dMUWn5ub+wkN3/guC?=
 =?us-ascii?Q?NrEVTN3hnl+a/3AtUWVL8TNF2/HwDZkr7gSBHhq9VW3FTUpKZ0h31DjdMQn6?=
 =?us-ascii?Q?p0TGD1zs38NoYezJ7fE6gAzda18QTrjbjCUpnYYE6gp1BZoSGw9jrSaxTe40?=
 =?us-ascii?Q?t1vIuqFzgGDUdbDCdTkv2+uf7P/yZYIckoP6et4dg3116jd0SohHz9WKr0tl?=
 =?us-ascii?Q?s82nDfCc3Dd5xJOEYVmTblwaPJxcM2E9ACz2NPQw4x67BtvxvypoeApkGqBa?=
 =?us-ascii?Q?UJeh4zsCuGqsTyPC+x437iEG/W6AMREXG7rLkI2eLPp4ShZSjwuwLKvnsNx0?=
X-MS-Exchange-AntiSpam-MessageData-1: DcVcBImms9VE/Q==
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d131bd73-0f89-49df-8bb3-08defed8834a
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 16:31:40.3960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpvBd5v+VUVcpCO6SpHxpKv5RCfiK28eAiXP5yvQee8kdj/+fY2TwFje5L68HkGD0JDK6yNbXkiFu+u8rxnlvIwly0CPHjiZIbXFStMcouU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8653
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Aug 2026 16:31:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10305



On 8/20/26 4:58 PM, Robert P. J. Day wrote:
> On Thu, 20 Aug 2026, Quentin Schulz wrote:
>=20
>> On 8/20/26 3:23 PM, Trevor Gamblin via lists.yoctoproject.org wrote:
>>> On Thu Aug 20, 2026 at 7:20 AM EDT, Robert P. J. Day wrote:
>>>>
>>>>     I just went through this with another Sphinx-based documentation
>>>> repo -- installation instructions that advise the reader to install
>>>> Python modules with "pip install" fail on my Debian 13 system with:
>>>>
>>>>
>>>> $ pip install sphinx-lint
>>>> error: externally-managed-environment
>>>>
>>>> =C3=97 This environment is externally managed
>>>> =E2=95=B0=E2=94=80> To install Python packages system-wide, try apt in=
stall
>>>>       python3-xyz, where xyz is the package you are trying to
>>>>       install.
>>>>
>>>>       If you wish to install a non-Debian-packaged Python package,
>>>>       create a virtual environment using python3 -m venv path/to/venv.
>>>>       Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
>>>>       sure you have python3-full installed.
>>>>
>>>>       If you wish to install a non-Debian packaged Python application,
>>>>       it may be easiest to use pipx install xyz, which will manage a
>>>>       virtual environment for you. Make sure you have pipx installed.
>>>>
>>>>       See /usr/share/doc/python3.13/README.venv for more information.
>>>>
>>>> note: If you believe this is a mistake, please contact your Python
>>>> installation or OS distribution provider. You can override this, at
>>>> the risk of breaking your Python installation or OS, by passing
>>>> --break-system-packages.
>>>> hint: See PEP 668 for the detailed specification.
>>>>
>>>>
>>>>     Yes, there are solutions, such as using "pipx" instead of "pip", a=
nd
>>>> what have you, but it seems that the README file should be augmented
>>>> with an explanation as to how to deal with the above given that the
>>>> "pip install" commands are, in some cases, guaranteed to fail.
>>>
>>> Creating a venv like the error suggests (or via uv) is simple enough an=
d IMO
>>> best practice for anything like this. You could submit a change to prov=
ide
>>> short
>>> examples, even replacing the references to pipenv earlier in the file.
>>
>> It's not that simple (though not that difficult). A venv by default
>> is completely isolated and doesn't use anything from the host. The
>> issue is that by doing so, you won't be able to build the docs, only
>> run sphinx-lint, which isn't ideal. You should probably reuse the
>> same venv as documented in
>> documentation/tools/host_packages_scripts/pip3_docs.sh instead.
>>
>> You probably want to update the instructions for Vale as well. We
>> still support pipenv though, via documentation/Pipfile as far as I
>> remember, so that's another option. Maybe add something in
>> dev-packages for example. No clue, I don't use pipenv.
>=20
>    i just *knew* i would regret asking that question but since this
> absolutely *needs* to be resolved so that the instructions in the
> README work, here's one solution.
>=20
>    forget about venvs (at least for now). the only two packages that

It's what we tell the user to do to build the docs.

> need installation to run the executable commands sphinx-lint and vale
> are the packages with the same names, and they are special cases since
> their purpose is to supply those commands, so the simple solution is
> to install using "pipx", which is designed precisely for that purpose.
>=20
>    one can install pipx with pip, then follow that with:
>=20
>    $ pipx install sphinx-lint
>    $ pipx install vale
>=20
> and it all now works just fine on debian 13. maybe down the road get

Does it? I tried from within a container. First it tells me the path=20
pipx installed to isn't in PATH so it won't be available. Then it tells=20
me to run pipx ensurepath, which I do, and it then asks me to logoff or=20
source ~/.bashrc. Only then do i have sphinx-lint. What a pain. Then I=20
follow our instructions and install the sphinx packages in a venv:

sh ./documentation/tools/host_packages_scripts/pip3_docs.sh

I then source the venv:

. yocto-docs-venv/bin/activate

and then I run

make sphinx-lint

and you don't have sphinx-lint available. So you either build the docs,=20
or run the linter, but not both without doing some gymnastics...

> fancier with "uv" or whatever but the above will just work, no?
>=20

The tool needs to be available in the package feed of all supported=20
distros for us to consider using it I think. I wouldn't want to document=20
installing uv via pip and going into venv inceptions.

How about:

"""
diff --git a/documentation/Pipfile b/documentation/Pipfile
index 67fce078d..737f8bcea 100644
--- a/documentation/Pipfile
+++ b/documentation/Pipfile
@@ -4,6 +4,8 @@ url =3D "https://pypi.org/simple"
  verify_ssl =3D true

  [dev-packages]
+vale =3D "*"
+sphinx-lint =3D "*"

  [packages]
  sphinx =3D "*"
diff --git a/documentation/README b/documentation/README
index 4701357c3..5a90ad0ca 100644
--- a/documentation/README
+++ b/documentation/README
@@ -127,19 +127,19 @@ to validate the text style.

  To install Vale:

- $ pip install vale
+ $ pipenv install --dev

  To run Vale:

- $ make stylecheck
+ $ pipenv run make stylecheck

  Style checking the whole documentation might take some time and generate =
a
  lot of warnings/errors, thus one can run Vale on a subset of files or
  directories:

-  $ make stylecheck VALEDOCS=3D<file>
-  $ make stylecheck VALEDOCS=3D"<file1> <file2>"
-  $ make stylecheck VALEDOCS=3D<dir>
+  $ pipenv run make stylecheck VALEDOCS=3D<file>
+  $ pipenv run make stylecheck VALEDOCS=3D"<file1> <file2>"
+  $ pipenv run make stylecheck VALEDOCS=3D<dir>

  Lint checking the Yocto Project documentation
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -149,19 +149,19 @@ the project uses sphinx-lint=20
(https://github.com/sphinx-contrib/sphinx-lint).

  To install sphinx-lint:

- $ pip install sphinx-lint
+ $ pipenv install --dev

  To run sphinx-lint:

- $ make sphinx-lint
+ $ pipenv run make sphinx-lint

  Lint checking the whole documentation might take some time and generate a
  lot of warnings/errors, thus one can run sphinx-lint on a subset of files
  or directories:

-  $ make sphinx-lint SPHINXLINTDOCS=3D<file>
-  $ make sphinx-lint SPHINXLINTDOCS=3D"<file1> <file2>"
-  $ make sphinx-lint SPHINXLINTDOCS=3D<dir>
+  $ pipenv run make sphinx-lint SPHINXLINTDOCS=3D<file>
+  $ pipenv run make sphinx-lint SPHINXLINTDOCS=3D"<file1> <file2>"
+  $ pipenv run make sphinx-lint SPHINXLINTDOCS=3D<dir>

  Checking for broken links in the Yocto Project documentation
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

"""

Cheers,
Quentin

