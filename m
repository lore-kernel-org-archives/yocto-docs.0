Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B26C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 16:44:17 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.71])
 by mx.groups.io with SMTP id smtpd.web10.22016.1736786646779224426
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 08:44:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=iWueiCdO;
 spf=pass (domain: cherry.de, ip: 40.107.21.71, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcu6E/qzi9orMizoM94HfQK+gkRjfONm3RcGF01X5t+5EVs5mKxLpQQOK/8EOV6695Cma2Zy5+Dx2qmsodMqNXNUtrtr0FT7ypHCGEu4eX+CstcR9Q1X7dufomZ806B+JxghbWJ3H9pYbYsnOVmNjYVVAjXqMAitWmSmk6FZFszhbTq96YdthnpUm0X5nxy69Z4sjwREuHbWYZ5Yd/4couoxxOVcPg1bjg7M7Jfv7lxPPEg3DnecfBLPG5X3V4wm1hU47Yy+II31iGUjzWHtQyrGGNZms55b3RS7dko/71nFQjWe1LBzcPPG0OsZ4LlyFFmnyxK0cKTkbM1MM3sEfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZCqngJR4tMXFlkAJUvc8lgpUvcL35kc9cVQuS8igUA=;
 b=CWysLokDiDqaSwgW3Id/OJq/50G7VAi6S122NCx46krk1iZDgqQcxN0+R/44OPThOBiOuouDyu6nhSo2xKDUPzJxN1yZyRSS9s+ZN6ULrV3RgcrcDjwtb6laEf4YMUNE2lVN9vPEFn3goFlvsJmlXv5C6nqVEaBDcQt723Nft6KPEoAhhfztwP1FjgcLuSZ8MJqh8aiAhb9/NFA6DgKQcb4kTt/9tFQ7aeO0p4c6X6R3AV9nYXoalnOaoFe/cFY56f5APO4bnsdKJD59lxJyjQyyf+O0V0c1J7AGimkhas+afrRmL4mUcZOctBn4Ho0vn3JECSR8fx+ymEoi9CAHMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZCqngJR4tMXFlkAJUvc8lgpUvcL35kc9cVQuS8igUA=;
 b=iWueiCdOfO+3+WHEojSx8uXsqoPgXVOm20rDFmH3T4Ez/tRGFUpFSn6onxpbS7Gy6zSivr/KbatvENfUK7EGXAfC7CM1SM9NDqtIgOAd1jyoaNPfuIMWpbcV7DXX7SEqp9bS24VRWnOcxVzi+SUg/2e+oDGYKHCQ0f4Bzbda8Ls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10849.eurprd04.prod.outlook.com (2603:10a6:150:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 16:44:00 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 16:44:00 +0000
Message-ID: <ba64fc90-e388-4753-bc4d-baa4a1417a55@cherry.de>
Date: Mon, 13 Jan 2025 17:43:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH RFC v2 2/2] tools: add script for building
 documentation inside containers
To: Antonin Godard <antonin.godard@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20241217-instructions-shell-container-v2-0-ce687b0cfac2@cherry.de>
 <20241217-instructions-shell-container-v2-2-ce687b0cfac2@cherry.de>
 <D6LKI7KCD6K5.3S86QV4WB1OYF@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D6LKI7KCD6K5.3S86QV4WB1OYF@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0276.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10849:EE_
X-MS-Office365-Filtering-Correlation-Id: 05c8f8e5-2114-4a03-93d8-08dd33f17b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HnOnJzZWs4xukga9/gVpmxVGbHJjzZa2exNg7RpT0Jt4xru3+r1kuv08OhZ3?=
 =?us-ascii?Q?aw1Orfxq6QitGdLvBnJOyG9bvLq5xcy6b47midcEAf0YpBr4thkkHPWmv+XH?=
 =?us-ascii?Q?zJwTFF23TDTi3s30ykoPcPkUnaSsTPJinyDUflSsmG4ruGW6GhPjSUdORor6?=
 =?us-ascii?Q?u5rZGfcbAsHV/tnIo0zLpQioodvZR+92Nanu4W+OCIWNUcxVoYqbcbHOTUI4?=
 =?us-ascii?Q?zUbzqbETaImZf3j8dDRS00I+QpEnjo9jr39WiAean1+1Ao8Ef4DgufmsiRDS?=
 =?us-ascii?Q?hQyF9wHB7hzoBJYOl2A7v2+kG4UxCuIo2Ogm/USQjn8qdrei1sDYTOOqcwjb?=
 =?us-ascii?Q?8kR4FzC+B4FJqTYnPpPSElKijKSBtRqTAjaNJv5Wxr1UbVNtBkJct316m/7q?=
 =?us-ascii?Q?iAU65uvi9DwGxuNfGGFodKIjvXBBl0TSquXVxj8sSsb2ywVqdaqm+OWURa/c?=
 =?us-ascii?Q?mmGVDAeBL65J2M6+CqeArvOvmLDDP7vWE5vFG4OrSdpfSTnVnDX7bvC1pj+6?=
 =?us-ascii?Q?3gpx4Kr7xZRCcckRo3mmoV2voNT2U+9LPtvliNE2+fZDiMw8tNCazwznSqvh?=
 =?us-ascii?Q?QDCJwkhbEs9kmEbiMeUkG/BrumgGCGhuk9QryRZrGbAJ2pPsYzMNKD6aFZDm?=
 =?us-ascii?Q?ZgMvX3avwSgQCSJKPOSH2Se57cNRZjYm3fOmzh1fb/9j37IeDNledVCNcyv5?=
 =?us-ascii?Q?vEuUV5/K2f30tOe69smw1khiYIirRBClvuTBTXYDVuToZa4tukoJ0DxVKOvk?=
 =?us-ascii?Q?KYap471ecFoh95xaLFj5PTa0kNo1OWVaDCR0NcIy3e5ztXg01fuMAW2aCByo?=
 =?us-ascii?Q?LdcanNr8nNsRO/UmvH+XvC5JQ9uuVqqnE1+EHyhgQVOmG1uXGdFcFznlHghJ?=
 =?us-ascii?Q?Oly9lDPwGY3k5gIneuaQ9sLCxJBC/nDNEI5mMC4r3T85p04jgjRTsuTa9I3L?=
 =?us-ascii?Q?jNni7eXSmBqa+IukpI05KwP9m29WLWqNNPevLWmyapaAckXoJFV9GOI80k46?=
 =?us-ascii?Q?YdYT1/gpEZrFmUpaL0UNfGzZ3OXrzBUHLw1a43IIXMvUI0dBOWv3IzcPtTt3?=
 =?us-ascii?Q?FjSmh/9UCIWxck5SRSQu0Mj2ZFfDVEkNnEhr1X+MVb1zivDDOnSaEJYK4aER?=
 =?us-ascii?Q?RTU4DhbsC1ei3sWVEQZX62nQAS3gWJgGx0H5+yyPYA+eOQyfXm1lkyiYqtR3?=
 =?us-ascii?Q?34tOgwPE0dIpgZAIkRIDDzcnWytD7aLGznblIZ+Xh2dYPEVrSNbjhmIB3dfv?=
 =?us-ascii?Q?yyKcSAhMCmd/LfDRj6Sxd9hoh/HvuJDu25Iu5sFYL02Kwu+0/oahGv85RKE5?=
 =?us-ascii?Q?DgneoOGJOAkNuEt/70yCURn28INwM8RNytV4kiZdUZr5TA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AXNUsdWXGS515cwB/TFhq1vVhMLo09qN/ZtRogiufYXaBIb/kbpgs8LyhvoL?=
 =?us-ascii?Q?1iwP2jmJC3huMc5m1ElxNOMbKXgoLglSFd155Ms5wB+JDrA68/sxjT8ezWcW?=
 =?us-ascii?Q?cBax+ZO6vwo5Hm7Vn43iQ73HJRyQJ7bLNo+Alj33tfUzD7BLleSvSiXnOxqP?=
 =?us-ascii?Q?7mDdixEUU/5vsTHPnPezEFEXXMlVEunl/2nKtZYGafcJnzISJWMFStVveAFd?=
 =?us-ascii?Q?Yglr2bhN0Xosjkl6UgOR4TctHwgX+RKsvxF5jI9rdb4qoMo4J3FMU686jZH9?=
 =?us-ascii?Q?STt/eNZPzxuFzyFMupdiv3negcgYdamBfRt5cQfoDjbweQ4Fl2Tv+9WQz1+X?=
 =?us-ascii?Q?Z3arrVhMlG9rOJdOxkf1uF6WNFXnOuaongjdIWS3v0MiV7gAmcNFjRzjRnYf?=
 =?us-ascii?Q?ZrLMcp5T/YbaEDKlZ+qpTqgPanCXmi+k2cXQqJdt3yclO67a0DsMCqqFwzi9?=
 =?us-ascii?Q?yTmC/lZsFg+l4472s0mZrZQWToNWlW7lBnCV5WFJ5BZfF/1PFS4Oh0W6T+nX?=
 =?us-ascii?Q?sS13of4q6W/HljHqLdlMbgMgw+sTg8LbPG+yfvLwiFNjliw0PCmkyh31bXAR?=
 =?us-ascii?Q?ImkOKFCiTHqB/9nQD7uaIpwvjZGpDUcehFhgIS5L+N+D0cnuVXmZeGXqdxFK?=
 =?us-ascii?Q?5LckDrumVij/EyGiJlnirHnGp6IE5nWN1ED+x5Ho70o/beoBvbK2jtbx7Bxv?=
 =?us-ascii?Q?5a9HBkWuafMJV2ZEknaby7vkjI6Qv1qsveFX8En6gYfGnCNa2kvNZclZePsw?=
 =?us-ascii?Q?an4aup+E29xnpyP6kiDAr+Gih+Zh461qQPQep1MyBSidyIC2VIUGWLdb+aO/?=
 =?us-ascii?Q?8r9QL6+0Na+ALPR8XlCmEBs8eqOj3mDXb0oZ5/H2f5FjtNAEZ6xydPSfHl8R?=
 =?us-ascii?Q?XQb++zCNXY1d/o9gJADkqjnDj7oF5Vh6i+pRl6g0mtBSfZQb3C6KKSvq1fTX?=
 =?us-ascii?Q?nlYU5z4vsb0fbxYRlHq2aHYde8oOU022t0errlw1a5l6GlfrgD/jRJAxcyeZ?=
 =?us-ascii?Q?G1BpZ0HVSLRTHffzwloxw3+DhTAbI06l35mUyljbK24SWHM57aGBgPNmYnQi?=
 =?us-ascii?Q?wBJV+utrgy1Okr70xDHaDRWePCCIzSPET7WnYzNNFU3s9AOjOtdZxOlGhvQS?=
 =?us-ascii?Q?GamneUluVPYayFbmi6IVAn+0fYzlNVqhqVn3Wi6fH1YKLrlLlPq6zfNKapNU?=
 =?us-ascii?Q?DINKLA01r/ZyB9BmIgc1xJiJnOztPkCbAGSRnEF5aCD/eNm09eZWAbdzBe2K?=
 =?us-ascii?Q?2pKR551SgyPNvGxU8Trp5QlYX52egm2EhfQAU7fQKWZ9jTcaYIYmCGz5uU2T?=
 =?us-ascii?Q?Cz3SA0OL9EA09WXDPrbLZqHSypE8YVV54/tbyX+4cP2VQByeEU9loDH9s324?=
 =?us-ascii?Q?HBysQ8NDg7qKS6Fv4cAjvkbPs1jXwTaVLWQBL6c5nXfK4WwrIZB/RJkDVZVB?=
 =?us-ascii?Q?k+RRgDsbnbu3OHkxg1cbKMgCl5Jjj/F6BaW+UCl+tS+EGJkG7Tosdb/1m+na?=
 =?us-ascii?Q?IlMQaosDLW+ODgs01vF2p1LRQrOx+vBHvAanBtztPbLuNNAHfYST65Tf8luh?=
 =?us-ascii?Q?q2gD8+GuaR7/VzLAqi/pTd5pxt21wB+tJzaUwKewVOSnEk1P8/2oBEsE1Nvj?=
 =?us-ascii?Q?bA=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c8f8e5-2114-4a03-93d8-08dd33f17b09
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:44:00.3298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKHsbXNuBg/I6l6fOXAXSdutjice2yEjL5bpG27oDvFwQo5iD+XC6H9h67J/svoD3HLztc0EdyxHj2PAT8ZbRtfrlTb35Bobc4OP2ZWa+QU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10849
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 16:44:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6087

Hi Antonin,

On 12/26/24 11:41 AM, Antonin Godard wrote:
> Hi Quentin,
>=20
> On Tue Dec 17, 2024 at 5:08 PM CET, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> This adds a script for building a container and building the
>> documentation within that new container image.
>>
>> The openSUSE instructions now require a --non-interactive flag otherwise
>> they fail to run. Sadly there doesn't seem to be a way to have this in
>> an environment variable =C3=A0-la DEBIAN_FRONTEND=3Dnoninteractive.
>=20
> Hmm, this means that we end up instructing to pass "--non-interactive" in=
 the
> docs? That's not ideal :/ I suggested a workaround below.
>=20
> I hope there won't be too many cases where we have to do things different=
ly in
> the context of a containerfile in the future. Apart from this case I cann=
ot
> think of anything else that could happen. Anything comes to mind for you?
>=20

There are always interesting corner cases in unattended CI :)

