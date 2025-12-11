Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E28D41C32
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 12:43:52 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8377.1765457030280644490
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 04:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DLScydVi;
 spf=pass (domain: cherry.de, ip: 40.107.130.5, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5yyvKzjMXlDiZOqRWh6CTunB8Z7FDsjVwa8L1L5pmqt9q91R1Q8XcWB0f3Irig2srDM5elhdmlnPcLH6wbKnbV09nNFKOuwplbcFVVJyeHwNSw4BF8WM8+olhJdwJIgLeaZIyt/3VVK12cATsJp24G8LzsbRLX/WkK4/zimVq/nkbuwmU/rLytft8uHW8GMP7upYjJqHkSLNv9QAYh5xwFF17vK9iR7TTkH3BSkZgj9Ow4KPoyAZgeJFnonI2VwliSH2inTrczYnyACWxtYVvG+epKA9tBMMnHBbKBzD3CcyHC85vzZCqJqkZaRGG+JyltxEw5zarc86erZjpQfgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYggDUIoL4bd7W0tAZU8/8TbFQkRhYVQTUT7ihqvqQA=;
 b=cpyL/7i1a/fAZLM5ecO8DwfDRFpyys+sS4yEyWa9/BG4m/18AVY7t8py4LWd47HC++IjjWv7H7Nz4/lvCoOdIfKh25Q0LvPfvLQu2lTGaDnOXfe2AUxvJBlbljT9SauRiBiHE8gPfyIVODpqpMxPNjz0Z36JQyyBlwC7xKcSvtzil5+xrGw93U6VTVwOjYt6b6w4jpvQ7nfAs+7E4g+PrGOeMvghLWippnoeyA78zWDE7aKCdg4uwL8Z6rVcdxtamLKN08kFqSbXVt9oanzzICm4Fb/1wSIwsgoNik/Sd14Stt0F3ia9VjGBbGAIPsFmphEIAUsaX/zl7udxuYhNHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYggDUIoL4bd7W0tAZU8/8TbFQkRhYVQTUT7ihqvqQA=;
 b=DLScydVi0+YWdXUHv8JrNFfoXlkZAdkXmWCaG67oatNqBr61m/bI0zmEUlETEzOd36GE6RcPKcleJVaWjjTULZqr9oQnQaBeBA2P4+xc1gY4755T96BOUoFJNDiuA1dp00lFD6b5giEZrQZvIPQQEw7NS5hji5oDaQDIqWmsoA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA4PR04MB9661.eurprd04.prod.outlook.com (2603:10a6:102:273::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 12:43:43 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 12:43:43 +0000
Message-ID: <b54d7087-0ca3-4f08-914d-7b4de4151c7b@cherry.de>
Date: Thu, 11 Dec 2025 13:43:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 3/5] tools/build-docs-container: add CentOS
 Stream 9 support
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
 <20251211-build-docs-container-tlmgr-v2-3-58719c103a50@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251211-build-docs-container-tlmgr-v2-3-58719c103a50@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BE0P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA4PR04MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: 5413c8fe-10d0-4250-c717-08de38b2eae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y1RNTnpFMUVLd001QW9oUUIrVTVYYlFmR1BHL0NXU1Yyak4xVGVBckxsYmRz?=
 =?utf-8?B?d0RLUEtyc3VFODIvU2YwVFFFcHZaVFJaTFhSZGFFdWQwOU1rMlBQNEtWRGE1?=
 =?utf-8?B?NUxtNHZ6ckIxM3JhK1kwMERpZlBoMFlmb2VUbnl0cDJWOW1hWm9OT24wSTUv?=
 =?utf-8?B?alE0YUtoUVEzSlhrTVNFRmJlZWp0d1gwVlNGQUNnQjF6QnBjclNOUXdJbUYv?=
 =?utf-8?B?S0VRNFZ3TzJDWEszMlV3Z0hsRjUyMU5BaHdKbTVrNXVtNkNocDEwcVd3RDNo?=
 =?utf-8?B?ZkNXRU9ITlQ0bWx5U3RsdFM0VkJ2RXVoOFBFclRhVXYzTWc2Z0kva3ptdm5i?=
 =?utf-8?B?aEliQmFZL2Y5Z2d0VVEzeHJwN3VxdElHZFNydndveCtYYzZnYnhPYmxLYU83?=
 =?utf-8?B?TWFiL05OYVZ4dHd1SWh4cGRVVXVkT2lBNHJiVmU5U1BzeVBYeStYdUxST2FO?=
 =?utf-8?B?a3ZtNUo5U3Q2YkVMZm9Pc1c5TW9MbjUyVVFYT2VZRjR5S0ZNdmljQ2RrVmNY?=
 =?utf-8?B?bURWMEQ2a3dOM1dWYXBUMFlDaFlmY29jYlBzYXBpUUFrdm85dVVzM2JvMVcr?=
 =?utf-8?B?TjFTWlY1VVZqZ1ZRQ1l0NFpvSFg3S1RqNkwyN01uekhzTWFvQnBjSGZRZzdo?=
 =?utf-8?B?cUxyNEFvRGhiWnpKY2ZqR1VtVGh4UXRkeGcvVXVGS1VGRFBBTDlhK1pnOXhD?=
 =?utf-8?B?amlMd3pFSldHSzQ4anlPM1BUMkNnQkcrRU5UeStLVlJQSUViSWppdTZ2cm1h?=
 =?utf-8?B?SEplLzhLZHMxOW5ndGNnRDU2aTlVM094NU9VSlczZDhsMUNoZEtzUm1PU21I?=
 =?utf-8?B?dUszaWJyMnRxZDM5RmczQ2M2STlWS2RjdVVKRERGV1ZZMlZxbUVPZHF3elRa?=
 =?utf-8?B?d0pvanZvT3VMMFg2L0V0QWc3bUl5NHA1MUhWeUlsN0RSazFCZ0U4RXBqY1V0?=
 =?utf-8?B?M3dKc3ZPWnN1TXRnekR4aVZIWWgxbEEzOWRGMzR4eWVPZkt6ZUJKM3BsRlhv?=
 =?utf-8?B?N2dnei9YMC9rMXBhWTIxWVdlNnZSNzIrOE9hWFZRemZhUnpnVFVFMFlrelgx?=
 =?utf-8?B?eUlJNG5sTS9KaWRCRmk4cnZzaURHWGVLT0hScGVpaUluTHU0SnRjY0F2K2dJ?=
 =?utf-8?B?RHhiYllhNzh4bFE3N3VOV0FYZ25ZeGZ3Vy9PU1hHUC9zR1ZsWFlhUGtWbnQ3?=
 =?utf-8?B?eVR0WUthdGJxZXFUeU1UZlVielg5Z2dndmxKOFQrZE1iTVFrL0VkZkxCcTl4?=
 =?utf-8?B?ay9xdkdoM0lxZmZmQzBnQzBFSnB0T3lIY2dXb0VPdVVnUUNRbWtlL3JteEhW?=
 =?utf-8?B?d0JnUkhQNE1rWWNGamtWUjFEYWVndm9pcHhQbU11UExhOUJaQkFMam0yRlo0?=
 =?utf-8?B?VnJDR25jTVBFMmZOQkl4dEpuVDhVbC9RUU16TExNd0hFNGF6T0IvZEx4cTFD?=
 =?utf-8?B?bGdvRDlaa1M4RjRHQ0F2T1RUMlJFRDkzaWN0REpQWWlBb2x4dGVvQlJCQmlW?=
 =?utf-8?B?OHMzSUpNOGdDaFhrYjYyWXJxRmt5SnE0eXpuVkxqRU5zNHFCNSt1bnpLQStr?=
 =?utf-8?B?ZzNBdTRDMDA0cU5LdUhwOWYyVitIbk9MM01wU2UxRWRmSEpzNkkzcVFlUDVh?=
 =?utf-8?B?bGFSMVpTRm5rczBhV3AvdlFjdHpiaDF5R1ZUK3YyVnpQSDY0dUJpRE9UQ0h2?=
 =?utf-8?B?U1prTFN0SkxzQTVaeldXZ251bVdIcTI2TllPV29EcVBoMElOQS9hTy8xSmFu?=
 =?utf-8?B?SmluVTB3eEVGbUIwZ2pFUzcza20vN3cwakZ4MjhPckpwNGVQN2lPM3dSOFFi?=
 =?utf-8?B?TWdoMllYMXJNYXNIVVZadXRLUE9yMVZTUUo4ejBXclZzTmN5Y2RucnVlUyt3?=
 =?utf-8?B?RTlzdFdXSmZLNDhjazR1Mk5wemlnR1ZsNEdKNDFLcnlMd3NpZU9KdTgybWtv?=
 =?utf-8?B?akQ4REtxN21MbCtUeW9PVTI5WkpTM3oxb2JyMm5DMS9YSnVpNzNBZmhGV05v?=
 =?utf-8?B?L3VmTGJia0NBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y0NNVCtnQmZUa2szUkJNSWt1M3pRWjQwV05KaUNDaDBXNjFkVjhBRVB3a3kx?=
 =?utf-8?B?VTNuN3ErTEpsM0NrdmRad0MxLzNCdWRPTVlPVllvSUlRYWgyQmJtRVNEdTJ4?=
 =?utf-8?B?Q1BwQUZVMDQ5NWhpSGJLZkMyY283VU95cFdlY3FrRkxrRWNIUk1aYjNzNUtz?=
 =?utf-8?B?UFlLZjhRQ1R0c2FadlYrOThGR3FHVXRaZlhWQzhxVzhoa0FZZW9CcE5lcUpG?=
 =?utf-8?B?Q2JYcTRtSkpSS05GUFNYRndTQ3M1clExWW5VazlUOGxwdjUvRGpmQVdIREZa?=
 =?utf-8?B?bkxVMFd5Vlh0aWhTRUJYSFJDUGU5VU5mNzZzYkZHSDVwdVJLNXIzWUtpdDc3?=
 =?utf-8?B?eWxBYlhKVVUwVW9iR1QvaUQwQ1lKVUJmUElXWDdTUEZhaEo3SU1XZldkek10?=
 =?utf-8?B?T05qS3Bhdnc4L010MG90bUtEWTI4MkR1TG5IanlwWDNhMkhndFdEY3JaMk4w?=
 =?utf-8?B?aTBNNGhYR1Y2NGxVaFlXUzMxeWRiYXBZUHFmbmFWVFVDWlZHUnJKVjh3V0R3?=
 =?utf-8?B?T0srVGVQWlVjb3hLWDI2RWUvdHJTV0RCeGJ3WWJ5ZFdRclZqNTZDVnQrUDZS?=
 =?utf-8?B?blZPWFlKNERSRWtneG5oYzVxc3l0YUgzZUZlcS9WVGVQZ0JhQnJ5NHVWRi84?=
 =?utf-8?B?WXlJNTdTa2VZNUZHWkZ2bE16dm4wbmh3RHhsQTNxZVdNS2ticUVXU2N5ZFJq?=
 =?utf-8?B?UnplMGZGNkEwUDdJYmtLb2tjVnBja1llNHd4dWFpWk9DYWoydGo0R0dhQ2Jp?=
 =?utf-8?B?V0I1MEx0OUQ2V0E1U1RiN1JZZ2x6VVJ5cjRBT2pnZmRMRFdERFk5ei9aV0Mz?=
 =?utf-8?B?aVFUTTJDNmZJaW43V2gzQVZ6L3dRTE9ha0xLM2J2NHpWZlN0cmpHZDBHSG9B?=
 =?utf-8?B?TnJlWC84SmQ2VjN1N2tJc0Zna24rUTNPRUt5ajRwQ3puMUM5ZFVRdVpzdStN?=
 =?utf-8?B?TElmMjRTYm9UODhZVXJtaE93MnZ1bmdmWnNSRWVHQWtDT3ZQRUVVbDNkSWk1?=
 =?utf-8?B?OTg3VDErTkN5S2tLR2RwMmtPemM2dnZBak03UHE2a1g1Z2k2MTQxV252b1JV?=
 =?utf-8?B?aHVmUUl1ZjlrUmtNRHNmTmpUOEdiZGY2aEF1SEFIV3o5d0ZGY1U5MDh2MytE?=
 =?utf-8?B?NEl1YVR5d1ZjK3ZZandMZmkzOVduNmJWKzNCZDJUa3laK2hKdmg1eVk4QlZa?=
 =?utf-8?B?eG1JNnk4cm9vclhOVEJnTG0wZ3U1dHlOUlhnVG42U2ZvcGZEdmMrZTYrMnlL?=
 =?utf-8?B?ZWZQY1BGSzFuejBDMnlrNk9rd2NNa0tTb2VGdHNQa2Y5bFVUOCszeG1QSDJY?=
 =?utf-8?B?L2pBU3ZOc0FjaTY4UThSWlhzd04zWENyYTFKMmNtTDJ4MXRNSTNVUjNlNjNy?=
 =?utf-8?B?Q2ZCRy9ic0xheVFlVDFFdzFxT1ZCN2x1SmdEQkltWUtvVEpUc0ltcFFWbFJV?=
 =?utf-8?B?aVUrT1hWclUrQkViVjZxTDlEMXc5TXZSR2l0NG1MUnBLclJNOXBzcWlldHlJ?=
 =?utf-8?B?V2NsQzFRUzlQUUF2QUtYWDlwNmoxK2ZOb0xBS0x0SS9XckRDSmNTYkMwTlRN?=
 =?utf-8?B?KzdWN2kvR1A0QWo4MlFrdXF4Y2hGZUladndIZmg0MCtHdEx6NCtpTzhQYXRO?=
 =?utf-8?B?NDdPcDVYUldvMW95NEJQODBSWlh1YmlJbFEyY2s3MWI1dzFpVDk2RFRoTGxv?=
 =?utf-8?B?VEZKQmxQNEhDSlR6d0NnZkZXM0lJcWZqSUh6ZUNXUFRwNFJrbEhsd2JUMmwy?=
 =?utf-8?B?RlJwaHQxdFN0Ty8yV0JRbmFYd2ZiRW5KZUdHdTY0OURFSmM0MlJyNjIzNHBH?=
 =?utf-8?B?bjArVjNNbWJ2QmFnUmRicTdQU0FMcjRLQ05YQ0o5THF5ZW82a1FnQno1YkNy?=
 =?utf-8?B?djVicndCSXJWYmRXanIwSk42TTcwd3dndUQrbVpaOVNycDM2Ylc2d1BrbEJS?=
 =?utf-8?B?ZG9YUTBWNkFIbkNzOUdoTkU4Tit6RHJNWE1KMnRaQ3VIOGFpNmROL1pjZysy?=
 =?utf-8?B?b2kwR25PWUZqT1ZPdWp0TCtOdWgwSE1iYytMS0hocFBKK3h0cWRCTUlKN3ZX?=
 =?utf-8?B?OVNxQWQzRWloY1FUbWZDQzF3QzE1T0pRMStwZDZCdEtkU3Y1d0lSdThRRFRB?=
 =?utf-8?B?MmU3OFYyTG14ODhXZk1yUWRueHVDMDN4UFc2WEFRcUNuak5aWFlnWUQzdzVR?=
 =?utf-8?Q?9TzONF0HLBqwKplH5if6Hq8=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5413c8fe-10d0-4250-c717-08de38b2eae1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 12:43:43.0033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTh6vWyWGI4fRHzXFkuv/lxmkjtew/Ff9745MAUw1sAegJprElHaFcuy0lcrW7S3O+/zNPxHZY5Rwt/cWxjZuOLZPRL9xcuny4d8qu7ZVhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9661
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 12:43:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8254

Hi Antonin,

On 12/11/25 10:06 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Add support for building the docs in CentOS Stream 9. As there are no
> official images for CentOS Stream, use tgagor/centos from dockerhub
> which is actively updated.
> 

There's one, on quay.io, managed by Red Hat.

> The centosstream_essential.sh centosstream_docs.sh files are based on
> the almalinux files.
> 
> Introduce a new installation script: tlmgr_docs_pdf.sh. As I wasn't able
> to locate all the necessary tex packages to build the documentation in a
> PDF format, I resorted to using what is used on the Autobuilder: a local
> installation of texlive packages through tlmgr.
> 
> This will allow us to provide a way of building the docs as PDF for the
> distros that lack this support at the moment.
> 
> Use a new Containerfile.stream file as it needs TEXTOOLDIR exported for
> installing the texlive tools in a known directory (we assume the base
> dnf Containerfile does not need it, as it is currently the case for
> Fedora).
> 

Not applicable anymore since we use Containerfile.dnf?

> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/system-requirements.rst   | 35 ++++++++++++++++++++++
>   documentation/tools/build-docs-container           | 14 ++++++++-
>   .../tools/containerfiles/Containerfile.dnf         |  3 ++
>   .../tools/containerfiles/Containerfile.stream      |  1 +
>   .../host_packages_scripts/centosstream_docs.sh     |  1 +
>   .../centosstream_essential.sh                      |  5 ++++
>   .../tools/host_packages_scripts/tlmgr_docs_pdf.sh  |  7 +++++
>   7 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index 9ed29a1df..e9d5012e3 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -266,6 +266,41 @@ documentation in PDF format:
>   .. literalinclude:: ../tools/host_packages_scripts/almalinux_docs_pdf.sh
>      :language: shell
>   
> +CentOS Stream Packages
> +----------------------
> +
> +Here are the packages needed to build an image on a headless system
> +with a supported CentOS Stream distribution:
> +
> +.. literalinclude:: ../tools/host_packages_scripts/centosstream_essential.sh
> +   :language: shell
> +
> +Here are the packages needed to build Project documentation manuals:
> +
> +.. literalinclude:: ../tools/host_packages_scripts/centosstream_docs.sh
> +   :language: shell
> +
> +.. literalinclude:: ../tools/host_packages_scripts/pip3_docs.sh
> +   :language: shell
> +
> +In addition to the previous packages, the following TeX Live packages
> +are needed to build the documentation in PDF format and can be installed with
> +the `TeX Live package manager <https://tug.org/texlive/tlmgr.html>`__:
> +
> +.. literalinclude:: ../tools/host_packages_scripts/tlmgr_docs_pdf.sh
> +   :language: shell
> +
> +.. warning::
> +
> +   The Tex Live installation above is only valid for `x86_64` hosts.
> +
> +Before building the documentation PDF, setup the ``PATH`` to use the installed
> +packages:
> +
> +.. code-block:: console
> +
> +   $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
> +

I'm assuming textooldir is NOT a typically set environment variable so 
we should specify the user is expected to modify this to match their path?

>   .. _system-requirements-buildtools:
>   
>   Required Git, tar, Python, make and gcc Versions
> diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
> index 7d25b15b9..0800c4333 100755
> --- a/documentation/tools/build-docs-container
> +++ b/documentation/tools/build-docs-container
> @@ -33,6 +33,7 @@ $0 OCI_IMAGE [make arguments...]
>   
>      OCI_IMAGE is an image:tag of an OCI image hosted on hub.docker.com. It is one
>      of:
> +     - centos:stream9
>        - debian:12
>        - debian:13
>        - fedora:39
> @@ -91,6 +92,14 @@ main ()
>       #   docs_pdf=almalinux_docs_pdf.sh
>       #   pip3=pip3_docs.sh
>       #   ;;
> +    "centos:stream9"*)
> +      containerfile=Containerfile.stream
> +      essential=centosstream_essential.sh
> +      docs=centosstream_docs.sh
> +      docs_pdf=tlmgr_docs_pdf.sh
> +      pip3=pip3_docs.sh
> +      repo=quay.io/centos
> +      ;;
>       # Missing python3-saneyaml
>       # "debian:11"*|\
>       "debian:12"*|\
> @@ -135,9 +144,12 @@ main ()
>         ;;
>     esac
>   
> +  # Default to docker.io unless specified above
> +  [ -z "$repo" ] && repo=docker.io
> +

