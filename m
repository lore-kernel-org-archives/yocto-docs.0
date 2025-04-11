Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B53C369AE
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 13:34:31 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.67])
 by mx.groups.io with SMTP id smtpd.web11.26110.1744378462970881422
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 06:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=A1YAk16q;
 spf=pass (domain: cherry.de, ip: 40.107.105.67, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASPltFRLZpEMD3j1kavWU2NEyKkFMt4SODgF/qB8TMLMxPuboNVSrm+jRLKz+aRZXwcInfeI9xfafd5Uf08A9b8SzmzEYM8LZ+j/fkWHKYftKse6kCuEYCynYMPh/crzzkh+TOMB+5B28lS1hhuo3a7vo+/DowKhEvpmml7GINaDKlTWea6iKTTglY4wWkzS1+IP9mC9DPMqpe2a40YS/2fLGDZ9f3hludDJVDMMn/s1pSemC9R6uydHnmo8Ug1JnTqplYOBPDLra4oqgaMCcZDAW0XszOLRPkYYxjPJjV3cFhsKpRI0HGVyvvpVzVaNQjoAtkoRWC163MaTSA9ftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tc0RWDZiN6hf6p4R0XHLkuxxhfsoFe7cc9VbdpOU/Tc=;
 b=WBRg3NMe5yus1svrUM+x5ske1OLLZGBseTYnXMz+p31YdkLeSLFCH/FiuNXDchM8l1MjWWhrXWKC9hxCnNBcUER4XSMmEbOOQHZpUVUMKZJOJF4TLRnWgySNDNWqgvIorWlw8bDh8CkKkZHVW8O7cqqBirQIe4PCx2R2yCODEUB2P3g+eqpnXZUTQq5zsdwguOQbhTqXZxDney7/OCszRcebswaV46ufIcTVRWr3T86/3JyUwv0qZc8MAHveeMTtGhghC6X9T9EKPy7VxEiM5sj3ppM6E6okqt0kHVjMedyo5ieZIuCNHB4H3oCHcAL2IkBVvWkppL+diKAyJl2Z0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tc0RWDZiN6hf6p4R0XHLkuxxhfsoFe7cc9VbdpOU/Tc=;
 b=A1YAk16qBqE1ue3noygMwzld/fO/PYZcbbh6EeFiv8MuAxVlC3cRmKQ8k3N8GDuFNQLx/m9PBgXuZ/mOo/zzlQNgDlNZaZ4h40i721HpdPMGgb9yNsM7rGM+jOPeljBdFtjP5fnngWqHB5+Lzy9SCct1Z2nRx4GWmUJuXlBOweU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA2PR04MB10472.eurprd04.prod.outlook.com (2603:10a6:102:414::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.39; Fri, 11 Apr
 2025 13:34:19 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 13:34:19 +0000
Message-ID: <7c3a9d69-cea0-40cb-9cc7-dd236b51369f@cherry.de>
Date: Fri, 11 Apr 2025 15:34:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] test-manual/intro: remove Buildbot version used
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250411-ab-remove-buildbot-ver-v1-1-77bfbf35b460@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250411-ab-remove-buildbot-ver-v1-1-77bfbf35b460@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA2PR04MB10472:EE_
X-MS-Office365-Filtering-Correlation-Id: 83dc9704-048f-498f-c505-08dd78fd8f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UlBYbzYvM2VUUDk0OGlqc1U5bzhPMDN1U0pVT0RId1dzOTJRZkpiTDJZR3NS?=
 =?utf-8?B?aTZURzArQXBNQ1ZZS0dlMEFYSDhtbmVZMlJ0bTdJUkt5anNxSTY2NUY0cXIv?=
 =?utf-8?B?R3hXZ3V1K3NZTW1CY3k0QjZYeEtCVjMxaGd3K1RVbm5CNDVzUjFLWW1jUi9B?=
 =?utf-8?B?YU5wVVdkUEpUTU1IVGREbmRvc0JTQ09jb2RxWWREaUxXdTQ5QzZ6MG83TVg0?=
 =?utf-8?B?SUxweWxtM3RBa2N5YTdJYzlrQTZCTnRFY3EySEYweS9ZOGdYK3dtQXl0WEpm?=
 =?utf-8?B?dFN2M2VlQmZkZnhISy9HeHNTWHpWbllReG1WQ0IxTHc4T0FNUGVUcHljYStY?=
 =?utf-8?B?ZEJBR21DeGtCTTh6MWNRV1pMaHVLMTlWc0wxNUsyRkxDUEVpNnlpd1A4andE?=
 =?utf-8?B?ekVFV2FEWFZpeUVaa2tXZHVhcnQ3cDdlTGpkd3JOVXdLbURZTGRUT2c4Z0ty?=
 =?utf-8?B?MUhBWUFPaDdGT2QxTjRicjNuakNnK0VRMXYzS3hFL1h4VHUrN2xzaFVUYkNO?=
 =?utf-8?B?anhsbmc0UU9sMUJRZzd0ZVNKNmJnWXZjWnY1Si8wK0EyYi8zd3MxYlpMSU90?=
 =?utf-8?B?Y256T3MxZ0xtQmtVMlBuK1c1dmk0Qy9YU2NKeFl1Z0ZuQVYvTDI5bjRNVlNX?=
 =?utf-8?B?OUFxNFJRRnZXVlUwdm8yTllDcDQ4dzBCT0grSnRHdkdIdVVidHZxcXIxdkZr?=
 =?utf-8?B?ZmJzYWQ3YXdJQjhKaytPc0lqNUowSlRDMnJvVUc4NWFWMVZrOW5zaFFYRWZT?=
 =?utf-8?B?dlBGWG1nbjZPTlNlTHVNbXVPZndEeDNZZUdhaWRVY1pBSXVHc3FDdnE2U1Iy?=
 =?utf-8?B?THpGaGlKNGIxTkJydXF0TkVqUXRxVTNPakIvMExBanlpKytPWWV0bXpISDlC?=
 =?utf-8?B?ZzFnam5nd2lTN24rNVlUeXFLNWRid3ZPWHN4U3lkaWN2YU9TWGRLYWs2SGN5?=
 =?utf-8?B?VXU5ajlXaWJTMlR3NjMwbnFzSEtUVS9mdllXWHlDOU01OWNYRnYwSHpkTTJ6?=
 =?utf-8?B?eXZ0MTc3b2pydVF0WFhRMzZ5L2NYbE1FeTlWRUFOWFV3OStVa0w5eU9ybUZz?=
 =?utf-8?B?MkVBQ1BtdjRmYVY4NG4xK2Q2OWdRMzlzUWoranhyd053RlN6dnZzTkd3Wjc2?=
 =?utf-8?B?eXVxRGlXakRaNWFZaUhUMHA3bnNBQjZaZWYybmVKanhSRDhEdFZ4OERzc25t?=
 =?utf-8?B?UzFCdDVXdXd0N3ZxN3kxVFNoVlNCaWFHeVZZcTNQZ3d4ZTRCa0pGbFkydzdQ?=
 =?utf-8?B?ZjNpTklRNk9sYnVTTjVuUVAxdFBDU3FIbndITmNzdmpBdGQ2TFh2Vm5HNEVi?=
 =?utf-8?B?eWRNVFl2VXJQdjk4dXBxWjdaWTJRR1grYjM4Z1NaVXBUWnVhVSswUndSN2pS?=
 =?utf-8?B?K0llaFdlbjB2OElMWWFPanZnVUdDbmR1RERWZ0hLWU1WVnZRMTZtMFFQcllU?=
 =?utf-8?B?c0xoYnpDSktQQ282NEF0ZEdRcUxaYkFnbExKUWlLTTdEY1ZRSjFhQzdTTTlR?=
 =?utf-8?B?ODZmdUdzZUJVYitJZlltQ3o1cWF4SXRTQXM3dXpMTkFtRXZLR3VLUkIveW51?=
 =?utf-8?B?dGJnUkg3VE9HOW1MdnFFeUgyWUkxcjBlQ0NzLzJ6QjVQR2hEWEdmV2drRVdr?=
 =?utf-8?B?ZmR2RTIxbXhDQUQzMnI0RXpkWUZTVVJqMUIrYlZmZk9qYytJYkNlK3YxVTQv?=
 =?utf-8?B?cWFaYTJTR3VBeDhJOVFGbGVxZUdKakIza054ZVh6UWw2UnU0b05IaUJEMWhN?=
 =?utf-8?B?Z01RRGRPUFVEeXdxcUU5eXg0VHkrY3ZSUDM1TzVJRVJ1Ukt6M2s1NnlaUjhE?=
 =?utf-8?B?aHdwYWl2by85WGxPNzhnK29vVGhJMmVUVTkyWXpiWEhiMWRmYXJZRitQdUZY?=
 =?utf-8?B?ZHZvbmQwSXM4ZnhJNmZMU0txeFVWZUY1MjZrQ2JhUFFnQWJXOWVZZVBhVW1W?=
 =?utf-8?Q?KFkJHpUBMgg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eGdsWDQ5NEkrMzExUTRTdUp6bDBhVmtEYTZ3elVjbE44bDNBQlY4TlFXQTJ5?=
 =?utf-8?B?MWxtMnFYN0JRcU9hSmxZY21Mb0pEZWlNMm5YWklLYjdNc0VRbTdxLzBDVHZp?=
 =?utf-8?B?c1ZZNE9sYXZRY3JXNTczT1NsNjJ0SjRaZzA5VERiZ3BKMlQ0TTFxZHBiYnpa?=
 =?utf-8?B?Vzl6VVNDMEk3Qzg2YUdmeVY1YUVybEkwMS95Tk9SR2NlWERSTU5RVVhZcUdy?=
 =?utf-8?B?dG41d0pkU29vNEpxM2RyQU40WGhQd3c0a1NZUHIxUzUvc0xLYy9DSWdmVGxa?=
 =?utf-8?B?azdiSDVoekZHOWdOYkJHamxVSEVtc1VIbVdaN3NjTGdPYlNmZHByYVN3YW4w?=
 =?utf-8?B?VE14Zkgrbk12bnE3YzU3cEZ1MlAvbU0rR21PUEYzaXZEVjIxOXNKNDV0R2M3?=
 =?utf-8?B?b1FaNEZselV2ekJORWtsdEJUNnhXTUNFU1U3cXJvcXNqejYzSGJiTkJDTDhz?=
 =?utf-8?B?RkNFclg0UFRsZno3NzB5OTRLUUJoYXRGYnpRNU4xUnllazhjOVJTTzViamdN?=
 =?utf-8?B?SExLWWwycmJmeVB0aEtrZ1p2RkF6QmQwMm03eis1Q01KVDlJMGlrVVJuSEtE?=
 =?utf-8?B?dGp4alZHTkYzUEtLekdnUFV3SXhtUlNXOW0rMWRWYmovUmIxOWhyYjlDQmZU?=
 =?utf-8?B?QWdXZnhpd0xYbFdWMXRySmNrSUhtMzJLRVR0RmFkd000QStPZ1NtVDNwelNz?=
 =?utf-8?B?ekFXcW1TbGcwTVIxcG1URnluZjlWSXFxZmFIQlV4MC95Y1k0UHAxZDcwSzlH?=
 =?utf-8?B?ZlJEQ2JYSkJTckJzTjJ4dHFvdDJPM21Fc3RiTEJHbVJhUXNWbm9HMFNlUEpT?=
 =?utf-8?B?Z3NXRXI3T3hza0NRM3c3RHFHcVVDQ2JxTGVJZkxTdnRPRGpPNWVDQkdmdkN2?=
 =?utf-8?B?N0tNbDVob0xwY2JhSFJnVE5IQ3ZOUjRUc1pudmN2YTRWSDhYWVBMUW9wak9D?=
 =?utf-8?B?NEY1ejh2R0swQy9UczNHeHpVTUI5T05uSTQydlZzSk03SExFYWljUUErY0Yv?=
 =?utf-8?B?Q09nV3BhZGNDcUJlMjlxVUFwSGsvVEE4Vzh2elU3emJZVmo0K05EUm56Si9Y?=
 =?utf-8?B?ejVxdWM1Rnl0ekJWYVh4K3FidExrNHVLZWw3azd0dzAxOHBETlJRcExsbnd6?=
 =?utf-8?B?SGFDN1Rvdjh2bEw5bURoUXIwYjdtTGJDMXNER05vWmRsTDVpbzMwbjk4a1M2?=
 =?utf-8?B?MTMwTVpKUWM0ZjcydkZsWnlRelJ4WmNML2ZpSTZjMytOS2RQUjNXZEZKTmNK?=
 =?utf-8?B?TXBMWWx0MlhsSFpWNk1Sbmo4U1BTU3Ewak55YUV2M0hscnhoODVRSmo2ckQx?=
 =?utf-8?B?cWF1dkVkU3EvejlpeEpGazBhUFBPSDY5Ylpvb0Q1TXJGNnp0clpGVE9IQzdD?=
 =?utf-8?B?bThBa215cFBtbWtjQnFkZ0tvMjRkQzlIdFhzOWtJcTY2TE9vbkJqMzZUM05M?=
 =?utf-8?B?NXJOenJQQm9qM0pFaTVyUklmTkp6R3dVbTVndmVncEkyNUFMR3kzMVhGUU1s?=
 =?utf-8?B?OEFSclBTS2U1SDF0VHQ5OFZRSlhRanRLazFIMSs0ZzIxUWtDM09iYklnZ2p0?=
 =?utf-8?B?REZPS3FwQTR5Qjd1OG8xUmZ3dUpXN3FvaWFyanhxTTh4cmtha1ExRDU3SVZE?=
 =?utf-8?B?dUxMcy9RWVVlR2VzVUx1STYzTnBGVVpZeUU3NE1PclBELzUxNHcwOTFQR3lz?=
 =?utf-8?B?eUlqRDYzd0RsKy9zRnc3blhzUEhpTGJ5QW9QUkZmdGRXN3V5WGsvcWZybVdk?=
 =?utf-8?B?ZmlITFpSTURucHcvQU9UNTQ3TFhtWnAvN1lBTXZCWVNpcDVtUFEyVlJyQzhH?=
 =?utf-8?B?blpuQlJXelFvM1dmWVhaa3BDYWIwY0tEUGFvaytMbnY3T2tHNlpjWjZ2ejRY?=
 =?utf-8?B?NzJDVUlERVJDRk5QZ3pUeStsWmdrb3pmc1RuVjVxNXlvWTVnN1FHci9SUEpo?=
 =?utf-8?B?TTc5djZ6Vlp5TTF4WDRhNndwWTkzVXRjNGNkMWE4VTRvcTJ2LytXajE2V3lV?=
 =?utf-8?B?eFBOUjRtY0VQdnJBZWxFekNvQ3VINmlyQWorRnpaaGkyWFpiRENNNjR2aEM0?=
 =?utf-8?B?R0NjZk40RHVROVVjb0NwdkpGcnJjOFJvYlFHVG1ubUhFNGszRUQ5bkd2RXdr?=
 =?utf-8?B?ZDhEenA1TlFKbk9mcWh4dDNyNnI0ckRhL0NtVWtzb09LU290Tm9ySkZWVFZJ?=
 =?utf-8?B?MEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 83dc9704-048f-498f-c505-08dd78fd8f84
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:34:18.9114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTPtT6bc0LU7+X+ZZj+CRi7PIyAAemQ+DzSChhzHHombE/WPedBvJuKFMBlSHadGLGy8w+kaQdD4yU2uiVjAlLvlCpg2OleK96Xa/ZEDlk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10472
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Apr 2025 13:34:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6734

Hi Antonin,

On 4/11/25 3:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The version has changed now (3.10.12 as of writing). Avoid having to
> maintain this information by removing the version info from the intro.
> Also fix a typo ("uses now uses") and give a link to yocto-autobuilder2.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

