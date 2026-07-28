Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6153EC54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:08:01 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5649.1785218873644557645
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jul 2026 23:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=qkQfFiLk;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.69.75, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFJKo2lV0ZkJRRz5yBhS9a4EFBLCc201jGHgqrZ7s3xDe9V63fmWaq4tJo2IBj6gHsAu/FbKWUnB/hWt5oRzhu/TQbdIjgLLsdfq+fUodQ4UlaBggdMxrJxNXkCGAls09W6GTKxyvv/GWRTPsgB75GIgebPXpaiEkTCre37Aor2v+Y7/jYeKizx9NZ1Iu+1PvbyjFonMBgNf73x+SbhFAx9euscxJ2pBDJx7IjzZFOxQ8cMHvCIAKne1uDdKGXvTHmYVqwpltTR/llwoa42LUyiCTEAGlZI3HeEcew+K4n02YwaQwKAtwIrwAsCeYJNCp53U5ZeTrIPAx1Lvy3fWKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaYJid1O0a1CgnKmuXoXTPUp3kxtlORSGROvq3n+bkc=;
 b=SG4NrI+IAPHJwXy9yWhrbPexXStE9uAv76SZaAXM0mHSHdsFveoaoy5j9MAqDsdvZx32JtsSbPPCuexRl0+Zrr2bn6QaWK428v92LN6hBx28s/MHs3bhNtAIsAz70itFhcYkMCama+S4QJxlTbhFM8n1xJZ4I2xL71FWQKMvH+MHEIg7G/FHuZm/EOKbYyXcQuS88ico8RxP6ZAUQJALL0ov9AkXNsybCtzp5yaOtPYfS6CjXR4depSahZb60U4xSAfLdodq1Qxm7Br6/jZ8D2BlIjq8haivsxCzGKRi1/Qoojb8Uu4z2U4tzddZVomd6IFHMv45ZIlYy8A1m62H3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaYJid1O0a1CgnKmuXoXTPUp3kxtlORSGROvq3n+bkc=;
 b=qkQfFiLkW+F8EC1kQw8y+yLPQgerRg8ZYauynLqfgvJcSEBoYRjFVoyKxfX1MRcALz8VDiPzR6+//XuyO8+Xa6X8/T+KooTspL0UCJiZ3QhSKckHjpbh/GU0PnKU2QksZtNrPFjTQ9cEip1LBgnoUkJiFdYWQXgvL9zfIbMok1ZFZpNWB/HMQoO7PuUxJYxTr0CIdhVq/P6N8gm3GhnkeOvbRwrMQYJ4ov+27E45/6SyPyzs5HWy1SElZ7VIQek45rbig/UF3jrikWESOgv7Q94aY2fNK/riuxURGAvC5aQTG5ytM0E/S/8dg33zFPuQZ6+PxsY6A5suCIGlAU5XDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by PA2PR06MB9587.eurprd06.prod.outlook.com (2603:10a6:102:41a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:07:49 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 06:07:48 +0000
Message-ID: <fc9678a0-fd8d-4724-b33f-503fb057e6c8@vaisala.com>
Date: Tue, 28 Jul 2026 09:07:45 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 4/4] recipe-style-guide: Prune unicode from code
 example
To: Quentin Schulz <quentin.schulz@cherry.de>, niko.mauno@iki.fi,
 docs@lists.yoctoproject.org
