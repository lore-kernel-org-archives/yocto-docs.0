Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D29CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:20:51 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.70])
 by mx.groups.io with SMTP id smtpd.web11.14326.1761319241276784180
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fenxbrpc;
 spf=pass (domain: cherry.de, ip: 40.107.159.70, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyAWEaby2g/zxLOXLA6IqSzOTiNjybg+kCGTQDBAYQwIdM7WXuRsF1R7FPh2H8zBbn63LUzhc7YHyKZe74TzMnwBQ+bD5dvFqanQqA4J19pjW7lf4lGI4NwBQqCkmAcIMDR3GtG6vQxaRfBeD2+wNGIbxMzgY16a8IbRi3C+WnGgvDqQAUYb+xeeiNwiW/eJ/zurjTGHZ/DnllGBOXooUcZJXyHtxlhIdttUTGvYVFdgSwu+5ehfoL03luIhxakMpia4E2scFNfVhqP3ne7hVQ2uFkRnamcZTMQiT9CR2NfJrVEGYvyL3JTE91c05T3cYm6y+TLF6LvwGVgNSXrgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TP8pfhlOaWYWzNKvPUD3EamBMMhvlKTefEemKetfx9s=;
 b=FnQ4kMMSWTZ+KuQFRa89FbFUoMH8zzXPCCCJMSB4zJoRCFiL2cTLoCBw5lTqHcHbmq0a4y7MVATF9jTotbhrrdS0He2L7zyqnSjvGJ5PYb4DAxoec8JdSZbdQAY+ocHe6i8BDrm97M1yv4J36hyLrVtXVAEGN8UlWDB/tjiQABsHWMC7k0uE7+lAbGxCsAGD+PGUQuDY4MWLyxA4PIimvOykyJY0d/S7xPjFwULEg4KpKgQ/dTqwVL61XecvbRm2qd7k4cF/pl66OkN+WDeUY+q+vdi7OiYSloc1yRvX0fy0dXVbPUxfNU2AvPCmOb/SzzsTHbQJNCnI0gyl5vNWJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TP8pfhlOaWYWzNKvPUD3EamBMMhvlKTefEemKetfx9s=;
 b=fenxbrpcC/eyUfluVe1xtXE+RiW+B3aDHxAtMvqYsdc6vy8xJ4XAJP+DUNEwEsPxDKeiv20BIXn9GCVtRdhm7cvcK4KXRPjyJN4DPIklQl/OU0dodraKx13MGOeV9wWahZXTUGH1e4rtoyO27kWl4Uocyk2msJU4nWNSUvrvjoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9218.eurprd04.prod.outlook.com (2603:10a6:102:221::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Fri, 24 Oct
 2025 15:20:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:20:37 +0000
Message-ID: <c49dfe3e-9601-4978-a9ee-ef7174d5fd7c@cherry.de>
Date: Fri, 24 Oct 2025 17:20:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] ref-manual/classes,variables: document the
 CCACHE_DISABLE variable
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
 <20251024-release-note-5-3-second-hunk-v2-5-d15dabc095d0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-5-d15dabc095d0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9218:EE_
X-MS-Office365-Filtering-Correlation-Id: 8940c548-83ce-48be-cd7b-08de1310e28d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N2ZGSjJyV2k2UHRJeXg1Y2pzdXJ6L0JMeVFYclFleExRMGczTktRWmlxSXFG?=
 =?utf-8?B?dytJTCtsb0gxUzNydkdEdFZxLzdMTHJQeFhjcmVCT2E2WmJ1a3hPQkM1VkNk?=
 =?utf-8?B?QjBtTmhjYmFHbThUSXNqN1NGK2FDU2FSWms1N2YwWmdBZFhrc3hOVlBMWndp?=
 =?utf-8?B?NG1xKyszeVlGWkIyNlNRLy9FMk9sd3czOGs0cFVGa21kR1Yvb3JTWU05UGJl?=
 =?utf-8?B?cTlyUDRzMzhBVTI4c1QzcFdpL1pidWdnZWtDcVl0dkZsU0N1YVU1bW9DM2l5?=
 =?utf-8?B?ZVpMdDFDOTdrUTZqL0ptU1pIckp1RFpFUjE1aTF2S3VaZXJERzFWb2xwN215?=
 =?utf-8?B?a3NGQ0twcC9tMHBlQXJXb0U2UGlKWGF0dVBOajlscWQvQW5PY0pRclFkMWdJ?=
 =?utf-8?B?RW9pV2dhZkEyMlZmOHE4RVlJTThhMDlOdU1mOTJ4VEM5SXNwWTZJY1A1N0tJ?=
 =?utf-8?B?QTRQV0NpTUVnSldTdFdYQnVSVUY2Y05mNlZQdXArZGVIbUsweDV3YmEyL2Vh?=
 =?utf-8?B?dk0rbzRRcU85c1lXcFNUdldmZ29TYWxXNVhUQjFrZFNkeGloRUd2Y0U4K2lW?=
 =?utf-8?B?MDJkM0ZZb3NDZjNvTFBUUVJzMmdPNWZyODFSNEhJbVdwdU01anFZY1lTK09J?=
 =?utf-8?B?c0hYeXJqNWtUQnZtOHFGRmpGY0dQZEJibFZkMnQvbGdlMndCVlE1aTRzNFhl?=
 =?utf-8?B?b2FPaFdiOHF5TFlpM0VPcHpJbXl2VVVjUlZuWnFqK3RYSW5iR1NsaTBtbG8w?=
 =?utf-8?B?dmFZOUFJc3lmUTR3aTJqc2JOTGQrYVZKMUNFbUdhKzhycXFybkxrOVRlaEpa?=
 =?utf-8?B?eW1DK3hrOUhmYkcxUitsL01TeGJmSWYwSFVIZHhoaXN1OGw2cXFTc3k3VVU1?=
 =?utf-8?B?UUEwcDgycThaRnhVeGNubDB6UTdpYkt4WWlvTWJJS2ptdDBWbnVNTytPZUZM?=
 =?utf-8?B?NDFvK3VGT01mM05IdVd3NkJNdXFHVEVjb001c3pnczVPTkJNdUdjTXhGTVlr?=
 =?utf-8?B?TXI2K0ZndXViQXcvN1pLdS9SeFRKaG5jakQvTVhvUjRzRHliMncraE00YWRu?=
 =?utf-8?B?UithUDRvcWRXbzZ5OUxCVzg1K3VTcjhoN0VYZlhXZmJGRlZrRERtNFljbDVp?=
 =?utf-8?B?RFFvY1ZjTVRXRE9ITXJvOXBKMlBJYlpNa21wUExSa2VlQk9RS1JvOFJXb1Fh?=
 =?utf-8?B?QzZlcURoVkFuYU8za01nQ1ZLb1A4Snpzb3AzZlgwZU5HTFRqMWdtY3ZZRkF2?=
 =?utf-8?B?NmpEdTJQVnZDVUxlbTNVRWIwV1hjTWRxQXdMMXNwSE5Oc1R5WGM2LzZiYmZw?=
 =?utf-8?B?RklCQjhiaHAvSHgyRkh6clFibGpDTnNlYk05c25IVCs2WDNJYm5iQVgxY3lO?=
 =?utf-8?B?ajJOTWp6Wk9vTWwrTE9uMXVpN2xLU2pKQm9CaXYyNEZ6UFFzYXQ3dllDQ0tl?=
 =?utf-8?B?RG1sdnRzbFYwRWFEaFlheDFWQ0ZDbk5ISlhiUUFoUlRLMG9rTkhNNExobEI0?=
 =?utf-8?B?N2V1a3psaCt3ZVJWbXNZVWc5c1BCLzBjYzNMMjhWVWFFN0RKNmlpeWxXMy9H?=
 =?utf-8?B?cGJpQkhkanhFN0FUS1JhWE5NUjV3UEpTeko2b1U4Mkh4blV3Ymc2K2EwQmNM?=
 =?utf-8?B?L0pKMkpqQlBwSEJpMHoxRmlvRFRPd2ZDcWx1S3BtMUxydzE2bWozMGxYY0RU?=
 =?utf-8?B?Y0NUZlRPMTlpTi9DeVhOUUFxWVJmSm9iLzduZ1B1Mkt0bEhhZnBEaG41Znph?=
 =?utf-8?B?QlFDYjRpUGpyNUNYRExQU2ZkMlJiN2NkWnlEUzU3TzVGZ3JhWGFtTmsyVE0r?=
 =?utf-8?B?dEVsbE9Jais3S3JtQVE2TWp2RlRHTSt5R1VaT1lrcWk4akVmdG5kS1BCWFRE?=
 =?utf-8?B?bzk2dWZiemtYME0zdXdHbGhCTXdvamlTREQ2TWNlYXhEOE1zSWhUZ0J4Niti?=
 =?utf-8?Q?pd9HLPftmxfQ7axtlLolZQiLRSA/4pRW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWRTY0s5bEdMTGpuMVVuZ2kvK1lVTWx0amxnOFNVSUdHUGN3bUREWExDRVMy?=
 =?utf-8?B?bXduRjkzd0tpQUtHMVA1RGtmdWc0cEFMR2NSaTJWUElYRm1vb0tQb24zY1Av?=
 =?utf-8?B?cmdsTWY2M3hxei9vVmI0eElNS1JxOWtJYVRoM1QzZkxBZVlxdUZUT0d3WlFM?=
 =?utf-8?B?aHVxMGVrWkZzV3dHNTUyeEpBTWcrMzFPMDdERjdPOHZOTERCMnNPMEljeURx?=
 =?utf-8?B?bEV6VnNTc3Z2QzVJNU1vSHdiMm5wNG02ZWRQUmZxNUJlU1NlRFc4OTB3WWRB?=
 =?utf-8?B?dHcySGJvYUJSZXBiRzNaa1dzd0tkV25tSi9USU93Tmk1SEV6bkVBb056cjJ3?=
 =?utf-8?B?b1I3YktzbGd4OW5HaG1LRUNKRkYyS3BHeHlIQ00vSnNnbEtzZmV4RXQydFd6?=
 =?utf-8?B?ZXVWNlplQkNMSTBKc1VrQ3ZDbHpNS3UrM1NlY2xabDlOVTBlMSttMVA0elVZ?=
 =?utf-8?B?OEFQbTJpS1IrNWNlT0w4YTZhenV3ZVdadE1QanQ4dG5lVG5JQm4xUWpSQW5X?=
 =?utf-8?B?VGlkNWdTVGpMRkZ5NkdDaHFZNkk0Q0RyNTFKOGlpZjlWc2lRc1hHcmFIemlG?=
 =?utf-8?B?b1ZzVU1ncmZHZlZZcnhYMHFiaXFQRDNxUklBNlBPMFdtQ1FWSVV5OFdHNnpK?=
 =?utf-8?B?ZzlRWjJOQ005cDNETHVTdlhxQk91RnFmUjZtYndhZGcrdU9kNWtlR2FYdDZW?=
 =?utf-8?B?L0xtWlFURm9YNGNtMG4xUVBra1dGK2dBc3NtdkF2bGluRlJmQ3cyNHFDZWF2?=
 =?utf-8?B?bVhDVDgxYmQvdWJEMVJ4bnlNUUFERUlLQ3NZMnB1TXRseHUwSStoUUZDbVl6?=
 =?utf-8?B?RGpocFp0b0RTR2NOa0p1MmlCTnVKYjB0MlpMWFVxckUrcE1ST2xBSUE2Tnls?=
 =?utf-8?B?alFLekczRUh1MW5QR3dBT2pRd1hPVlQvemhYa1NMSEEzSFZCbVk5endCYmlB?=
 =?utf-8?B?MmhMaGF2NDcvbHNKdEk4cFA4YWhCbzlNRTRlVmZEbGxqUmFZTXVJMEhLalNr?=
 =?utf-8?B?c2NrdnE2MGpMOVR5V3lyWXh5Y2pmajZXa2xFWlkvWENydkdmTnVPVCt4Y3Yr?=
 =?utf-8?B?cUs2NlV2U2dNdVNkM1lucmpubjRGcDNWa0NYWFVDbmI5cEFNU3piclhGVjBh?=
 =?utf-8?B?NVRKbC9IQkFnTHdqdXFZeHpBV1JJeGxleGszeERTR3llUDUwMFhIVWVRQzVP?=
 =?utf-8?B?VEJzWVpYSlQvd0FmcmdJRnpsdi9GaDR5WWwrbDZDTmx4U2lPR0sxUnlOL2xH?=
 =?utf-8?B?UGQ2cE5VV0JIdFQ2YTg2aE8vK2Z5aFpkWE5GMmc1eHVyQlNkeVJKSS90TjRF?=
 =?utf-8?B?WEQzNmQxRUF4czFhU0VYQXZDckswM3Fub0MwdDlreHBBQkViaUZrZzNlQjli?=
 =?utf-8?B?QTBzZ0kwb1JLdUR6NzdJRkp5OWNxUzdwa2N3SzFSNGtINkppcUZ4WWR1N21m?=
 =?utf-8?B?OGYvd015ZlJaVXhXVXpkVjh6a0tkbmJDN1pFeW0xTEJkR0VpTVdMaE13T21V?=
 =?utf-8?B?a2czNGxXUEtFcUd5dmQ5VzFISDZuQm5vVjlHMWxpSlZNL2ZKck9RK2E3MGYr?=
 =?utf-8?B?MG9WY002TFRkZGV2TXQxakxoUDM5VlBtRldDMXVFTThIenBQS2syNGVCblp3?=
 =?utf-8?B?MWF6YXMydFdHMk82ZUlxUzJCQXVOeUlWMXR4UmJvUEE2cTI0T3VWUXVWdkRj?=
 =?utf-8?B?MHFIdGJCM0JLNzBRZEhjRDlDWXNMYXhJVUkwSllHYXU4cXorbEhzQmE1cGRj?=
 =?utf-8?B?ZTB6V3FtKzF2L293Um14aEhYZ3pKRDcwL292RTh4SFY3N0ZnK0FNOGFiV2Fl?=
 =?utf-8?B?RFYwTzJBVW13d2IybVJuQmxPRjJxa0JUcWpiNGR1RnFtb2Y0NTNwdmtqOEFN?=
 =?utf-8?B?VjF6aGxRbU5hZFdBeUNvM0dlcm1QRGFEVVByOXpmNE9zOUlSdkUzVWJNWjRk?=
 =?utf-8?B?RHNoOEU0N3psdE56cUtTQmsxQ3d2NnM1cW85a3Q5c0VJbHVRb3d6b3JpWUN2?=
 =?utf-8?B?dzJJY3NSTDR0NkpiMS9UMDhYTDl5ZG5vdlpFQ1RwZlU3dlFRY0wvY2xLUkRP?=
 =?utf-8?B?cHJlTXNxTjJ5TzdyUlhaaHNVelJmNnhTTmlKN0hneDk2ZTBDbi9ETnBScWw5?=
 =?utf-8?B?cG9YK3RwOWdKY3lBQnBhZjUyVm5RSEdBNG56VG9BV01OZktjOURQcTRjNkhY?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8940c548-83ce-48be-cd7b-08de1310e28d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:20:37.5571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwQRg3t8FQif7S3EjUrKTKkkD2fhXCq/fFCY+l1vtYWqSeXfxH6mzU6Zr+h64wu0VnVhg66JhsJp70OCfveTKO9nylaLVhbAgTCZcwJR960=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9218
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:20:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7827

Hi Antonin,

On 10/24/25 10:19 AM, Antonin Godard wrote:
> Can be used in recipes that want to explicitly skip Ccache support when
> the ccache class is enabled.
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst   | 4 ++++
>   documentation/ref-manual/variables.rst | 5 +++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 4372bbf06..34bc7fed8 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -401,6 +401,10 @@ recipes if the following configuration statements are provided from a
>      ASSUME_PROVIDED += "ccache-native"
>      HOSTTOOLS += "ccache"
>   
> +Recipes can also explicitly disable Ccache support even when the

I think we want to tick-quotes any non-English word? So `Ccache`? C.f. 
Project names in documentation/standards.md.

> +:ref:`ref-classes-ccache` class is enabled, by setting the
> +:term:`CCACHE_DISABLE` variable to "1".
> +
>   Using the :ref:`ref-classes-ccache` class can lead to unexpected side-effects.
>   Using this class is not recommended.
>   
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 3bc666674..63f29575b 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1526,6 +1526,11 @@ system and gives an overview of their function and contents.
>      :term:`CC`
>         The minimal command and arguments used to run the C compiler.
>   
> +   :term:`CCACHE_DISABLE`
> +      When inheriting the :ref:`ref-classes-ccache` class, the
> +      :term:`CCACHE_DISABLE` variable can be set to "1" in a recipe to disable
> +      Ccache support. This is useful when the recipe is known to not support it.
> +

Ditto.

Technically CCACHE_DISABLE is a BitBake boolean, so y, yes, 1 and true 
(uppercase characters normalized for all) would work.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

