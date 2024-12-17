Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85692E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 13:16:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web11.81272.1734441362373851618
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 05:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Tt5v0EJW;
 spf=pass (domain: cherry.de, ip: 40.107.20.73, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIaQi3MI8avojY3TG4q6cLblWtYmDhqyGrY9BkOP2xb65ViCWu6lkH33UJk2CotAvb405aMUhStCYjyybXHNxO529w0kjvkgOxtlBpKwHnrflzkJh+pWPIo+5UgEQEjCy/WP8i74uEbD3wVNe/KT8XENQlx3zFJfbBqPYn3Z4Y6a9k36d4JcXXxipi8F9nZ2tsU0STF9gDJCQ/xhZUfQvWdXc98+9+yHU0Pa7C+Hc0yymQaeOkxLjL6fjMQnu8CPQy38WWHXXe8gaWikhk7JFdQ3PNei/e9/g5UIMgUAlwrBerGY3wa3MxsxUkkDfnrPvg/XVHoV5mTTOY+pm++HXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L24wpOvXrYh7wxj24M/ntzRjoXjEE1Kpw4vGeTGdHYA=;
 b=B84xTY5B533dltjX6KBL3VTZlKz269R5zYHACUVEAoBr3NPnq9HJitPB/+JqUq7Z5nl7Ol+8FQ4+u6c7pcua0fuoBYe/8h2fHlB9Qh9YfdwZBmOFHJPPW6SZBb/qHf12XXGF8k7wcOEitWWuEHNjtkkddwI+0DmwX8gvke2CSBBfJKlt7/BIJWksYuy2Y4QUKmwfuqOKRmbCOoWtTrK5jUFacJVeW83e+Ji5ru4ryWZ0LkkRSRZ+kE/GoRxwtwA2bKpNL1Ib03jl/csSYFEHXLFLpogE9jwwODTh5BuKvhtIC/omPh+qGCbe8NFld5juw+1r+KcVWFEkD6VBP/GrHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L24wpOvXrYh7wxj24M/ntzRjoXjEE1Kpw4vGeTGdHYA=;
 b=Tt5v0EJWGuEW+qZFu4p1zNu/aSLRfAG0vk3e0fX0ypBm51t++aIXla9fzq6F0j4Z3EIN+zl9oGcrTySo+JHmPD5jGIweRe6B73+1tjKRshdnZR0VBtCDhrArpSlWa5+DcNErH0FVmw4/TFTPaB1NWzPP6a8ebzQLbkigzkv7oNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8660.eurprd04.prod.outlook.com (2603:10a6:20b:42b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 13:15:59 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 13:15:59 +0000
Message-ID: <75812c42-5f7c-453e-bb15-bab6aa17af8f@cherry.de>
Date: Tue, 17 Dec 2024 14:15:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH RFC 1/2] docs: use literalinclude for system
 requirements
To: Antonin Godard <antonin.godard@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20241210-instructions-shell-container-v1-0-6a7cdc404ff4@cherry.de>
 <20241210-instructions-shell-container-v1-1-6a7cdc404ff4@cherry.de>
 <D6DWNEOPVATF.2H2X15PIOPKK1@bootlin.com>
 <e016927a-2ff7-4368-8681-80087b151b81@cherry.de>
 <D6E00ZEVPTN2.37CTW3RPCEHZ2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D6E00ZEVPTN2.37CTW3RPCEHZ2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: d9910323-8a88-4f8e-dfd7-08dd1e9cf294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MUlUT3UyYlBrRFh2eEZaalpjcktJUXY4czRtbkdDcyt6b1MyYXUzMnVlSk01?=
 =?utf-8?B?R1Q3U1hTYm1PTGpTaWZFbGN2OUdkQWN1dXlGdEwrc2pQdXpwV01BRHg0YXpB?=
 =?utf-8?B?VmduTzgvc3gzZWxjS1AyaWNvUnh2Ty9sT253U0t1TmlBTWxIK0hmR09VK094?=
 =?utf-8?B?MWhORlAyVlZtTjh3WE9TekdVZlcxN2x6OXdCdVEyZE53NHlhRExWbnZuSkxX?=
 =?utf-8?B?dXo2ZDhwN1ZiTkZMZDRuNUIwTTZvWURVcUhHckdCUzNZMUttSlI4akVxMS9k?=
 =?utf-8?B?MFg1bzFRenI4dUNPQUxUVjUxOE1Sd0tVU2FUTFpXUFRGV3pNT3V1eVpUSzBG?=
 =?utf-8?B?ZXpMdjhEWnZvVjBJWkJXaWlDUlN3RVFFRGN2VGVrZm4wN0VjaC83Z1BBTmI1?=
 =?utf-8?B?dTB5OWdPV2c3eXlHKy9DK2ErVHBXZHRFdmZHYktVZ1VoT0xWR3FDNytWT2tC?=
 =?utf-8?B?WXh5OUI3ZFl2bGZwNjh6MGNGY2k2UFdlRkorYWNHYzRpREZCSUNGYXJIS3hD?=
 =?utf-8?B?N1lxMGd5OHgwZGsrSEVqZmdjMjMyQlJId052TkNHSS8ySXc1dnNuRElwUFJl?=
 =?utf-8?B?VHM0S2xKZXdob3FIcW92cWVuNmNMZFBVaUt3cFE1ZXZJV05ueXlvU21LcU1p?=
 =?utf-8?B?TVFpMmRhNXFKQWRvZTI3aytiWjdqQS9JMEpIbWYyQ2ZyVjNPSmxCallBaXZV?=
 =?utf-8?B?Ui9DSUNFU1VLdzhSM0pRR0cxd3pQMHNNMnpXSVNTNzZMbUpRRnQxYTc1aDZV?=
 =?utf-8?B?YU9JR1VWYUlHQk43VVYrb1dZbmx4N3hOTEdxaVpUTk5GbFAvWlF1RnppUGlm?=
 =?utf-8?B?ZEpyRTZwNWk1VnpUWC9rcVpuTzJyU3pDUW13T1lUVzc2RlNCT2pwMUtvek83?=
 =?utf-8?B?ZXkrOUc2Sm1EWnkzL3lRWndUbFBoRXQ4YW9Wdi83SVgyTTVEd2dnVFhEaVhk?=
 =?utf-8?B?UDhaYTlhVGVBWUEvdU1adVZqTllLWW1HSHZUZ3huZ2dSV0kzcXNURlZYeFlj?=
 =?utf-8?B?SzJibEcrY1hGRmpIdGlkZXJZUjByZkU0SWxlemxveW4xZmh5ZDhjb2JDa0VH?=
 =?utf-8?B?SjlUdm9iUkUxWldNbXdRdmJUbFdFRUdSa05DcWJkekhQbUx2dnRuNmFxUGtI?=
 =?utf-8?B?R1AraUxnaFJXUVVOalZrZFRiaDRIQ2pVMytMaE9hT1BMck9SV2tiZ3RHYUNt?=
 =?utf-8?B?RklhUXdaemQvL2FuOXJ3ZzBSdXdaRHEwMk9yU01uUEliOU1jVkFLUmR2bXRI?=
 =?utf-8?B?c1k4SjNldEZWZTFRSmlVWk9TRkZXOWNEcWkvM0R0c0lEc1lNUStuY0F0OWZt?=
 =?utf-8?B?YmNXNHVST25UMUxxc01CNFRvNlA0NXYraU9oY1I0WnpoVTl5Wjg0dXlBTUw3?=
 =?utf-8?B?Z1BmTEJJd2ptKzM1Z3daUG5PWFdlQmhzdXhDb3pLODhPc3JvcGc1dFJsaVYr?=
 =?utf-8?B?VEF1Zk1kVU03cUFCVStRSVdHTnFuQ2dWelQ4VXJsRUxLYkx3Zm5xekZodG1w?=
 =?utf-8?B?VzRTY1JzMnIyY3lzWXpsNVpYSitTanNaeG0vYlNRM0hjSEw2YzltWnRHQSt4?=
 =?utf-8?B?LzI2NWEvMUpXU252amZCU2E0MzBWdkVEYnBGd1pYYnQwRnlmeWorQlpnS00v?=
 =?utf-8?B?NnhJOVlYNEx3dCttaDF3MG5DQ0p2NjlHWDlXb3BIcjJIVXFmaUYrb01mTjJN?=
 =?utf-8?B?YWRJcFJwbWFvcHZWc1NCeFNMVGFobDhqdEVWVnp2SzVNTUlwK1dJTmk4ME9x?=
 =?utf-8?B?bkdoeVdYMEV3MGNXSWlnaFU2d043SWZMMkxvUjA5L3lYbTlpbGdnTWdvWXhO?=
 =?utf-8?B?ZXcyQ0orUGNYWXhNUW9NYXFrNEk1Vm1BR2hIM3hzYm5VcGptemZTWHR0Mkps?=
 =?utf-8?Q?g+X4TNhetp0JR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OUZqMmpvOWFubG9DWlNSVWxrdGFheGNtS0dLZzI2dldvaFpPaG9QckY4L3JW?=
 =?utf-8?B?dGt0cnJBcjBYL1RHenY0UlFVWk9oNWgrM0xOdUNVS0xmN3pGODVkTHR2QndQ?=
 =?utf-8?B?TTNCS2V0VG5mWTl4UzNvOFdFb25SQTdIRmx2RzA3enJ0Q3RJQTczdFZmRFkz?=
 =?utf-8?B?bElGd2JycWNsNmU4RTZKMCtiVWsrdHdPbGlOeVdqSWt0cmNyQzNONEZXQWdH?=
 =?utf-8?B?TUVNMU9XTDZpUlcraUtRU2FmTGp1QXdmaFJ2aDA4cmJtMGpweWp6YnV6UHVm?=
 =?utf-8?B?WkpiSDBtR1Z5d2FXY3lJNmNQaFF3WkFCKzhlWWM4MGp1NGlKeklDdVQ2VFJ3?=
 =?utf-8?B?M1lvL2M5bGRidkN0MUlqUndHYm9vMUFrWmhKdWJFNDVkK2J3ZFcrVlc4NmNW?=
 =?utf-8?B?UStYVEhzd01WTVJPM1RJL04rczdUTGFTa3V5UXd4Sk1hTWxPSXduMzloeERP?=
 =?utf-8?B?STZWOTgwMThscWdwazJGbHIvQWlsNlhpM2lZdGFIcEJOU3VlV3EwRldsSmJo?=
 =?utf-8?B?RjBXWHBOaDlrM3NPZDZ5ZWk3L2gzN1dSa1BwZCt4QkhPV3h4U1hTbHRJdjVE?=
 =?utf-8?B?ajc2K0hhbTJKL1RQNWpjYWg3aVk1TytTNGVLc01qUW1ZSUFOU052WHNxZzVt?=
 =?utf-8?B?SjlJTVJ1RmFzNVJsS1NXMi9IU2hmNTBXSmcvdWcvNjVjWG1nZU4rOWtGMTVT?=
 =?utf-8?B?S2NyTG9JUGJWRjJPR2xZOHZ0OHpJOER4ZExLeGYwVjZ0dkVNN0xObUNXWW5D?=
 =?utf-8?B?S3plQ3VoUi8xTFU3YytRZngycE9aVVhZakx6d2hFM0Z1MFZYakFFaWZLcXlx?=
 =?utf-8?B?WU5ud0NIM2ZhUnEyVDF0N2pjMWJuTlJtZU5MdUcyRno5RkVldmJUVGFMN0RX?=
 =?utf-8?B?YU5jK3AvdkxRK29LZWlXc3gxYVliUmRrRzBneit3RFE3NER0bTZWQ01TbFdH?=
 =?utf-8?B?T0d3Mm02REk1L2xvajhDdGtXTk5vTzhSbC96SmNydHR1TXNWdEZTRXB3alls?=
 =?utf-8?B?MXVVQU93SkhVK2htUkVlM1dXZ3pJTnBEQm9rNmRadmdUbG9XT0tndHVJVVpy?=
 =?utf-8?B?YVlrQlNRTjJJaUJkVXoydE9oSXhwVEF1UmtqaW1YWURONDk4QkdVZW82eEI1?=
 =?utf-8?B?K1VKMHFxQ29GVDdZYmtWNk5UMk9HV3FTZWNOc2VtbW1uMSs1Y3J4T0RpNklj?=
 =?utf-8?B?ck1KeUZ5bUJuOUdkeENNN1VBWnNQWXRIeG95eGEwSkhEampqQVEzNlRTV3U0?=
 =?utf-8?B?OW5CWUZVeHdwd3ovaWxMbDZuKzRwS2FZelNVbnU3MTEvc3Avak9HZzhNRXJM?=
 =?utf-8?B?cWN2Q1l6UHBhR3c5dUY1K01PbENmVU1zRjlVVGw3eTUrYk9GVGJyNzhxQ3o3?=
 =?utf-8?B?Z05xd0xTZHNEeUJuRDF2b3BLWEV3djBnVHpEcUd1UzhweCttZkwwZ3J0RVhr?=
 =?utf-8?B?N1pteStId3RDSUJDMnVleWZXSElCZWFEWkRqeWNFZDVQNkg5MjcwR0V6bXhK?=
 =?utf-8?B?NW41Q2RJRGVXNm85OXRKc2JuZDVZVjg5d0VYVzk3K2hpYlZUMnJSMXZkUmZp?=
 =?utf-8?B?ZDI0TGxjR3AzUVZUbG5jOHNJZGNIZEZqTWZIZ1hUVjg1cWtzVmhBK2ZHcUtP?=
 =?utf-8?B?Ykh1S0ZWN3BxQ3Z0QWlPUWlqOFY5UFc2MnBKamt3Qk1kb29ZVkRBSFpyZmtr?=
 =?utf-8?B?Vk5tbXZPYk1QOXVGQ3g1dzV0YXpTV3NnNlBMN2FNSkxUSzB1aDg2b2NsT2NZ?=
 =?utf-8?B?c2YyajUzQ2o4T0RlTldsbFZ1SjllL2M3QVRwK0kxdCs4czJmdUZqQURsa25I?=
 =?utf-8?B?T0FnbDFtT0ZiZ2FmeUdoYVdNQmlFK3M1elhXWXI3L0JTUjlobWpjZHk2b1hS?=
 =?utf-8?B?cUVnNXlxamh5U1IzYWZVeUo4THROemorRzJJU3ZldXc5T3FFczdSZ3Y4Mjgy?=
 =?utf-8?B?bHFJd3lCaUR5TzdpOVVDUG5YRVZrZnJxRUZtWTRhamgrdDNFYmxNamltMWF4?=
 =?utf-8?B?WlZVcms4RDFCNzRPNmJ3YVRxY2tLb1NYTTVIeGxQdkxVTFRnR2U3NXJKL2Z5?=
 =?utf-8?B?K2kraDFxeFJCT1lUc3paelIvVmdpSHk1c3NQazYzR1B2Y052bjYxS2plSVRN?=
 =?utf-8?B?R2xsenBkaDR3UDVUS0NtZG43KzRHT1NYcWh0dlUrclUzTmgwdFp6a1NPSlFw?=
 =?utf-8?B?RHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d9910323-8a88-4f8e-dfd7-08dd1e9cf294
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 13:15:59.1498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUOd3DI08Vwqt/ZX0IKqaxaJBTaWFEqi9jubVgRtOjy18UjlR3MCW6LdfNsH3I5tkmxhlGaRnzBrGgJ0EpiNiusJhAzxVLeQeg6gH7vmYWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8660
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 13:16:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5963

Hi Antonin,

On 12/17/24 2:10 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Tue Dec 17, 2024 at 1:58 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 12/17/24 11:31 AM, Antonin Godard wrote:
>>> Hi Quentin,
>>>
>>> On Tue Dec 10, 2024 at 4:26 PM CET, Quentin Schulz wrote:
>>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>>
>>>> The YAML variables for the host dependencies are updated by hand and
>>>> actually only used inside code blocks.
>>>>
>>>> It's also slowly getting more difficult to make sense of the content of
>>>> those variables as they are both the list of packages to install with
>>>> the distro's package manager and sometimes additional commands, which
>>>> all need to have the indentation of the block where the variable is used
>>>> matched. This is impossible so we just guess it's going to be at a
>>>> specific indentation.
>>>>
>>>> Instead, let's migrate all instructions into separate shell scripts that
>>>> are then literalinclude'd into the Sphinx documentation.
>>>>
>>>> This allows a few things:
>>>> - ability to run shellcheck on the scripts if we ever want to
>>>> - manually calling the appropriate script from a supported distro to
>>>>     build stuff (distro or bitbake/yocto stuff)
>>>> - use this script to create containers to do CI of documentation on
>>>>     different distros, to make sure our instructions are all up to date,
>>>>
>>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>> ---
>>>>    documentation/poky.yaml.in                         | 26 -------------
>>>>    documentation/ref-manual/system-requirements.rst   | 45 ++++++++++++----------
>>>>    .../tools/almalinux_host_packages_docs.sh          |  2 +
>>>
>>> Maybe I would put the scripts in a subdirectory called "host_packages_scripts"
>>> and rename the scripts "almalinux_docs.sh", "almalinux_essential.sh", etc. for
>>> shorter names. Same for Containerfiles in the next patch, maybe storing them in
>>> a subdirectory would make sense.
>>>
>>> If putting them at the same level is because of the build context requiring
>>> files to be all at the same place, let's leave it like this.
>>>
>>
>> Will check for a v3 but should be doable I believe.
>>
>>>
>>> Otherwise, this needs to be rebased and updated after the dependencies were
>>> updated on master.
>>>
>>
>> That's already done in the v2 I sent yesterday :)
> 
> Strange, I did not receive it, and I can't find it on
> lore.kernel.org/yocto-docs. Is the issue on my side?
> 

Typical PEBKAC, forgot to run b4 prep --auto-to-cc on the patch series 
before sending it (it warned me I hadn't run the command yet but I had 
sent the v1 already so I thought it was a spurious warning message) so I 
sent it to a whopping amount of one recipient... myself.

Will send with the requested changes as v2 once ready :) Thanks for the 
heads up.

Cheers,
Quentin