>> Somehow tzdata package in Ubuntu doesn't respect
>> DEBIAN_FRONTEND=3Dnoninteractive hence why the timezone needs to be set =
by
>> hand.
>>
>> Note that only instructions for Debian Bookworm (12), Ubuntu 22.04 and
>> 24.04, and Fedora 38, 39 and 40, currently work.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   documentation/tools/Containerfile.almalinux        |   1 +
>>   documentation/tools/Containerfile.apt              |  26 +++++
>>   documentation/tools/Containerfile.debian           |   1 +
>>   documentation/tools/Containerfile.dnf              |  25 +++++
>>   documentation/tools/Containerfile.fedora           |   1 +
>>   documentation/tools/Containerfile.ubuntu           |   1 +
>>   documentation/tools/Containerfile.zypper           |  24 +++++
>>   documentation/tools/build-docs-container           | 113 +++++++++++++=
++++++++
>>   .../tools/host_packages_scripts/opensuse_docs.sh   |   2 +-
>>   .../host_packages_scripts/opensuse_docs_pdf.sh     |   2 +-
>>   .../host_packages_scripts/opensuse_essential.sh    |   2 +-
>>   11 files changed, 195 insertions(+), 3 deletions(-)
>>
>> diff --git a/documentation/tools/Containerfile.almalinux b/documentation=
/tools/Containerfile.almalinux
>> new file mode 120000
>> index 0000000000000000000000000000000000000000..7237e9b99f4132957c0ad5b1=
1fa6cefe9daaec74
>> --- /dev/null
>> +++ b/documentation/tools/Containerfile.almalinux
>> @@ -0,0 +1 @@
>> +Containerfile.dnf
>> \ No newline at end of file
>> diff --git a/documentation/tools/Containerfile.apt b/documentation/tools=
/Containerfile.apt
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5e30b65eb8f81a7764c00eb1=
078dabaf59b64517
>> --- /dev/null
>> +++ b/documentation/tools/Containerfile.apt
>> @@ -0,0 +1,26 @@
>> +ARG ARG_FROM=3Ddebian:12 # default value to avoid warning
>> +FROM $ARG_FROM
>> +
>> +ARG DOCS=3Dubuntu_docs.sh
>> +ARG DOCS_PDF=3Dubuntu_docs_pdf.sh
>> +
>> +ENV DEBIAN_FRONTEND=3Dnoninteractive
>> +ARG TZ=3DEurope/Vienna
>> +
>> +# relative to the location of the dockerfile
>> +COPY --chmod=3D777 ${DOCS} /temp/host_packages_docs.sh
>> +COPY --chmod=3D777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
>> +
>> +RUN ln -fs "/usr/share/zoneinfo/$TZ" /etc/localtime \
>> + && apt-get update \
>> + && apt-get install -y sudo \
>> + && yes | /temp/host_packages_docs.sh \
>> + && yes | /temp/host_packages_docs_pdf.sh \
>> + && apt-get --yes autoremove \
>> + && apt-get clean \
>> + && rm -rf /temp
>> +
>> +RUN git config --global --add safe.directory /docs
>> +
>> +ENTRYPOINT ["/usr/bin/env", "make", "-C", "documentation/"]
>> +CMD ["publish"]
>> diff --git a/documentation/tools/Containerfile.debian b/documentation/to=
ols/Containerfile.debian
>> new file mode 120000
>> index 0000000000000000000000000000000000000000..5a7a425197afc2928802fcad=
5f34699b1ad3348a
>> --- /dev/null
>> +++ b/documentation/tools/Containerfile.debian
>> @@ -0,0 +1 @@
>> +Containerfile.apt
>> \ No newline at end of file
>> diff --git a/documentation/tools/Containerfile.dnf b/documentation/tools=
/Containerfile.dnf
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3dae74445585961a6f2d29b8=
acde09f2456dd886
>> --- /dev/null
>> +++ b/documentation/tools/Containerfile.dnf
>> @@ -0,0 +1,25 @@
>> +ARG ARG_FROM=3Dfedora:40 # default value to avoid warning
>> +FROM $ARG_FROM
>> +
>> +ARG DOCS=3Dfedora_docs.sh
>> +ARG DOCS_PDF=3Dfedora_docs_pdf.sh
>> +ARG PIP3=3Dpip3_docs.sh
>> +
>> +# relative to the location of the dockerfile
>> +COPY --chmod=3D777 ${DOCS} /temp/host_packages_docs.sh
>> +COPY --chmod=3D777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
>> +COPY --chmod=3D777 ${PIP3} /temp/pip3_docs.sh
>> +
>> +RUN dnf update -y \
>> + && dnf install -y sudo \
>> + && yes | /temp/host_packages_docs.sh \
>> + && yes | /temp/host_packages_docs_pdf.sh \
>> + && yes | /temp/pip3_docs.sh \
>> + && dnf autoremove -y \
>> + && dnf clean all -y \
>> + && rm -rf /temp
>> +
>> +RUN git config --global --add safe.directory /docs
>> +
>> +ENTRYPOINT ["/usr/bin/env", "make", "-C", "documentation/"]
>> +CMD ["publish"]
>> diff --git a/documentation/tools/Containerfile.fedora b/documentation/to=
ols/Containerfile.fedora
>> new file mode 120000
>> index 0000000000000000000000000000000000000000..7237e9b99f4132957c0ad5b1=
1fa6cefe9daaec74
>> --- /dev/null
>> +++ b/documentation/tools/Containerfile.fedora
>> @@ -0,0 +1 @@
>> +Containerfile.dnf
>> \ No newline at end of file
>> diff --git a/documentation/tools/Containerfile.ubuntu b/documentation/to=
ols/Containerfile.ubuntu
>> new file mode 120000
>> index 0000000000000000000000000000000000000000..5a7a425197afc2928802fcad=
5f34699b1ad3348a
>> --- /dev/null
>> +++ b/documentation/tools/Containerfile.ubuntu
>> @@ -0,0 +1 @@
>> +Containerfile.apt
>> \ No newline at end of file
>> diff --git a/documentation/tools/Containerfile.zypper b/documentation/to=
ols/Containerfile.zypper
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..bcda5261ae98e8df16a3bcef=
17a7bf204033da99
>> --- /dev/null
>> +++ b/documentation/tools/Containerfile.zypper
>> @@ -0,0 +1,24 @@
>> +ARG ARG_FROM=3Dopensuse/leap:15.4 # default value to avoid warning
>> +FROM $ARG_FROM
>> +
>> +ARG DOCS=3Dopensuse_docs.sh
>> +ARG DOCS_PDF=3Dopensuse_docs_pdf.sh
>> +ARG PIP3=3Dpip3_docs.sh
>> +
>> +# relative to the location of the dockerfile
>> +COPY --chmod=3D777 ${DOCS} /temp/host_packages_docs.sh
>> +COPY --chmod=3D777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
>> +COPY --chmod=3D777 ${PIP3} /temp/pip3_docs.sh
>=20
> A bit of a hacky workaround, but maybe here run
> sed -i 's/zypper/zypper --non-interactive/ ...' on the scripts? So we don=
't need
> to provide this option in the doc.
>=20

