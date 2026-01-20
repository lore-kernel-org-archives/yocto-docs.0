Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4DFCA5FAE
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 16:42:27 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10818.1768927345847219688
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 08:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=jOOVUpjs;
 spf=pass (domain: cherry.de, ip: 40.107.130.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtRRpb0VXehif4BcRPXlGNoD7o+b2yeL87ubIbECYBBhGrJS3m6fKbh03kvZA4Ms3tUcPkV6JAnik1TPkO752Dx5o/n+rL5LEKS93Z8CXYj5K1ayA4lOVVS+VbXQhvW1loi+8jgbFSIXmUw451lHEuMbvdHEavQ5GfeKztbwlRdXxgXy3Oh1h+L6EVdrJuA7iIHAdbHkJe/tEVKlT81a8ITxYXpidfdr7/Vzk7ZE3n7NAn3w6BJnizu+XqvDhbT4V6r/Kg9WucRK3fxwA+gcD2/tM2ZznyQrXqG39OZCTszAE5Npy6xulS9rmaNranzv+kqHOfOqlgj88PKTn5MX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+u5IMhpcYMIIOXgW9/zukouImNu2O3fs3i7xgGWzF/o=;
 b=PWRfTmTTo0lfatzX3zYbLWzX9uCRuZauZYp0qDud0Nf+4z4i64uliqqjl47kt1a96wAud3ok5YcebyYFknoha9vKY6EdgC7Dxb0ymSiEMMwccplp8V78gFTFx4Ls9j4Ae+wsw80jUsF/dYSibS/+ULbQGAxcvdi60KUGjRbTq6y050bKjnc2KkvcxQujTEfR+Y4x6f1ODTG6UMAy1r4lFMo4JD/L+77bdbHMv5Lk+IM9rCAjC/JXVmARVsKsGpYraK2Tb4L2JXhCzaBOLlKE959oDeeAD5ZZq/Y6AFXXHQQoA/RS2fnrmCohIfCnXu6hBn/CaF/mpg4j2DRjNZTGIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+u5IMhpcYMIIOXgW9/zukouImNu2O3fs3i7xgGWzF/o=;
 b=jOOVUpjsRGSCY46rZwCpBzfrcA38fU1YtuV+lEFIY2XyEE8e79uwlWtO7fA0J9OIeHc5hh/XGcb0Ur+UB89k7cFAbik1TlStz5fJ5iVab1m1c4T7n+EgRZ3q/VCIOWuLNCIzVg7uHyyrcz01jHgVrQTA+P4o/hZ69WrTET4jWkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB10368.eurprd04.prod.outlook.com (2603:10a6:102:445::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 20 Jan
 2026 16:42:19 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:42:19 +0000
Message-ID: <bcbc66da-7d35-41a3-a3f7-6f27ce4785e5@cherry.de>
Date: Tue, 20 Jan 2026 17:42:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 3/5] ref-manual/terms.rst: simplify the Source
 Directory definition
To: "antonin.godard@bootlin.com" <antonin.godard@bootlin.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
 <20260120-terms-refresh-v2-3-fa49d15b209f@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260120-terms-refresh-v2-3-fa49d15b209f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB10368:EE_
X-MS-Office365-Filtering-Correlation-Id: 637e4f14-1c82-4fd4-a48b-08de5842e0da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tUMm85kwyj5H5MKNPrcyhmGElRDfjkWi5ou3pSxP8Ffw+/y1yBatNx3oSIt6?=
 =?us-ascii?Q?aXEbTqmtN3fJtD3hgW4gXpKsTFNfbcQw+XjAHtmXQ7KGVu4DR/qEK8w+xH4d?=
 =?us-ascii?Q?KiQe28F/ofs+kQEH2zeWID8OCe05cwuggSxwDYRUcUCgs2F5dfjfz/tHbWEQ?=
 =?us-ascii?Q?FpKPMWBHwBkr/jOkP/3NeKGWvIjWPW2eaL+UpC2RlehIPq2gy+bmw8Y+yp2r?=
 =?us-ascii?Q?k8mEzodN/cd6obuBnaCvsfLkwN5VdL/ndpw2I28h+lXDJ1bqIb0TV2sYodtn?=
 =?us-ascii?Q?iPcnLfSGWWmF0q83tfXbpYe4MXPTYLgbUdwWZq+aP6QJYhJM9VBHWoAHOKrn?=
 =?us-ascii?Q?EY9v4RczvlIC3lxyav/VrEMGpf0TGU/clZeb5zAeijZ2Oe88FtTvpc3Hsx3h?=
 =?us-ascii?Q?fxDNlsALKipIK57iPnLota/H1Ong3S9WjQ1hw3sFVV4Uq8uQEjSGzsjFTaDK?=
 =?us-ascii?Q?G14LoE4RguLBy+AYXE4JgRmiF3sz0kRt4IQDe9XZVuch7JIymzt0Bt+11JI/?=
 =?us-ascii?Q?5IZBOHFjFCY4N2L58HRgDeMmGG0KI42oq71xpy+b8plk2B4DHq6XPTCT1y8t?=
 =?us-ascii?Q?zO2lylcI9tWUxn6x5VHUZiLb3qvaFi6bQ15U/7fFxuFdRSi0WAxTagIzJzii?=
 =?us-ascii?Q?SwsFoEsbiZS+KrDHT6pX0hBIQdozFOIHtqOBfgKTJk1ydXVjW8XCDXw5q2WF?=
 =?us-ascii?Q?IZzSc+if2RBNuauj3EkPTFv9TM6sHm9Q+kzBJHSBH4S55ahyitLpemyBHRtW?=
 =?us-ascii?Q?BWP47moJmALxvyoDUN7sAnlHErFb+XuXHDehj7ORlBV2rana2a6qD7LS9TBF?=
 =?us-ascii?Q?oBI67sjptbN/BZK/Xtoiz3OOpPh8wcGzyIJu2gI7wYy3/Xgtt6Sbe75UwanK?=
 =?us-ascii?Q?tX5Q1SYgzunNhJM8uVoqGNpmDRqcWBgRzZHZHwLQZivDXRV3xDOOBvnNbDcp?=
 =?us-ascii?Q?V+NN6cbbc1BULm1ve2Ep6K4VFw8Ow7jD6NgHZnxYBnxEur0uu/saWDE8n1DM?=
 =?us-ascii?Q?jaJA4OAKVG9Ml/7ywU5MkDjzYSTCgLc4YS+PuLCR0QJTyepPqgo9p6KmcOn7?=
 =?us-ascii?Q?Ljq3TSQDRDD0owylEaUktdxGw9X+xSMKvkBTPL85RZPdRW3sa0xr0DfB+2oj?=
 =?us-ascii?Q?TFUtMz6+Z4Y4yQD7LBa6SmHrFXtzeaJerD+27mbjkToF9sYUU+zPFRZX/eV2?=
 =?us-ascii?Q?bC6BUxMydTQ58U6/0Fdjit03a+JNoku02RKjZvG9334jm9+b4i49O5XPPO+f?=
 =?us-ascii?Q?NjE1tfuMVWSInlFm+gRfjmytFKh30EOUMPIiy+4LQTf12xLHUwUil2yFRdw+?=
 =?us-ascii?Q?UF6RZzDxNvoqT4D8ed2Ywayby/wOkAfdDo3g5BUhFb5en+MMqSvdgp84S65x?=
 =?us-ascii?Q?MVKG0eFDJZob3FL/OkjWdtt/zi5EOw1ZbyJK6N36Hwgxfp0e7Tb2xsQI5TJA?=
 =?us-ascii?Q?w4UW2qyGYli7zuIk9fct3tIPNG/CyufNXVZLHDgiBbtHmWvNfoOeZvyaMkdE?=
 =?us-ascii?Q?zide5A7HViW5qXYxkXG28zm3Y1OanPsn8IQNKJa0LOYlH/BbTmB6SRx2bkru?=
 =?us-ascii?Q?bxuc4JBdX6lUdaGN5Ic=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wLMMDmVZtte910sKZiXYnLQiWdnu8bs9el3Oo5q9LF0zN/IApC82ZG3uekr0?=
 =?us-ascii?Q?xkdMBNz07Q9VB5YcsvrzRTLx4uy4olJPe5RdPPgwSxIGcrv1s77X9fUO8zml?=
 =?us-ascii?Q?zcr6yalvmUKuWg0sXftrqWSrDOpJHggeo9LxBD8XqfkEj+FmtDGi6dQXrRIH?=
 =?us-ascii?Q?N5yeiWdbLQEhUd6wP3A9wGE/Pvatf6VoWWdOfuwzuUWFacU3UkydrJE+N2fb?=
 =?us-ascii?Q?pvpcdAUOp0Wfw+U34zV0424QBOoPVV8lSFlCc3IMqqo7H+RPqByPt1OAW8Gv?=
 =?us-ascii?Q?SA28hLIL/k/i+pQ7yCnfSFsCoRLXfvSDTe+P4mlhM9Kao+tW5MH1XkqcuAGG?=
 =?us-ascii?Q?fwsEJ2IPB5vNG5PUelT2eWO6GItf9k7ZuOCVZpT1p3bfhT4iOW946/mMRXxB?=
 =?us-ascii?Q?yaqPOcdUGs2CwxU3lGokvqrB9xyzOUhjfDgOfnFOGMvIvyr1qsjTaSGjoJYr?=
 =?us-ascii?Q?YNS5rhau+874kyB5E+34EPwlIdTZkhO4ndtihXUvv+QslVjDrwSsM7CWDOjD?=
 =?us-ascii?Q?fNSsO6sHbokJZSnO8ZnpschhQvGaU1fuKWVuo4N6kuIJfPboN0I/qmlXKm6y?=
 =?us-ascii?Q?rf8uGmGPVfJMqArunyj1/B42B/62MIVxGYKidgKtTryfo0Bn2pUWgki4AHIi?=
 =?us-ascii?Q?orYuUv1NL+NStODLX0seypRkCh7rUDWmf9akstsR68WI2XZWtX96Rn1Zmced?=
 =?us-ascii?Q?z+ANgIyVyYBBLL9syPYI8IjhlZ9pDF7kxWLSBZYPnFFUwshObEDdRr/ZQip9?=
 =?us-ascii?Q?kgFOqG+yNA6L7LF3LMfsp03itBUnqUTCRXeKZlyunr3Zs6Gg6e/yrmBG6LVC?=
 =?us-ascii?Q?YbWrQA6/RIHSCJUBz5RFrs2bz8ebmml4cmAUkaGb0PCwl3EosDRRwGMus/Lz?=
 =?us-ascii?Q?5k7jEUFwZSCZjfAIg32Ve9MmkGccdG7r0budxP5tk4jeq0Z2Ee76U5/QsRL4?=
 =?us-ascii?Q?F1S7fwBJ0DkR6i9/2t0m6OFhJpzLDg0lWR1KOF39DhsVXRUZdcBTLxq4t9TK?=
 =?us-ascii?Q?Ov9IGNTkXj5rh0/z73xQm4vJVEeQcEi5zP5J3ThDtSMfeem8MXe0k4b0jXPx?=
 =?us-ascii?Q?CRQM8RAHGJZqPmxmV2pNeE/rEgODkixTCeXTD1rPOEPW9xX7qgFqWFS6EcDL?=
 =?us-ascii?Q?TyCP4hCj8z/4F6vFBtHuB+ixJTbiQtFns+yY1qZ+7wLi7xA9EUlMpIlPf2z+?=
 =?us-ascii?Q?py2ncnFiZFagPOA0iHfiIM2JwAFpJUYRc5J7u0y8G+reHiZ8pCu0/tlVhoCy?=
 =?us-ascii?Q?PEsSdu5pRabPlCWdnTGnu06HscPRA7yBjkcf0AryQ7fP9hLpmlhUD7w1Ckf0?=
 =?us-ascii?Q?F5CsN9KL+GlF+S1czF1KSWr6E3T/swYVMm/lH3HBx95tVHm5Xxjz5BXyNrh/?=
 =?us-ascii?Q?aClRXQ0AnGRwsP4VNfl7avZt8o/YYfVBX3DugFDwqD3Rvvcv0UoyVfPPkuYQ?=
 =?us-ascii?Q?cqzQ45kFjAy0mIXAiM9MAqZCFU6AoHczm6W2G0d0MMvIvWgt/6nwt3OHYX30?=
 =?us-ascii?Q?pSP0NgD8ff2+tALy3FlJGmSg33EVIiFiIrkxfA1x81fFKLvfHrf/YSP4/sAp?=
 =?us-ascii?Q?uJMxZ6DiFfxrpvN4IxxJvFU5QLab9RxlAEDVOF2EqEipAmfOOD1BV6PznJlh?=
 =?us-ascii?Q?UR/6OJK2WEHMtjt4GwK3/PuK1HD/LGrsS0tfy6wFdpqZR3m6Q+httoEs3/Gn?=
 =?us-ascii?Q?0FdaNPlK3n7syD/VxNcWqzt9xwzvPYmd6AOymVmKWzmDpgaGQZn2li+ImCEU?=
 =?us-ascii?Q?kTpy4iUZpS8t7haeNtUg1Lh2cdfjvGSrXw4ef1uBSio8y+x+SDUf?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 637e4f14-1c82-4fd4-a48b-08de5842e0da
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:42:19.7726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qpJIfWNBGn6zcQG6H0NOuYq2/gh2NR7CYeVW0CsYK54V/3aGdqIPV6ciQToN/4TWfNCWYrlGzoc1OEkp3pAsW28kdXOo798tCTkJimrLHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10368
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 16:42:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8604

Hi Antonin,

On 1/20/26 4:17 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Now that we no longer have Poky around, simplify the Source Directory
> definition:
>=20
> - Make references to existing documents that show how to create this
>    Source Directory.
>=20
> - This directory contains sources, the layout in which they are
>    presented does not matter so much, as it can be different and/or
>    freeform depending on whether we use bitbake-setup or not.
>=20
>    The definition chooses "project" as the name of the source directory
>    and is the one that should be used when showing examples in the
>    documentation.
>=20
>    A typical Source Directory would look like the following:
>=20
>    project/
>    =E2=94=9C=E2=94=80=E2=94=80 build/
>    =E2=94=94=E2=94=80=E2=94=80 layers/
>=20
> Other parts of the documentation referencing to this as the Poky
> repository still have to be updated.
>=20
> This will also mean that this definition will be used a lot less across
> the documentation: in most cases, when the "Source Directory" is
> referenced as the Poky repository, it can be replaced by
> OpenEmbedded-Core, Bitbake, the documentation, or meta-yocto. We'll keep

Not really? The Source Directory will be project/layers/ no?

[...]

> -     For more information on concepts related to Git repositories,
> -     branches, and tags, see the
> -     ":ref:`overview-manual/development-environment:repositories, tags, =
and branches`"
> -     section in the Yocto Project Overview and Concepts Manual.
> +     The Source Directory contains BitBake, OpenEmbedded-Core (OE-Core),
> +     Documentation, Metadata and other files that all support the Yocto =
Project.
> +     Consequently, you must have the Source Directory in place on your
> +     development system in order to do any development using the Yocto P=
roject.
>  =20

You didn't discuss my feedback on v1 here and it's unchanged, so pasting=20
the same here:

Isn't Metadata what we used to say about the content of OE-Core? This
way of listing implies to me OE-Core isn't metadata (it is).

Also, it doesn't necessarily need to contain the Documentation (e.g. via
a manual setup).

Finally, we should probably also

s/Source Directory/:term:`Source Directory`/

Cheers,
Quentin

