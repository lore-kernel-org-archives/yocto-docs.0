Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32FEEB48EE
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 09:40:53 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41859.1770889243532467773
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 01:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DuHnQjAV;
 spf=pass (domain: cherry.de, ip: 52.101.65.14, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3P/nmsStlyWPE41av4e1ibnMwHXXipMKX48y5Pz3mftX9nY5KimqQSAbJpk8oTrSIzqRGngKGqySIhsVDvTpr44NBZrbhK/LLomBkmxgGFxplldHNMOoC5Zsp6KiDYFdG8tx16FGaKfqhtfwutDKND2ES6qL1XCij3tAVu9UQJ88Kpno60B1/DKbHLdVTenO9Nf+WhyXY5U/H40/4m30S5L13eQx+OURMhn6lxRq7pZA1dP+jM5EFRiyONpnLRYxcBTiNtX5WlrhYCttmRyIB06/ex9wAN6+REa5I8mhy2Y3zW4TXLrAvfd9LDucKAObOQ7ivc+l5DOHwnar7dJcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nbzs6sJGAnQW2iq7oBZ0GcYBIImCd9Vg+TPtBuOJi6E=;
 b=fdE0x0XV9kUvSXWSK/7gKdq1WucbgrrEw8cMYkzU6vHooQqzXzDFrcc2mmxeaUXkJq4TLNM1ph5VkpjPAahW6rAcYnlAiPBNMioUO1Yp77ApsMH2XS40Ct6aJg2+d0hV7icdokD7VAVXfT8aVUxxYBFimv0lQZByQUi+jRlkiN31eUv8DJn6TyWMd+bRDDRbsKfX+hsaLA6BOwor+lKxDib8hwiR0NHK1FmlTJmHjBiqPuhj/UB6c17BsLthV33R2D2w86iXsrkafvcJLUOVnHP1tGdvXI6Jv+cXebQfD0iwOGXDOUSPIHa7eie8tx5ibjIQ9MUdHgFMyw1vBcML3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nbzs6sJGAnQW2iq7oBZ0GcYBIImCd9Vg+TPtBuOJi6E=;
 b=DuHnQjAVKACEwaQST9ZysU9y9XiCplMCn3KiKpaPaKsj8L1qci341QxXLS6zxs3PYwjr6sWjIfubJvFhzm5TL1PmC7fLvvtc8tMM0oAfrOrzE2agf35aSILdQhlzX7Ap+nhPBkUSzwZJvnRt2sxE8sPXrDVgunbEnXhuqaB8+T0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBBPR04MB7836.eurprd04.prod.outlook.com (2603:10a6:10:1f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 09:40:39 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 09:40:39 +0000
Message-ID: <5288e4be-8e16-4447-b1fd-94d21aa91c4f@cherry.de>
Date: Thu, 12 Feb 2026 10:39:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] convert SVGs to PDF and PNG using
 sphinxcontrib.rsvgconverter plugin
To: Antonin Godard <antonin.godard@bootlin.com>, foss@0leil.net,
 docs@lists.yoctoproject.org
References: <20260211-fix-make-multi-target-v3-1-1168a6f1525f@cherry.de>
 <DGCUROORFMR0.ZZUIPYYRXZXE@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DGCUROORFMR0.ZZUIPYYRXZXE@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0076.eurprd02.prod.outlook.com
 (2603:10a6:802:14::47) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBBPR04MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: c729d3b7-6108-4e8a-1228-08de6a1ac839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cTQ5TUdsRVREM1B0MzZLVzlHMER4NWF4SXhXS3ptYVJVdi84TEM4TlJZZUtQ?=
 =?utf-8?B?aTVKMitOa0h1OSt1ZklkY1NCYWEyalpEQkRQcVlIRE4zYXpxemJHQ1RMYXRJ?=
 =?utf-8?B?YW9iWmJZZHhyQmtKU3dFR25nZXBOYWcwdVlGenlTQVlOd2RGaFhYdWhqbnEx?=
 =?utf-8?B?Tlo5VjVCTllJbi9QVGE0WWhlUmNXdmZ4T0ozaDBkbWFRL3FkODdQckpiWHlV?=
 =?utf-8?B?bW5xaUgzaHUrTFgwa3p6cHJkdGc3V2s2RENmMWNkZjZ0TGw5d1RrRzBVM29a?=
 =?utf-8?B?QjUwQUtzS2pQeFlydFRieW5zM0RQTEo2SWZCVGpMSUpWUlJuQTh6VzRQdDh0?=
 =?utf-8?B?ajNmRUl6QkRlV21RSTBwSC9kVTdGWHNaWFJVQVNSNTNyQXRZdTVHSGJCWDhp?=
 =?utf-8?B?Qyttb2tVRHZBWWwreW1UV0t1QmxXZDM3bHE1NnExQmtpaWxITjJsdk5laWJa?=
 =?utf-8?B?K2l6bGJ2NW1Ld2FJbXZCZm05S1IwdkkvRzZtelBwVzlla1cyYlJWaU9CS2Ew?=
 =?utf-8?B?Q0VISXpFSEFpems3ODdTcUZsVHdkeHFMY1dYa2NUNWt1UlZnRzdkMDdyUHFU?=
 =?utf-8?B?MHVlSDJ3S1lJM01HY0N0dWxpdjU5WDFQK0dUWGJCbmpWMVJHVGorbzUzdjFD?=
 =?utf-8?B?S2ljdk1vYkRxcHE0aXZqVE4yV0w5c1FPakhvZjhCbW1xWXJYNjFaMTgramhY?=
 =?utf-8?B?WUwwWjE5MGg2blNwRElXajZrVThhL1VhWjlKMEFZeHQ2T3ZVdnRNVUdIY3ND?=
 =?utf-8?B?bGRoQnVWZFZ0NWxqSldjSmZ4U200KzdwSjg2eWNJVDFabHZBN28yZGowZ1VM?=
 =?utf-8?B?SXFweGgvaENiUUl4QXZyWU5yYjNjQUVGRm9sS0ZEOU9wQmE0S2k4YnVxd1Vo?=
 =?utf-8?B?MUlTL0FKWitmWVRzTkk4UUtLV2V6VE1yY0ZuOGxPYW9NYlRxS0RzMmhyODdM?=
 =?utf-8?B?eGFiM0FVYzZwYVRJME0wVnZpZHpnbFRKYjEydTJpaEVqRXRidGpOZVQyWWMw?=
 =?utf-8?B?SjdwL2FxR3puTHNHVnNZYUZDdnNTY091QVpNOGJLUjVVdHF3TEZzSjhZelIy?=
 =?utf-8?B?YUk0Rm5Xam4xd3RRekMyamd5bU1PbW0zclhJQWdLYjRXbUQxOEZVMFZLeS9k?=
 =?utf-8?B?eDlaeHVaSHZkSmVNUEN0L3BjeHl4VmhNNXVQbisvRENLd2JvQVZrUHFNT0w3?=
 =?utf-8?B?WWUzYWpoMVhXcFlwY3RKdE1tb3c0aWFCT1JCZ3hXY3ZXblZTWXpPRzQwL1ZF?=
 =?utf-8?B?T3l0djV6emZHMmxMUGM4b2VKUDVieUY2UWlnWnJma2NWcmRXUFIxT1EvejJm?=
 =?utf-8?B?WUpoUHVEOURVNlAybnV0UVhFNGVEMVkwRUdFdi9KNytWWEhIMk8rN25nWSt6?=
 =?utf-8?B?ajBwclEzOFVFVXpSTXZiNDAwQmUxNWVCRG14QklmUWhaeHJnc2d3b1RrMnR2?=
 =?utf-8?B?cDNJTlJSZXlSWlJvN1AxdG8yTkQ5RjZJam9lZnN6V2NqMDRsbTRtYytLVHgr?=
 =?utf-8?B?NFJwcytRQzBobWp5TFZIaFg3ZEt4U2hqOEFGTnY3djRjUFNOQTZmeGF2Ylps?=
 =?utf-8?B?K0gxZEVkUExzVFBKbHhMOU1pZUNIV3M3VExmbjVmTFV2Y0Jvbm9WTTlzVFNh?=
 =?utf-8?B?eWlXYkw0a2ZCWWlTVjg2ZVcvSG1tbHJOTjFEY001bkJyMzRwVGJjbGVjVFlM?=
 =?utf-8?B?L21HQW5rMHUra1g5Y25aanBDTTlJeHgzQURCQjc5bWsrV0hxSEZEdG9mQ21T?=
 =?utf-8?B?RlRadWlWYWJJaVNQbGJYUUdoczZSMGlxQlNIQlV3YWtkVU9DUjAwbEpnbHJy?=
 =?utf-8?B?bDhDbzZ2cjA0Rk1LT0c1SjJhTjVEN2d1SFhEbHdSSVJ4Sk92NTQ5TFFyWnJp?=
 =?utf-8?B?M29XUGNMTnVocTBDVW5kZ21QenZHbzZRMG1PWjJzU0JJWFJNRUsrOXREaHI4?=
 =?utf-8?B?MC91UDdRNEFrL09kVW9OOWVOY1lSUVUxZEE1RElMcE9NeDJaWGluaEtuZHdI?=
 =?utf-8?B?S3NMNFQ2OGk4RDhqZWVXY2NwcTF4RkdGbWcrSXdGK2hlQ2VCeEZOZWRoZHlt?=
 =?utf-8?B?Q2VkMjFMSWJoQjVNK091TzdBRENJQ014UW9HZTZJakFlVlBYUkxTVlZIUW1h?=
 =?utf-8?Q?BTjQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TExGUHlRZ0gyVnJLYVQ3bXNReWNrdVpYbXBtU21sN1E2dHBXUEdHUkFKSW1v?=
 =?utf-8?B?R2YwbnU5NEhOTXVUZEg1dU9ESVlxM3AzZmJub21LMjFjZHIycmdlcmNibmJw?=
 =?utf-8?B?cVJBdzVzeUlhL0xxRHlzejFqTytmR0FjQThuTjROMHhoOTlpRmRaY2Y2RGJL?=
 =?utf-8?B?dnkwOUgybnl3MFJ6WlZjTk5VTVhXaTdwS3RlUFAzVWRoK201NUN3KzZsUklY?=
 =?utf-8?B?dDhJcWRDTWtOVFkzb29NRnNNZXdqWnBaK1FNejNPNUJScU9EdUxYUVhUSTI5?=
 =?utf-8?B?M05XeWNsUW45QkVWbjdFWUxKVmJ0MTRGcVNPR2g1QzI1bW43NHk1WG1GcDZs?=
 =?utf-8?B?L1hTTmppNzVrdzdXYU5rRnFQV0tTNGl2WHVLRlRxWU8xUUZEbi85ZXNRdDgx?=
 =?utf-8?B?RzlyL2Yrc2FveHJ3MXN6Um13Um5CODN1eHJlaVNxQ0hZb2p6VzhGYi9RNUx0?=
 =?utf-8?B?Z1BwaG9ueGEyS1pZQ2xTZkxrakZoNGFsVVpFWEhWTFU4MEhNL0JvbDJWeklW?=
 =?utf-8?B?Z3VUb3dWaUY3QVljZlNvRm4zUndJSTVjS29uWFNQVWVSYW5oZ0JOWGZ1SG9k?=
 =?utf-8?B?Vi9IUWx4ZlA1ZzBJMHNxM3R2NVExbWhwYlVCZk1HNlAyMzV0eW5OUWpESUVS?=
 =?utf-8?B?K0hUbnpQZXg4alRRb0QyWGNkL293MWJzcDMvbVFHV0F3WkxrM3FjaXN3Y3dl?=
 =?utf-8?B?eDNCRzBxVnlFTjV2eU1PTXgyWVlIL1RLZ2NJZXVpYXFFNUtVNXpnL3U0d283?=
 =?utf-8?B?OTFhSi9vSmRGQmU3QzNGREZBZW5IbjM1cXdCeTlNQXZ0Wnc4bFQ1bldHbDVK?=
 =?utf-8?B?V3ZMdXlUSTcxZ2NtUU0xV2E4RnlnTmVkRkMzWTFhSkVIc0g0VzlCVTFucHdC?=
 =?utf-8?B?N3YvbThBSE94Z3QzclhqLzdZT0tNVXIrRHhZSlFFUDRhT2E3aW1oUGdnQ3NH?=
 =?utf-8?B?NnpkVkRxdmZ2ZVoyYlNKQ05vaWsza3FXSW9zdmROUk54SFdIb0s0YmFQZlBh?=
 =?utf-8?B?VjV6T3E2VFlsWXR5V2ljUVNMR2FiMFErRUg0SDNsb24vNkpic2NRYnVnN2Uv?=
 =?utf-8?B?RS9yWTA0WnN0eHc5K3dpQ29pTnR3ci9aeTA4djFicWwyTG5ueFBXR010WWxh?=
 =?utf-8?B?MUVCMUFFS05tVHloNnByckVrT0haNW9LT1NONDBUN1AydURxbGhma1BJRXNa?=
 =?utf-8?B?UjZKcjFwVk96RE5obHljOFcvbGFwU2wrWFpMRnE4Y1BqWXJuWHNiM25HNklV?=
 =?utf-8?B?VXFLMEozdUF0K0I5dFNIYTk4cmF0alpKMnYwZENVQnBOKy93UGZGR0EvT245?=
 =?utf-8?B?SmJVMXVVU2EyNWRzV2d2VlpWTURJY3lkaERNM29ySWxYbk5kRWM1MnByR2ZK?=
 =?utf-8?B?WGVZTzlvOUFPOVo2RldBbG5tVk55dm5KT1ZYbWtZWkh0eXZ6WWpxQ0FhSVJX?=
 =?utf-8?B?SzRDMWtRUVNrQk0wZGNrVEhPVnpuNkh0SURocFZ2MVRvZUFvTUNrRWhCZHBv?=
 =?utf-8?B?RVdVMEkyWDdlZW1FSmYyMk41bFlQQXlVRktqMzRra25sRGVjcEpBTlVTYmJS?=
 =?utf-8?B?enk1WFF1bVd3dXRwSW03ZVk2UkNPMWlXN3FqZUQ2RmNQZVlMcVh6ZVUva0V3?=
 =?utf-8?B?dE9wSzdxRUhFYnY2cUxVL3gxSXRHbDd2NWFXVnZVWmJqSXhUY2FuYk82aVBY?=
 =?utf-8?B?Q25UZzhJZlpSVWRhTHYrL1B1OXY3Rms1eTBmd1NqZVBlNXc2YjFSajk0NlVL?=
 =?utf-8?B?a3FRMGRMSUxlWkNxZGxoazFyOFdUTHQ2Y1dVUFJ0RXp3VUpOTXZWYjlQODhS?=
 =?utf-8?B?Wlk4emQ1SmRhcUZMaklsK2Q4ZXRDblBML3k3U0JQbzBKNk1Fei9DOTVHaTlN?=
 =?utf-8?B?bksyNHVYRnN3cGF0Z2t3TnY3UWNwaUVZOWkvTEgwanUzNnIxYysxMXRGYThD?=
 =?utf-8?B?SENIWmc3YmphN1A5Sm1GWjAvSW93WHJSN0JsR2NhWEZ1ZzVWK1hLeG51b3Rz?=
 =?utf-8?B?cnlFUjZmUS9WRnhsdURLNG1ncDY3T3kxWElIaGR6dndHbGZ6S3phaU5BOUNu?=
 =?utf-8?B?N3VxUGxnd0l0U0ZyMXphQ09MRXA0SUU1WlppSDNCQnY0Q2R0SkpBTlBiaUpy?=
 =?utf-8?B?RnZZSkJEM0d4aHN6azhoTUJkWU5PVHRKUVB5cnpCQWRuMm9XQi8zd3FEMXA1?=
 =?utf-8?B?MDJMT2VyZlR3SjN2RlNwbm45bEVVRUdzWkNRQ3dUWG5PQll5RjV0Wkc1Tm0z?=
 =?utf-8?B?Rnp3RFpOcXB5NjdkcVEzclh1VC9USjU4OTNNbkVYa1JjTGF4VHRvVkhvbXI3?=
 =?utf-8?B?V2duN0VYRTJDbFFQZVlCR3VnQ1dUNTJJYkpBOGdab3NuQkFkN1g3bW1XelJn?=
 =?utf-8?Q?BDuMaXHsfYslwlBK6sfImOSS4C6R0mTuMa5qJ?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c729d3b7-6108-4e8a-1228-08de6a1ac839
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 09:40:39.5418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QU0I4s+ra19QV7pJTdAkQXoMC3opfqrx/z/sMIp0Eh4WmcENba4KtDGdqIOZA8W5x42/gAX1MDENR0S9Jk00yHWRstbe0+4ZrhUko0qPo3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7836
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 09:40:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8903

Hi Antonin,

On 2/12/26 9:50 AM, Antonin Godard wrote:
> Hi,
> 
> On Wed Feb 11, 2026 at 4:25 PM CET, Quentin Schulz via lists.yoctoproject.org wrote:
> [...]
>> diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/documentation/tools/host_packages_scripts/pip3_docs.sh
>> index 907ecec55..3e4045e7e 100644
>> --- a/documentation/tools/host_packages_scripts/pip3_docs.sh
>> +++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
>> @@ -1 +1 @@
>> -sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton
>> +sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton 'sphinxcontrib-svg2pdfconverter>=2.0.0'
> 
> pip3_docs.sh is not used for ubuntu and debian, meaning we need to find the

Woopsies.

> equivalent package to add to
> documentation/tools/host_packages_scripts/ubuntu_docs.sh, or write a custom

There's none as far as I could tell and even if there was one, unlikely 
to be 2.0.0 for all Debian/Ubuntu versions as they are generally pretty 
conservative with upgrades and this was a recent one.

> pip3_docs.sh file for ubuntu/debian.
> 
> Or drop the ubuntu_docs.sh file and use pip3_docs.sh for ubuntu/debian, which
> would make this kind of mistakes unlikely to happen. What do you think?
> 

I don't mind either way. Makes it easier to maintain if all use the same 
packages from pip is my opinion.

What would you prefer?

Cheers,
Quentin

