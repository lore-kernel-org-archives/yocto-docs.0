Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7507CDB47C
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 10:51:14 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4236.1782298267000826444
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 03:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=jF+VzBfK;
 spf=pass (domain: cherry.de, ip: 40.107.130.37, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isdpvLSNu3mejORNmvtWxg6Bl4pxhzjei96Uen2sgWGQkwwc1owhWwBemchxuSr4Qn25WRr8CMVQ1KtYN1/S+pIZk9BNXsU4me5ScDsGpFxSDJSomdNNkbqaa7rzVO8eJggGyoh+UIqHIC7ry0yzIe5pp9CCW94JlDJXBxDB5PKxbO9uzU8NIleWwkv9Kzcmz1fPRDbQ2RQ6+5bsjDO9UiMvu121nh9RFmVUGdHgasCv816dTwU3dAKDbXwHlJ+foT/jh4Unmo/aqhnWp51ikPUsU2txCLUz66NfaK7y6sXk1PTk0NCLQyrrbSiGmMiLRu09cBPQS36/sucDg+FIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PttTFUMMmRQVSj2QbKGdfJYa2Ctc41/4/DLqS6sZlZU=;
 b=GCGks2rQaMK7kEDIoXYJstURMomCSH4jCQ5Awqi4Yu+Z1WRchHYMm14YuvIyNa7vthAJg290LoPPIWuKm5izwRNxZadxVk4mY6y7Q57TdZRKX2Ba2ghh8roIMAyj8uwYnvYgX259AY6f5Js1IUPGge9URInXF407adKF4XQZ76PcOI8KMpNE5jlwb98FJ2845aUa/HWtr3qyo7aadb83VRQ0LIIG/v42Mpr3MZGk+HWJ4/B0mJ3tf473no1RCxq2E2eSfBwR/9TRb6cKmmqbeIdoyYigALaS2uKtm4UOnH7KsWND2UasHaZn6w2frnZPBTS+Eq3G7+7zAF9HSA9bTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PttTFUMMmRQVSj2QbKGdfJYa2Ctc41/4/DLqS6sZlZU=;
 b=jF+VzBfKphnq+ElIKshTLoka9tH7egerTXSATvdnFT4hmcDEg/S0ew6c+e/85YGmTDenWeTMLGkswpXpnNsw9FkJAUWXTa0VYZdUcwSudlSHSq4PRWUU9AbWc0c2xAdYd/0sRmew1YMK75V96De9HGoySOgHEXQGN/NAVWXq1AQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DB9PR04MB11580.eurprd04.prod.outlook.com (2603:10a6:10:608::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 10:51:02 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 10:51:02 +0000
Message-ID: <5860d181-e58a-42ca-a849-a85d1dccd8a4@cherry.de>
Date: Wed, 24 Jun 2026 12:51:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: add missing section on
 build/tmp/deploy/spdx
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <3c5da9d7-fc80-7a9a-eaa1-4fb9eed25a6d@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3c5da9d7-fc80-7a9a-eaa1-4fb9eed25a6d@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0244.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::13) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DB9PR04MB11580:EE_
X-MS-Office365-Filtering-Correlation-Id: 99e0db04-9d25-4a4e-dc3e-08ded1de7be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	kaHwKW3W0LMlRsr6EsQ13ILb5lT9LCeVwbKUprafRn1chq+cCgNk7bSjhtbUtG4kzIPmA2O/JMNIP5TpYtbndJjpdwQqqiQCvSVNzglGIOThaCkV6/c7ZEdgTom2KDTdwrhAYlFyBH9/i1iUO1cMezB9jVKwO7yBrJK8iQXNJXNXBMx4NRMFBWlRY1pCGK43+lgoO6yNNyCnXSlLSulqRHtrMKS1LJvjqnhRGMa0gII0rko4DJ8fwN2WSxQtUg2jzz0uYL9BecjzfrncOqpa2Zwje113cPXw3CY4hH00aZ0w4eoFR9jT3+RtV37JnHizWR5vi3WdnjDNAK49hlc59cgdzsb9kGrlT6IIJDMrPG3oimatLHengejHEUoOqh1tB+fDvxFj9Bhbf+Lsme6aIGkWlpvWdjVmPR1FqdCeG6Nv6/P2Brxbxd0xNfHEtnHZXuTwXtpO0xSl3TwxR9d7oXR+JI0GO2SmU1RCfJ77YMZnro0ulLoDMKqLzL6a5xfwHRmwgWg96ngC8AswbR0PS+tp6S9kYap+mttmV1XXP9JfViTwZZUQvxQmTZFKwGyoRE/l3nHCLgCsPmVr4um0l0zBsVk/5V/L6vmNyX6p3uojWnfA1OkYR7I2jO1DxkxWSxQH/pd8Wb2ZHA2JR0faXNvakfxeZb56i3kUILiFv4o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YUJ6L2t2TEMyYmp6M250eFFOS2JZMXlTelN6blo2ZWVnaFlEZEN4Q1ZCRmFZ?=
 =?utf-8?B?cGw3bUYyb0MvV1ZKZzRGMHhWdCtTWmdrbEZndkZVRlFrQUxDUXF0bGI4RXRI?=
 =?utf-8?B?MmhYV210VHJLSFM2ZHV5NldyR3FPUmZvYzFKWUZhSUV3R1hPc2V0Z3pJbm8v?=
 =?utf-8?B?TENqaEFoeUF3TWYxanhkQ21xd2dDT3JNemdOUktiekI1TGQxeWdDVU9PcjJo?=
 =?utf-8?B?WE9KVmRkTWd3ZzZIUTF3UzVNY0tNUWRhN0Y2dXJMckR5WmxKTVBBZVhxU1U5?=
 =?utf-8?B?Q2JHNXhHVnpNMktTT2hxVmlKT0Z3SGQ3ZzNUR2tmdjdqVi9EakFKVnM4SnNZ?=
 =?utf-8?B?MExvejlHNnlJKzllM0ZlOEcyb2JFVXdyY0lnMXl1NTNoRXJ3QUFGa0lVQmN4?=
 =?utf-8?B?QU1OWXpTK3BEV0xkbnBIVVlsY01pbjlQNUdjV29vYmV0MFU0UWpZS3RQYnpD?=
 =?utf-8?B?N2VMZkJta0RxemRNWGN3QWhLZStnK1hwRVBGUzNBdXZvK241TjFJSFZOL3ZT?=
 =?utf-8?B?Y3REakw4cTBDMkpUbWlOZGFkdHRqeUF1VEw3bHEySkZadDdIMExMbmp1NENL?=
 =?utf-8?B?YUFmS2tvMTlJN25ueUFsOXgzcUVxU2l4bytmb01rU0h0d3lnT2VHZkZlTXds?=
 =?utf-8?B?ZmJhc3l0NXVRQllEaTUySTJ0T005bUIxeDBmMXNHWEJENWNvOGxQbmtpSmkw?=
 =?utf-8?B?UHFsWGZubitEK0d3WFZDV0ttQ25OTkREY1A1eml2OVFLRlkyUVZCZjU3U0tj?=
 =?utf-8?B?TlNMVitDK0NXdXZGck5rb0diRmlwUXlGVUc2dVZyNnpzTUZTZVp6TXVCRUxq?=
 =?utf-8?B?dC9hUUhpdW9yeVJYQU9sdURRU05EWGcyTzEydnR2NFVmVjl5bjJkeVdDZTdk?=
 =?utf-8?B?VUFQcUpRdk5IMWNXbXhqQlhmdGFEOXl5Z29hNXlKZXJ0dm83MTJWc2VSOWw3?=
 =?utf-8?B?WFJuZERZUUk5Z3htQVJpbzJwWmQ0VU5Wck9MbGhEY29rVlM3Q1krTGZ4MHo1?=
 =?utf-8?B?ZHF5WmNmeE5XOEtHaFQyR2c1YWhtMExUa1c2cW9jbUZOczFVWnZsK3dZMEdP?=
 =?utf-8?B?RUlRZmlVZHR4MS9sb043YW5RNU0wSVlsbGs4L09BaXFrWWhlTENCaXdxMmRM?=
 =?utf-8?B?OW9XSzB5RDZSdWsyWVBMRGF3YzRSMzY1VmN5UmRkS3poTkFiQ09IK1ZEKzFo?=
 =?utf-8?B?YTZwdXZ0Nkd3UDhDNXZCOEVpQXJjK3VmTWpDclJmczdxZlpvSGxWcHhUVmlx?=
 =?utf-8?B?L1hOSnQxVExGWkRyUkJuSFVLRWhPQXBSbzNsbE95c0g2cUZjL2doeGx0dFdy?=
 =?utf-8?B?QWZRR1BuZ1ZGU1JLckpadEZRYmVsSmxoejVkd1Q3RlRkL1llMlFVUjZHTGN5?=
 =?utf-8?B?KzExaDhRSHMxRmZXUGp0SklrendDRU1QWXcyRFVwbTBkUS82cUs1NnFFRVQw?=
 =?utf-8?B?RkgyMjkyZjhNdGJmWkNST1VUQ1hoZEFhbDRhVXhyeGhTOUFIWElJNlJYWDNm?=
 =?utf-8?B?YXgwelRJZXJaTFV0M0xKeDdKQnZFR3RGT1l5eWUvTlBFVkpVL1U5Y0ZUSUJh?=
 =?utf-8?B?VEFZLzFINHZoKzVQbnRoUGFCTXBHRTE1R1RBdkJteXVaSVJHL0pyUFZjSm1G?=
 =?utf-8?B?dlFiUHd2Z0txMFZBL3dGeGhBbktGUjFxa0tZT3hTV2N6aG95MEg0ZDFRemZn?=
 =?utf-8?B?WEdkYlY2aUlSdGVSdjIyV2VZS0hRSFB1YlArbjBTQnYyRDltTlg5d1UxTzQ5?=
 =?utf-8?B?bDhWamp0THJ2TzNmUVZ4Yi9VYWZkSGU1eXh3Q2Q5b2FvVXc1bWp5Qm0raENR?=
 =?utf-8?B?NjhzZlV6dzBMcUFWaFZjbm9EQkE0T2wyaitVUCtaQW5VdGJXK1pxUm16NnZ0?=
 =?utf-8?B?WFNaOWs1MFJUM0JpdVFWaTlIOEFwbXpSbW5NWWR4TExxeURnMHhjd2RLYlR5?=
 =?utf-8?B?NTFqYWlKVjBzL2VWME5DQkFyWXlZUGlPb3BiWlc3MHB4OWFiUk1MU0p3S3J6?=
 =?utf-8?B?ZVlWYTY0d2VLZU1DREFYUGRHeDkwNGNib285SUwxdXI4UWplVU1MVTMvaUNx?=
 =?utf-8?B?L3BLQUUwMGw5NmN4ODBpZndzTUp3YlZEQkpUMkZrZmpCMkRMd2t1ZnN2c29m?=
 =?utf-8?B?RE5kU0lYZEE4Q285T21JMUM4akhKS3I0a0Rjamo1eXNiQlM4UnhvQTVQcXNX?=
 =?utf-8?B?Z2c2aDk4Ni9QK3ZYTE5DVllGOHcwVTQ2dzZqVEJpUi9PdFJ2eFIvR1BMemZE?=
 =?utf-8?B?SGhxak92c1VQeWJtVFFuaHpiS3UxZCtoK25tdDlSdTBXVFVabUFzeDcwMDhO?=
 =?utf-8?B?aGxOMEFjeXNxUjA0WWJtNzdxbkRGajRrTWFRbTVlbkt5Qithb3p6dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e0db04-9d25-4a4e-dc3e-08ded1de7be1
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:51:02.6679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /s0PplM6wgQUfclb2QMt0AF4yFzrb+NfODEgV8oW7SKjRM6Fs7fcxTbpmK6UCSEGJompl0CXtXqBrfv0GWCtjggjMXzbE6d4u/cAg2dR41I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11580
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 10:51:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9859

Hi Robert,

On 6/22/26 7:44 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> There is no subsection on build/tmp/deploy/spdx; add it.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
> index ff84b250b..e22de6047 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -539,6 +539,15 @@ licensing, see the
>   ":ref:`dev-manual/licenses:maintaining open source license compliance during your product's lifecycle`"
>   section in the Yocto Project Development Tasks Manual.
> 
> +.. _structure-build-tmp-deploy-spdx:
> +
> +``build/tmp/deploy/spdx/``
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +This directory contains a Software Bill of Materials (SBOM) in SPDX format,

"a"? I have tens of thousands of them, in various subdirectories, though 
I possibly reused the same build directory for multiple builds at 
different commit hashes for OE-Core and I built that 2 months ago so 
maybe things changed since?

:term:`SBOM`

:term:`SPDX`

Cheers,
Quentin