Another dirty hack is to have a shell zypper wrapper that calls=20
/usr/bin/zypper --non-interactive.

Up to you.

>> +
>> +RUN zypper update -y \
>> + && zypper install -y sudo \
>> + && yes | /temp/host_packages_docs.sh \
>> + && yes | /temp/host_packages_docs_pdf.sh \
>> + && yes | /temp/pip3_docs.sh \
>> + && zypper clean --all \
>> + && rm -rf /temp
>> +
>> +RUN git config --global --add safe.directory /docs
>> +
>> +ENTRYPOINT ["/usr/bin/env", "make", "-C", "documentation/"]
>> +CMD ["publish"]
>> diff --git a/documentation/tools/build-docs-container b/documentation/to=
ols/build-docs-container
>> new file mode 100755
>> index 0000000000000000000000000000000000000000..f382af75a7e89cfcc8a6080f=
dbc65fb68ff9ea8d
>> --- /dev/null
>> +++ b/documentation/tools/build-docs-container
>> @@ -0,0 +1,113 @@
>> +#!/usr/bin/env bash
>> +#
>> +# Build a container ready to build the documentation be reading the dep=
endencies
>> +# listed in shell scripts in documentation/tools/host_packages_scripts,=
 and
>> +# start a documentation build in this container.
>> +#
>> +# Usage:
>> +#
>> +#   ./documentation/tools/build-docs-container <image> [<make target>]
>> +#
>> +# e.g.:
>> +#
>> +#   ./documentation/tools/build-docs-container ubuntu:24.04 html
>> +#
>> +# Will build the docs in an Ubuntu 24.04 container in html.
>> +#
>> +# The container engine can be selected by exporting CONTAINERCMD in the
>> +# environment. The default is docker, but podman can also be used.
>> +
>> +set -eu -o pipefail
>> +
>> +SCRIPT_DIR=3D$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null &&=
 pwd)