Maybe set this at the top with other defaults so they all are in the 
same place?

>     $OCI build \
>       --tag "yocto-docs-$sanitized_dockername:latest" \
> -    --build-arg ARG_FROM="docker.io/$image" \
> +    --build-arg ARG_FROM="$repo/$image" \
>       --build-arg INCLUDE_ESSENTIAL_PACKAGES="${INCLUDE_ESSENTIAL_PACKAGES}" \
>       --build-arg ESSENTIAL="host_packages_scripts/$essential" \
>       --build-arg DOCS="host_packages_scripts/$docs" \
> diff --git a/documentation/tools/containerfiles/Containerfile.dnf b/documentation/tools/containerfiles/Containerfile.dnf
> index 65c526705..fd47fde34 100644
> --- a/documentation/tools/containerfiles/Containerfile.dnf
> +++ b/documentation/tools/containerfiles/Containerfile.dnf
> @@ -7,6 +7,9 @@ ARG DOCS=fedora_docs.sh
>   ARG DOCS_PDF=fedora_docs_pdf.sh
>   ARG PIP3=pip3_docs.sh
>   
> +ENV TEXTOOLDIR=/opt/docs-build-tex-tools
> +ENV PATH="$PATH:$TEXTOOLDIR/tl/bin/x86_64-linux"
> +
>   # relative to the location of the dockerfile
>   COPY --chmod=777 ${ESSENTIAL} /temp/host_packages_essential.sh
>   COPY --chmod=777 ${DOCS} /temp/host_packages_docs.sh
> diff --git a/documentation/tools/containerfiles/Containerfile.stream b/documentation/tools/containerfiles/Containerfile.stream
> new file mode 120000
> index 000000000..7237e9b99
> --- /dev/null
> +++ b/documentation/tools/containerfiles/Containerfile.stream
> @@ -0,0 +1 @@
> +Containerfile.dnf
> \ No newline at end of file
> diff --git a/documentation/tools/host_packages_scripts/centosstream_docs.sh b/documentation/tools/host_packages_scripts/centosstream_docs.sh
> new file mode 100644
> index 000000000..351f75893
> --- /dev/null
> +++ b/documentation/tools/host_packages_scripts/centosstream_docs.sh
> @@ -0,0 +1 @@
> +sudo dnf install -y git glibc-locale-source librsvg2-tools make python3-pip which wget