References: <20260727163529.30595-1-niko.mauno@iki.fi>
 <20260727163529.30595-4-niko.mauno@iki.fi>
 <9a62ad9d-24db-4f87-8c7d-82e1e5d6f6ea@cherry.de>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <9a62ad9d-24db-4f87-8c7d-82e1e5d6f6ea@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF000239A7.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::228) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|PA2PR06MB9587:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b19717-7b16-40f0-c359-08deec6e8cb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	6z9XA0+/kduOVKjs1mV4TnXaPLcnayOsvi1Ut6Zq27Mrdep6BFsxvD0aFcvD2Eqnzoqf8rJfm51T5hL7xdrqZHMpHW8gz3Q6rvoe9qajXSORO9I2dCvhlMkOnexmBlCap5Von3r68gHKLqCDsPUc8V0VI92w0tfeTw7D5GdOUmn2w89ExFIzHPKgoizLuuDOXz+GdYsHA9Jb+lsyw5/6F9pDCODtXsULqmM/+xjtr7bO8AOwBBlvRW+zG28Xc8HlCMcLfUTMvykx2X0XbVnT/rj8nMugRg7hvPA/EhOH41qpYMcIDDAiJfgg/AqOtncWxYKFJXXf9ax+tQShvI46r5hL5SiAkK9YRkNEPMJZ/vE3D9vwSXtIhmM38g1+fG5Jl4lq9I7d/MbEg14RM/zVCPoKSTQyXg39jh8iS5I3jtwBK06jwuzaUWv3cQMlk6GM/dt8Ou1DyUjpQaT9E4cLx85NNPfMSsgv593gqPpxjtI3bkCFM836jlRR/5pCQfF+LdaUNCPNbjtTIUpqEtD9xHnUkQeVLxIAOkA2c+jWPzlsjJZ/K701HCFWeJhTfwUF1/r+3DBiFqma2H0bIseRH0zHoFfmBgZG5IyEwrbH2MlOxe+FNPo9kLkeEMuufqawHnh4gS8lrLjuvYmW+zZ5xb8gI403VNDqb+g7FHG6LeA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9GhD5ZwGlmaGkEOUVZMjksqu5ltu0nLQbEWPXcyMDXBGnsI4orSEnDxvgU7U?=
 =?us-ascii?Q?jA0l7SZ3fpdezl6axBSNYGV1n13vzWLnfBiMsMEpk6/2LBIWH7gH1pcUCuqc?=
 =?us-ascii?Q?/0rZ/v/cE/geGAyY6+Motf2JdIvVhCMOpCO1eEat4J3KQOIf9hRK9FtVwbNx?=
 =?us-ascii?Q?wL131OuEzfKZHvk29OnSoYP6URGZQEXurXatrMhjRY3GsjrRPp7O3EP9PVMy?=
 =?us-ascii?Q?rTiyNQY6D/UXP5S5gyMLs9y8SkhoBdrA0NpcCqJI3GmzgkQmx/afYAgWqJLA?=
 =?us-ascii?Q?wFfzuJo8qD99DKAdlk6Kp83fYxTcv6ueRwX/ld2GxY/gguAXEStGwAdEdLbs?=
 =?us-ascii?Q?Wdh/Vvp4Jy5GshDBv98a8RYcTDyV8tBuk3kNE58s3dBI2gQTpZ0PFq/FD78A?=
 =?us-ascii?Q?rHIFbL5kafjDN8hPDa2UnvDzGAlY0eYp2bdjzzXyAzx2Nu4wnmLWDVx/OE9K?=
 =?us-ascii?Q?M+oxW1Ek7rYraQWi7OGtXZmDp2UQD9Rr2fbLOyxfjnzez/EETxbOqw5m1Hyv?=
 =?us-ascii?Q?v+mQ5dKnfvLvD/e1Dn5uMHhIbAxkyAMYZpSImCnTyJNBsPkeTYll1C0Fj+dd?=
 =?us-ascii?Q?4oJtto33etkcHRszHjb24IdZVOyri9wHaL1fon6ZpvWLr+v8n4aQm054iPun?=
 =?us-ascii?Q?w5c/gu2Me6Y2DfNdPLHB+mLzXxqmunzuU1sKz86d4HF72SzWeGWxSfo+QJJ0?=
 =?us-ascii?Q?cpw9kLNjUXz0S6Vwg6INL2yeBgQLXZgKr04UBcHW82wUMWjPazuVVy0Je4Y/?=
 =?us-ascii?Q?ivPHvmWr2L63LiCHrR28zYZlMBp2QHTDNIqji6vn+g3whgu1JbRqcEyanrbT?=
 =?us-ascii?Q?rMTyYNLjTkRpKoedHxZyCgxBY2Ok3EFBPT2enjUEGAxGOzgmzxkSI6qiZ3vg?=
 =?us-ascii?Q?tFYsEsQHQNemcKCOWubdwAZB5ShAQ7WOT4+x6hEeJefB+1vUasxT2pC/cp89?=
 =?us-ascii?Q?yXGn5honw0tBMaluHi9Vwl+GBovzCTm7lYkGUtnvjBEDKIl4/tJ/2Y9zk+8i?=
 =?us-ascii?Q?KOhvUsbZyEAeHnE9ArEUezVoIQc/vwfUjQdtRYPUxbM09q+X+kMiM0AUjXrm?=
 =?us-ascii?Q?kFdGNS/3wS25hUSLYNEvD79ITvkOKUHQSm7vlzdyNmMG76hME72AOWKikVlL?=
 =?us-ascii?Q?IJpz2seRcm6a8i8BoDLsMRk60nox8Xq/Xy6kdOr8nfdbF7bwbh1m8ePbq5+V?=
 =?us-ascii?Q?LNUe1FZ8NOB6bS/ieY30VsjrYhrUwTYw0EFRNVNKkXQp2Jw3UieOBi98qI66?=
 =?us-ascii?Q?bNmNB62fC5LGjrt8rTt1rzGuC2eBSwXwkW0jbTzfFW4k3E0hMpITI1tTudv0?=
 =?us-ascii?Q?fLli+0Nbaumav9DBtv62+C9uRy3YLAwhP8Dx4q+K4s1WLLmYUutiXnyRqqUS?=
 =?us-ascii?Q?tDj0fHc/C0COfATN6BJcBp2oe6DX5O35PNcr/NIS7bJW9sXgKo+nntNOecjU?=
 =?us-ascii?Q?r9MrCXidpqBVYzoaETvrFn95g8ebobXrPq02OCj0q2ZmZBAyhZ2zOlnB58kO?=
 =?us-ascii?Q?2jmnl3b22q6H9I0WXqyn1bd4LfVDxINs2PUdGX/5nl3/ETTJxtcslQSf5I1X?=
 =?us-ascii?Q?I+uXASaMqpHMvHrsmXicGbIXBG3EiR+Hb9ywfE+ZswmHpCGaw53Zco7pOfjl?=
 =?us-ascii?Q?nKfh9wR8FSRsSG4xUcuFkQopBi6FZ9fMQTrQwsKm4tvfSq24XUe0+k9vOAIQ?=
 =?us-ascii?Q?0FvlqujNGVxPoW3eH+0K/6WEWYQil301CIxy6LtHJZ7MU46lF63Kz9Srfj8k?=
 =?us-ascii?Q?WKQHfgiZ6Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b19717-7b16-40f0-c359-08deec6e8cb1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:07:48.7648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4uOPzJCfsy44woqZQvZ+bfCEbQgCDhivsgQ0yxzsZ5rQXY53V9XEfOh/MRHcsR/DQXYUN9QkFv2bgeueoIHGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9587
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 06:08:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10152