>> +CONTAINERCMD=3D${CONTAINERCMD:-docker}
>> +DOCS_DIR=3D"$SCRIPT_DIR/../.."
>> +SH_DIR=3D"$SCRIPT_DIR/host_packages_scripts"
>> +
>> +main ()
>> +{
>=20
> I would be good to have a check here to avoid
>=20
>    $ ./tools/build-docs-container
>    ./tools/build-docs-container: line 29: $1: unbound variable
>=20
> You could probably copypaste what I did in my version of the script.
>=20

Will do.

>> +  local image=3D"$1"
>> +  shift
>> +
>> +  OCI=3D$(which "$CONTAINERCMD")
>> +
>> +  # docker build doesn't accept 2 colons, so "sanitize" the name
>> +  local sanitized_dockername
>> +  sanitized_dockername=3D$(echo "$image" | tr ':.' '-')
>> +
>> +  local version
>> +  version=3D$(echo "$image" | awk -F: '{print $NF}')
>> +
>> +  case $image in
>> +    almalinux*)
>> +      containerfile=3DContainerfile.almalinux
>> +      docs=3Dalmalinux_docs.sh
>> +      docs_pdf=3Dalmalinux_docs_pdf.sh
>> +      pip3=3Dpip3_docs.sh
>> +      ;;
>> +    debian*)
>> +      containerfile=3DContainerfile.debian
>> +      docs=3Dubuntu_docs.sh
>> +      docs_pdf=3Dubuntu_docs_pdf.sh
>> +      ;;
>> +    fedora*)
>> +      containerfile=3DContainerfile.fedora
>> +      docs=3Dfedora_docs.sh
>> +      docs_pdf=3Dfedora_docs_pdf.sh
>> +      pip3=3Dpip3_docs.sh
>> +      ;;
>> +    opensuse* | leap*)
>> +      image=3Dopensuse/leap:$version
>> +      containerfile=3DContainerfile.zypper
>> +      docs=3Dopensuse_docs.sh
>> +      docs_pdf=3Dopensuse_docs_pdf.sh
>> +      pip3=3Dpip3_docs.sh
>> +      ;;
>> +    ubuntu*)
>> +      containerfile=3DContainerfile.ubuntu
>> +      docs=3Dubuntu_docs.sh
>> +      docs_pdf=3Dubuntu_docs_pdf.sh
>> +      ;;
>> +    *)
>> +      echo "$image not supported"
>=20
> Can we have a way of listing images here so a user doesn't need to read t=
he
> script and guess which one to use?
>=20

The ones in=20
https://docs.yoctoproject.org/ref-manual/system-requirements.html#supported=
-linux-distributions?=20
Though I guess Rocky and CentOS are still missing. Do we want the name=20
of the distro or the name + the version? Basically we can end up with=20
two places where this information will be, in the docs and in the container=
.

Cheers,
Quentin

