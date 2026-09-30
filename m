Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA5CCA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 15:36:17 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16588.1790782568758927324
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 08:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Cp/6uB0U;
 spf=pass (domain: cherry.de, ip: 52.101.66.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJ2gFPP6MCYbELYJbQVvruzBKXX+ty80XqeQqSiAkJJaFSpQnGNXs4oijZVnwJmP9LovF3C/xfP60h1BxhlkzFIQfcHHsNSg1Pxf4x/2qdxiRMjwd7uG6Rvf5z35+gNUaV+IyKOMMB5Ab9ibU98yMF2MD/fDUtyrxZYfmLztA4PijPZYn5NCNcvd4SuHRldLzbrMGsunk5Ai+zf0XMp7Qs4947pt+PO9bNekWhvJRbbK8Kaxi+irOnQ6I4i9ybpuSd5EpHOJxwLsseUk0MyV4hBY6SCZ1WIkMs1/p34jI70T56SWwiJVV2UmFtnComx2IDy4/kmwmy2fABDnFxdfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6RN9/H4A4EIeQMPVUXW8xofQsVsOBLhUHjJFFuyDM4=;
 b=O0J56N4bo4nVqjzaz5OdM+9gsobEQ/nSiO8rgS+WDQw5CAkREU/fVxI3rYuXacb6ZMOHNmJ4c/MC8IB3o+ELgZlE0B43/OkNd5cLqD5+BJxCXhpv91CTGuXvVJj68HnZFQU2FAYfWzVs4gXsh0n8ey8sYdFLnweygMaEQKT2veV49eHC4fhIoYro+tTIqaOTxekc8dBRlyRkkKXBryKHahb53ovBMr2hMozZH5KtXS8mCeYH7/UyAbZQow7Zdb1Z41kGbbIJltNwbdrMprzl5cdv5BKaboieCKksToYMC0JIzbEVee2Jrse7aZSpD+VYxdqkyMI9s3bEcJThB+5f1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6RN9/H4A4EIeQMPVUXW8xofQsVsOBLhUHjJFFuyDM4=;
 b=Cp/6uB0UYqEaBzLgzRRcxbkWN/jF98e3KivYKuarKmNNZCjCCNcjeqZe7CFWiRfBiIxwv0gDtlwqgur4LLHsBzzae9v8yeLyA0U4uXw/E6HAFYof5Dp1RSOIOf275jL7D3vchD/gPZg3CKNm1oje+qzkPJbIXw8H2u7C1hmMEnc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by PA4PR04MB7679.eurprd04.prod.outlook.com (2603:10a6:102:e0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 15:36:00 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 15:35:59 +0000
Message-ID: <3464b875-0c8d-4f18-b2e2-24a333ebc817@cherry.de>
Date: Wed, 30 Sep 2026 17:35:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 0/5] dev-manual/devtool: ide-sdk doc rewrite and
 Mermaid diagrams
To: adrian.freihofer@gmail.com, paul@pbarker.dev,
 AdrianF <adrian.freihofer@siemens.com>, docs@lists.yoctoproject.org
CC: antonin.godard@bootlin.com
References: <20260924192929.907566-1-adrian.freihofer@siemens.com>
 <8e8a2198ffc43898045566b07fef83c011ad9697.camel@pbarker.dev>
 <52604c0a16ab13ed6ac8a567d7e22e731d164bf0.camel@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <52604c0a16ab13ed6ac8a567d7e22e731d164bf0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR07CA0246.eurprd07.prod.outlook.com
 (2603:10a6:802:58::49) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|PA4PR04MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: ace07b3a-cb19-4843-58bb-08df1f088718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|4133799003|3023799007|6133799003|10067099003|4143699003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	ysfSow6Zb1gNRLcCt8to3srkbwjp9x+tlxQvxJvxU11mLyxPk4+j1r8DL3I4TBNMeA1lJRYAlAXeOmdXQOGK3rbQRlhp6GUKnuWHNqCrDNWlldd8knXTGS/DfbfyZo0NoEiclbiK+yHE1PQ0BLBhoq2pt5mC7X/eJ1gq2en2pYVxL9x1yHETmc70Png7StjzCvlH47yBwoKHXClJJfaZW9vGecYGsPkRuOcJCGnhKgK2RxRY54A/63u5YfNtwnMO46bLxWnT2RJA5TISTe1MI517DOb58/IqjSSIb6l9n3n4zZGvlvAKndDV/3Rd6mzGoP2O9QCLGECGpQ2yrRemIitdm9J3ew+LBHnGhkrYOnaVTzX5TFz7bhI4fe6ePQAaqn00R13CT6TJjJ5U7sNQZV9FVVOa324zlXQxjfijTxH3pygOxTvbS8tRoHMdX3NdqtzURbG2khDIbD+tBNI62IlBcmL6o5I3aC/t8rukYHu0+FaT+FsIj3IHpSlyQTuzG9wY4DwG3tytWr70yvj9UwldPbTgjayXXGWo5ZhpZwE0BhYjiIbKm/v5+sl5XrsaF7e422IRm0ax9lOKBvb6oIAqT28FPT+mZmAD0lqynYk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(4133799003)(3023799007)(6133799003)(10067099003)(4143699003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FkyHloM1vmPPal3En+I7lOrZoYszB+nY0irJZj3BZh+aS0VM5tfEp0s9uH2I?=
 =?us-ascii?Q?T3Oh3Z0S4gXbZ69cubyLaK/pf/yBkrBT6uL2K5vjPxLYRMHbMEtgGjS3va/A?=
 =?us-ascii?Q?CR23JGhvH85sZKDDLV9KO39bODStRCqILCDUl9oeLZE3oDGsL2pIU1QHnndx?=
 =?us-ascii?Q?aGU0Ol5uh2FGj0JrmkzET0++rNq+5xYl48RwaZosv8p41Wjxqqs1UY3X16Aq?=
 =?us-ascii?Q?ouUdHiXXAMuRbHsRKOfMNxxqSMdIcb4to1jywg1aiaHopWHMfqv3BiYl70PN?=
 =?us-ascii?Q?WlgIoqWVm4QbMAkA2FCKFHDEA+u4ZlqOG9r8s8O+Q8mKuIFQUOWtQ91cRu9H?=
 =?us-ascii?Q?pn6Wo0Ys+IcS/VkqwLJ3HJP1YaX1DLlbnDYg/wawp22qUSm2e8UrTTplu0PL?=
 =?us-ascii?Q?OmvQzgObN7TG7XxdM6cO7svZhMKw5cmqaCWykQtMgpcovooNpkg5EyATwvcn?=
 =?us-ascii?Q?BzBHAy5HhyiaHRmyMYqrEyV34cHmEiqJ7hWwUGwT7ymis2A3lPfKkmoRynM7?=
 =?us-ascii?Q?VZ2udM9P3h0IF6e7fuyaoHt9yEQC4wJW3Bm4leh8U4Mo8BMt5ciIRGHhtzay?=
 =?us-ascii?Q?Htka6qThtCWtSAKXAsUrTi3VDfUcaac4NpARCQbSjb18cbf477ME5VoK65uk?=
 =?us-ascii?Q?mK6dsDIpRZqkXAKfKAEnGTBZQmOfOQquvHF5Rjbr5vlm/HbNzvleLSn9b9qq?=
 =?us-ascii?Q?nUff3huDCh1aZdWYiakY0L8iTOyzNL9pASkNWw2ssu6om5+OVpUTPLQrEsGH?=
 =?us-ascii?Q?AkE7pQCJ8vxhd8nEFzXJepkSliPnbMIcUxqE8iH0dMehfm7Ug0lNAu1kGvYd?=
 =?us-ascii?Q?kduGAW3N2uvcoXLHP7ynmGjB4dqHIW+kwIa0aEigDfi0ADAlT9PoJtKE23Xm?=
 =?us-ascii?Q?0mAUjtv0iQEHCR/rKz/9tsWl6rvo6kFQpFd/imQj/+tcV/+MnukuW0U4kpjV?=
 =?us-ascii?Q?6wwtRCdea/gWzQwt+bmUXrx3ztT9l3dGQ9pYb3hYkk/cQz7/FIWVCNqn66FS?=
 =?us-ascii?Q?PS6puKHnFwH9cQaWXS3wBnA3YavFh3cZEh4wtmN8DhpJMesSodT2ROGGt+RW?=
 =?us-ascii?Q?ru8UjvjW/JKhgJASYj19Hm5d15Z3vdmNom5s7mwqQ4jjDexCGi++W1MP0RMu?=
 =?us-ascii?Q?7lnIds2sceuKqJLwpT9Fkn90i2GUDWxpgQrFI2kDBdsA6d4vd1pRwyapRYu5?=
 =?us-ascii?Q?mo0GjEZdVIPd+oVd+IBUWZyaxCE5vcqZJcmtieGKxl3ZC+yEEOw974umbqbT?=
 =?us-ascii?Q?sdvhr0ouwZZ4ny2/xiHrKoeqM1P+tAe8UgORe3Z9nSUIK+yRiwu95CjVQeis?=
 =?us-ascii?Q?XC7SdSof35190eJVhJxKK/keH22bFxa0H73O+RLCbSGCLxK8UayKrlJ47PY3?=
 =?us-ascii?Q?YY5XipirKLlL/eZUg/lwjw2bYE5mpPNPUS6HYztZpo/1SvguCtZs0KUqEXku?=
 =?us-ascii?Q?pO1fmLyMJSR5H+T047fJh44nVoEzhlY0ll01Ync2EfUJxQ/magdEKcZsAqhA?=
 =?us-ascii?Q?51r3VSH+/UnP6a0P3q59Hm8aMo7lxqNQCc1DK5oi4llascbpCF9BwPrQ+wCZ?=
 =?us-ascii?Q?N8GeGM8ixONFb4c+DYSrQO/exU8ZUwwcW9ImVfd2YHQ4+oT8qC2iFQmXuD7P?=
 =?us-ascii?Q?DiwvWGvPSdN810Ok3zEIKI6ddSMYIFo/yDMOwQocX5V7ah5G/QhA/EPH3R30?=
 =?us-ascii?Q?W5SlFl+1dobIW4oD7NkPGCZb40JMdUkw7ciUKGz7HGMknL9esEwtn7xUz/Dp?=
 =?us-ascii?Q?wv9LLcL/sg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ace07b3a-cb19-4843-58bb-08df1f088718
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:35:59.8527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10oGmIqxs2F1E6wTI5AVN8oIbNnkf2qUg23+SBux9rXTYh9J1wUn2I5rcKWHfnbv/x0BaN7kTdUTbJBZ5D+GvB1CVSDNrQMcrQZAlQq+06k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7679
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Sep 2026 15:36:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10643



On 9/26/26 3:45 PM, Adrian Freihofer via lists.yoctoproject.org wrote:
> On Sat, 2026-09-26 at 14:21 +0100, Paul Barker via
> lists.yoctoproject.org wrote:
>> On Thu, 2026-09-24 at 21:29 +0200, AdrianF wrote:
>>> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>>>
>>> Update the "devtool ide-sdk" section to reflect its current
>>> behavior,
>>> and fix outdated non-patch local file handling docs (5.1 change).
>>>
>>> Add the sphinxcontrib-mermaid Sphinx extension, add workflow/
>>> architecture diagrams for "devtool ide-sdk", and convert the
>>> existing
>>> devtool add/modify/upgrade flow chart PNGs to Mermaid too.
>>>
>>> Diagrams render client-side via a CDN-hosted mermaid.js, so the
>>> build
>>> server needs no new dependency.
>>
>> Hi Adrian,
>>
>> Expecting clients to fetch the CDN-hosted mermaid.js breaks the
>> ability
>> to render the diagrams offline for local reading. We also generate
>> PDF
>> and ePub versions of the docs - would this change require CDN access
>> to
>> build those?
>>
>> We may be better carrying a minified copy of mermaid.js and setting
>> mermaid_use_local [1].
>>
>> [1]:
>> https://sphinxcontrib-mermaid-demo.readthedocs.io/en/latest/#mermaid-use=
-local
>=20
> Hi Paul
>=20
> That might be a good idea for the HTML case, but I was unsure how it
> would work for PDF or EPUB outputs. It=E2=80=99s not possible to embed th=
e
> dynamic Mermaid rendering engine directly into a PDF or EPUB file.
>=20
> For PDF and EPUB cases, the rendering needs to take place at Sphinx
> build-time, which requires a JavaScript runtime on our build machines.
> I had a quick chat with Antonin about this, and he mentioned that an
> infrastructure change like this would need some evaluation.
>=20
> We can actually support both formats seamlessly using the
> sphinxcontrib-mermaid extension along with mermaid-cli (mmdc):
>=20
>   * For HTML builds: Sphinx serves client-side JavaScript as planned,
>     rendering diagrams in the reader's browser without extra build
>     dependencies.

Do we really want to require the user to run JavaScript to render "images"?

I've very quickly checked our docs with NoScript enabled, the search=20
doesn't work (but it tells you why) and the drop-down menu to select the=20
version of the docs is gone as well but that isn't something essential I=20
believe.

Since it's possible to render images at build time, I think it'd make=20
more sense to render them also for HTML, and it also gives us=20
consistency in behavior with PDF/ePUB (and we would detect earlier if=20
rendering is broken in the HTML variant, the one that I assume most=20
people consume).

>   * For PDF / EPUB builds: Sphinx automatically uses mermaid-cli
>     (@mermaid-js/mermaid-cli) behind the scenes during build-time to
>     rasterize/convert Mermaid blocks into static SVG or PNG images,
>     embedding them directly into the output document.
>=20
> On the infrastructure side, this requires adding Node.js and running
> npm install -g @mermaid-js/mermaid-cli on the documentation build
> runners/CI environment. Would this be feasible?
>=20
I think this means we need a recipe for mermaid-cli in OE-Core and have=20
it installed in the buildtools-docs. This means we now have a critical=20
package in OE-Core that uses NodeJS and the npm fetcher. We've recently=20
re-enabled the NPM fetcher but it's been a liability before so not sure=20
if the project would like to depend on that for building the docs. Maybe=20
there are other alternatives (Python would likely be fine as we already=20
depend on it for Sphinx and we already tell the user to install some=20
packages via pip; for the rest, it would be *very* beneficial to have=20
packages in *all* distros we support).

Cheers,
Quentin