Hi Quentin,

On 7/27/26 8:18 PM, Quentin Schulz wrote:
> Hi Niko,
>=20
> On 7/27/26 6:35 PM, Niko Mauno via lists.yoctoproject.org wrote:
>> [You don't often get email from=20
>> niko.mauno=3Diki.fi@lists.yoctoproject.org. Learn why this is important=
=20
>> at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> From: Niko Mauno <niko.mauno@vaisala.com>
>>
>> Copy-pasting example segment containing unicode characters causes
>> breakage like:
>>
>> =C2=A0=C2=A0 ERROR: ParseError at .../foobar.bb:158: unparsed line: 'RDE=
PENDS:=20
>> ${PN} =3D =E2=80=9Cfoo=E2=80=9D'
>>
>> therefore replace the unicode characters in the example with regular
>> ASCII characters.
>>
>=20
> There's one additional location where we use those special characters,=20
> in documentation/contributor-guide/identify-component.rst, would you=20
> mind sending a patch for this as well please?

Certainly, I have now submitted a new patch for fixing that particular=20
issue also

>=20
> I think it'd be nice to add a check in pre-commit such that those=20
> characters never (well, if one runs pre-commit :) ) make it to the docs=20
> again. Is this something you'd be interested in looking into maybe?
>=20

This sounds interesting, let me see if I could whip up such new=20
pre-commit feature with LLM.

-Niko

> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> Thanks!
> Quentin