This is the same as for 
documentation/tools/host_packages_scripts/almalinux_docs.sh except for 
-y and wget. I'm assuming we only need the latter for the PDF variant, 
so maybe symlink this here to almalinux_docs.sh and then install wget as 
part of tlmgr_docs_pdf.sh? If curl is installed as part of the other 
dependencies, another option is to use curl instead of wget to avoid 
requiring this additional dependency?

> diff --git a/documentation/tools/host_packages_scripts/centosstream_essential.sh b/documentation/tools/host_packages_scripts/centosstream_essential.sh
> new file mode 100644
> index 000000000..e38fa93c2
> --- /dev/null
> +++ b/documentation/tools/host_packages_scripts/centosstream_essential.sh
> @@ -0,0 +1,5 @@
> +sudo dnf install -y epel-release
> +sudo yum install -y dnf-plugins-core
> +sudo dnf config-manager --set-enabled crb
> +sudo dnf makecache
> +sudo dnf install -y bzip2 ccache chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd

Isn't this the same for 
documentation/tools/host_packages_scripts/almalinux_essential.sh? so 
just symlink it?

> diff --git a/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh b/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh
> new file mode 100644
> index 000000000..727bf9e35
> --- /dev/null
> +++ b/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh
> @@ -0,0 +1,7 @@
> +textooldir=${TEXTOOLDIR:-"./docs-build-tex-tools"}
> +mkdir -p "$textooldir"/tl
> +wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O "$textooldir"/install-tl-unx.tar.gz
> +tar xzf "$textooldir"/install-tl-unx.tar.gz -C "$textooldir"
> +"$textooldir"/install-tl-*/install-tl --scheme=small --texdir="${textooldir}"/tl --no-interaction
> +PATH="$PATH:${textooldir}/tl/bin/x86_64-linux" tlmgr install titlesec varwidth tabulary needspace upquote framed capt-of wrapfig fncychap gnu-freefont ctex latexmk nimbus15
> +rm -r "$textooldir"/install-tl*
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8243): https://lists.yoctoproject.org/g/docs/message/8243
> Mute This Topic: https://lists.yoctoproject.org/mt/116726509/6293953
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


