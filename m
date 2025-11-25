Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3433CD0E6C7
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 11:45:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14956.1764071119917120294
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 03:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=jF+ez/uf;
 spf=pass (domain: cherry.de, ip: 52.101.66.13, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lP2nuXTj3YrX0xUdTvjPsY+mIhsev+9q7SZYS2ukH5qBYY70G9+XaysesP+CEK2bl68Ea0Iw7PtYvS7I9e8UxSFjcifNN6A0XMfqmUUdmsEAWTeH15EesS/UGXTrDUp+TK9hlheFA4b0YKMkF6GG7A5KBaUNVFT5TQjBEmyRgFdZpr0uuCVNOxlhboDUVpv7jDoBxJpeiQ1NSur51BPvb8lQD1ish3U+Zgzwkiv7iUO7e93UhIKW1Bhtt5Je92mHMS0ngbHAlWVrZIKKVxODRXo2SEuazVtXCLv9Og4P6NFPcB91j0SxU4Rdy+9qW7zWXhQOVj7hqVi/XnWXhWESdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfxRGle9PbwENkPGd+M9l+jPRJXUhLFHVWMg0ZbYFAM=;
 b=mXFgQKRPuPAAEqD0q2pD8eqO+xH/h+RQPI9+ahNIVu3UYtFPlZhk5MjQehm5P2XLJys94uJkGAI7otOgbZ2vvEGDLZpEnx4rilZu07ZZJYWn8RgxkgvI9XkdGtjb7VHEsMZvGfmjBns2KB9sqcD2fEvGPeu+UDw+unfU55CwHlvePSxUvDQ2XQhq1YIXfx4RpsKaBgMDUBb7U0umwajis8JcaZZYT1gdZ/bc+JCsAxxsV7cXOoq4PauqumMJsoziQ2jQiGEIqlB0cZU2qlBEJeojvG/buyMSLR+nBX4MDj+dBF+o4itxZ88TpZsERg1r9Hb10hMeKA2l0p0FkBbqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfxRGle9PbwENkPGd+M9l+jPRJXUhLFHVWMg0ZbYFAM=;
 b=jF+ez/ufxIo4c+ogmXSuenjyz2awwevehd85UwIvAZTHgQtakBjN/BA+lbue2HfD/IqnYmVS5uT5z4gplIBO9SzBsFhWmGsddzL7L/zSqVi5IQmOqBzOWNxqcd3BUWz1uAs4oubPHbLQQkuXD+/WvjKq65DquHdi8TxgvS2jU60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB11726.eurprd04.prod.outlook.com (2603:10a6:10:615::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 11:45:15 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 11:45:15 +0000
Message-ID: <6394fa7e-af3c-4300-8962-bc82e3c59968@cherry.de>
Date: Tue, 25 Nov 2025 12:45:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] brief-yoctoprojectqs: shorten and clarify
 required host packages
To: Antonin Godard <antonin.godard@bootlin.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <77d4de56-c700-9ae8-f03f-ede89df13e62@crashcourse.ca>
 <DEH0FJ96MF58.TDE0QZF0AM5A@bootlin.com>
 <74030727-ae53-4664-8693-34ecb975e557@cherry.de>
 <DEH1QRTPEDL6.2XESRCG6M8CT5@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DEH1QRTPEDL6.2XESRCG6M8CT5@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0098.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::27) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB11726:EE_
X-MS-Office365-Filtering-Correlation-Id: c5787442-a848-4f87-337c-08de2c18197a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N1d0M21xK2NHSWtQQjI3a1liZi9sMy9YZkNpOXRUWGU2N2NiMEZ4M21TQmZL?=
 =?utf-8?B?Z1ZSSlZ2K0lHcVplRTVxTURRUXR3V2QyNU54QzI1cmdYWEhmWW5lc2J5aWhL?=
 =?utf-8?B?cUtrQVNzZnRBVjJQNkprSE9DRkx3MEJxenZhbTQ1V2IrMnRMOGplYkhaM0tn?=
 =?utf-8?B?aE5EcnRqdmJ2WTBqaUpvb1JES0tDMXB5K0ZwOWZlUkxqU3Zzck9KRXd6cTJ0?=
 =?utf-8?B?THpaZXdZN0lucG13Z1lSaFgwOEpKTXl1d2FaaVE0V01yaWhHWlRZb1QrSDR3?=
 =?utf-8?B?STA5TlBOYmJkRmUwVWNWUjZRRlNreTlsS0pMSG5jZkJxR2RZWGZGbzRZME16?=
 =?utf-8?B?MFp2RStaT0lIcGhRZlFDMWJUMU1WWFc4c2JnaHFXbHJtc1lYc3NCVnVXOXNZ?=
 =?utf-8?B?UkZiM2tadWVsNmRYS2NKTVR6cmhMQXZkQmJUMklWNGFMRW9xcnlYTHFDTnFl?=
 =?utf-8?B?TThHbWFZazgyL3htQWlUY3ZxSXpRS1VHVTBER3NOaW96NWpSWGlqS0tZOFNG?=
 =?utf-8?B?NGd1TFgyMU14RlFUUDd3cU9qZElkaG5vbFRUZWFlMU83eGI5YmMvL0h0cGoz?=
 =?utf-8?B?OXZ1UGJaZWhxSlpaZTlCT0NCQ01DcXEwVER2b2o0WGNLUVBjZyt6ZlNxVDZ6?=
 =?utf-8?B?ZU02d245aDlnVlVadndIZnRlWHdMQjl1OVFWc1dreDRpWjlGU0ZoTkRsYmJ6?=
 =?utf-8?B?RlZ2SDdza0VQWno4bG1PbWp5cktDcndmei9GOVcxYUx6UHhsekhPWkc0T0pP?=
 =?utf-8?B?a2FoTmdNZFlLQ3pTcjFubHpsMjN2YUpYRFIzSm16c3VlU0NoaklOd0pIaUJq?=
 =?utf-8?B?UEhzMjRwWGtSK0JJTXdTcEI4dU5SNDJ2aHJUaGo4T2w1Vm1vSzBMakRNS2ND?=
 =?utf-8?B?M3RMTVQ1TXlkdjRIS09CRnNyaFBPTERuZFBTemMzWTJORFZIRkxSaVBCT0pk?=
 =?utf-8?B?Qkl3SCs1RUxodVdGWTZLVE5QQlJTL0x2T0hPSEUvcmo2L3ZLZk9pRGZna0ds?=
 =?utf-8?B?bmxzMFZiZTdBODF3YVJxYk94bEt3M28vNzV1bmlFR09Hd2N0N2QvU2pCc1Ni?=
 =?utf-8?B?OVo0ZnBTQ1N4M09QdzFmWGU5OFFhdDR1bm5PNXR5SWhBZE9manVkUERwbmMv?=
 =?utf-8?B?bzZ0eVE2alMyT1p5Nlp6ZUNNUy9kemh4MkVVdDF1eERVRTJEa0s1Z0cvSDBD?=
 =?utf-8?B?QWhNcWRuamV0bTRDKzJaM1htVHp5anlYWG5ZQWxZMjJtRVlxMXhYT0diaHFs?=
 =?utf-8?B?Z2sxeTRYZnBYdWRPUDVUWGZXVDk1cGpaNm1xdmE1Qm1NekkwLzd4L2JwbWRB?=
 =?utf-8?B?dkVnVkR6RHl3SUtFOFlxY3l3MjZONlpkT1pPdHBTOEl4ZWtKVk0ySm1uclhs?=
 =?utf-8?B?TmFFdUxUa3hUdk9zOHk2QmV3NmpyVEE0NThQcmhHZnlkMjY1MmE2eVNZeFBZ?=
 =?utf-8?B?OTlpU0dBNCtuKytkbEIwMTg0Yk9OUitxWXZZZmNOdnJHQnZSU3JOY0ltaStE?=
 =?utf-8?B?NkJTRzBwdU9GV1VCQ0p1b3FjRWpwUC9IeGg4UDVvUHl3UVQ0UTNjbjZJMlFG?=
 =?utf-8?B?MWJncHVUcHdacE01RTJQNVpqSWk0U3NyUnNFUGR6UGNEOWNUK1dLS1h0T3hs?=
 =?utf-8?B?Q3FSL1lzSTlBU2VWQUJDMjkvNmwxZm9jRW1JMzFpSXhldlJUeGg0Q2w1aTll?=
 =?utf-8?B?S3VQa2dVUm5EcGJtRFJuMTJaRU0vUmczVkQxajZtQkoySWZVZWt6NVcrZkdQ?=
 =?utf-8?B?RmZsTVlFMDBjWUZoVzRJejNGZ3RkNDl5Mzl5aUREL1RzVjhXYzRWdm9FRmtC?=
 =?utf-8?B?MFAzZG9oOUZ1QXNrb1RUUjgwemRsZjIwRGcvVlAyYmFac2piS2N0QlVGMEJB?=
 =?utf-8?B?S3JadjFsV3pYdExCbVJnY1MxM2hEVmxUcWxma3h6aDVnZkxwbFhidlJ1NHZK?=
 =?utf-8?Q?0uvHj+UJ2lMX63dArUC3osaZzp6sUP+I?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WkMyTGx2Y1ZERTVoM0l4L3l5cDhyQW9ZREUxR0RkOHlnNmVqbGJid2lETnY3?=
 =?utf-8?B?UnRGWG55aGorOTNsMGg1OUl2MmhCM0hoR0dvZ3BnOVJFNjdwN2FpbXN5Z2F6?=
 =?utf-8?B?NHNDUFEyeWdaM2ZMQVdKS0VTY08rNFg0cGtiV2x6eFFTL2ZJc2gramVQeXZu?=
 =?utf-8?B?UjNNeDI4YmpGYTFCeVoyU0NTNS9tYmVlMUpLaVpSQ0tXT3RHWUE2R3cvcXZE?=
 =?utf-8?B?bjNacnpRS0IvcDRyZGZQdE8zbHFkbnRCbVllZVgrUzA4aEJRZ0M4Q2xxb1NK?=
 =?utf-8?B?b1RnYUhWbHpGb1AvTlRPemtaakZsYklrUEFvUjdNc3JZeEo5MDcycGpEbGpk?=
 =?utf-8?B?S1E0b1JhT1VSN1ZJTTJaUWdwZzZ2MXk0ZGpqNzEydTFzR1NIUlQvcVlrZGdV?=
 =?utf-8?B?RzJsajdpdjFmS0hnVnJjQ05OOC85a0w4bEczZmxyT0s4WTZKejY0TXplTFlI?=
 =?utf-8?B?WE9kWkdiNjNxdWNqUW9SUVBDQUdwc0xIaXZBS3k5akNJdEdGN3d5a2RCV0hM?=
 =?utf-8?B?MmNwbndzcFFvNzBCWjFtYVB0N1BucndkdnNpR2loRTRIVHAzelB4SFZZVy9G?=
 =?utf-8?B?ZjBMQUo1a3BhVmt4dWZSYjNZL2M5NUp5UHp6Z1NTZDRLWUc1SjNUdmN5NUxR?=
 =?utf-8?B?a1BSOE5CdXdEZHRaQ2M2ZG5oUTZqVlk3OW9PWG9EUnluSnJqVTFBVGgvaWhG?=
 =?utf-8?B?bEg3U1BFclJTN3d4SEU3TGU0UThscVdXanNCb0RHVDFVK2xCWXBkM09FQURK?=
 =?utf-8?B?eVJrbVVEV3hTelZUWEcxMmk3M2xrU2pnUjJBU0JnaVlGdnZMQmVraExjUnBx?=
 =?utf-8?B?TkpsaFhURVNDSTJVT3dRWVZnNktaQ2JaN3VzQktaN1pmUXgvKzAxcVhra3N0?=
 =?utf-8?B?ZnhTd25IQjd2S0pCanpoWHZMNlJ4SXhQMDJTUXVnZWJZdklwNjFiMkFBVjVK?=
 =?utf-8?B?RjdrcmFvT0tLVk1PSDNhelFrdDQwMFpub21QUXZVWWY3eldKS2lqTGIwSnhv?=
 =?utf-8?B?ZnZRWlg0a3VobUdDejdQbXdrbmRwbWNBN1Yxa0ZldHBKeFlobHVZVEZwcVVj?=
 =?utf-8?B?bXFCbWtjOWdOZGNveEZOR1VZTks0YjA2azA0Y1dzb2M4VFZQRXNvUEtIWEJ6?=
 =?utf-8?B?eFF2aVQwSXpGTTZBWkx4bUI4am1LZDZQbU9FUkdmUXFwSTQ4OGJGNXYvSko0?=
 =?utf-8?B?WE9pdGdZMGJPQTZDNFJFQlRqNEJISWJmRmtLeHpTajNOeXAzUUxvM1dCa2hp?=
 =?utf-8?B?L0YzcEc1a1VFZWlEbmdsQ0dTd1J3ZGlPRHdZNDJhTFg3QnVoT3ZIVU5ndm9v?=
 =?utf-8?B?WGRnR0ZUWEZaK0RXckFsVi84cG1KQWxOK2hET3VITXcyZWtLc1YyZ2hZREJk?=
 =?utf-8?B?c0hGTXhDSDhKd0Uydld5cDFvMVg1T25zcmJSaEtXTjJKR1BlM1BwWTdqQzB5?=
 =?utf-8?B?aUlEK1RUdkVabmlKUi8wV0tueVA2MXJ2OHFmMUxkK3JQbG14ZzdaWmFpWVlT?=
 =?utf-8?B?MEVJRDErcmllTlFZdnI4Vm1NZmw0SWJrOTRkcnA5ejkwRWJRTm1Ic01SdWlG?=
 =?utf-8?B?NGVwY1lVdFRhZjFVby9XTkpUem1rRkF1aDdLdFhCWU0ydDVBTGxyZ3pYQ2s2?=
 =?utf-8?B?U0UrR1l3V1BJMkhYVHl4Rnp3aGFMb1BEMmNWaDcrMkNja2k3cllUWThJeERp?=
 =?utf-8?B?aEpFanVwMlpqelVMLzlDRDZTNW0yQ0JJbnovV0ZaK045M283QXNBQXo3Qjdi?=
 =?utf-8?B?ekF6OXBXZ3d3c1dldzlnMkhyRlFMZ00zMlVlN3h1Y0NETUhOdWxwTStueHBn?=
 =?utf-8?B?ckRRSGNJWTdMVmgzNGt2YWsvb3BkU0ViV2xxcDl3SCtRK1UzOVkxRkUvdkNu?=
 =?utf-8?B?MmpYU25jY0M1alJ6ZnQxSmw3WWcxMDViTktLQ2NNbnYweDRwakY0Wis1NkxW?=
 =?utf-8?B?eUxuV2kxQmZQNjk3bVprRUV4Wlg5dHY2a1FaODJYa3VXNldaSlVnYTNRSTlt?=
 =?utf-8?B?b01FTmw1M3hMN1g5VFRRSS9hTmtwOVU3bG1KZGlaWE1mZmlTdXQ3UWsrWFV5?=
 =?utf-8?B?M3F4ZDNUMjBFWng2VHVibjdWYlErQVpsQ0psdW1HeU5zMExGRThqVFFIMFhF?=
 =?utf-8?B?Q09Ia1hQbC85OHhYSUQ4L09JS094OVA5czNTTlpGYjhueVJZTzZzU1RBQ1hN?=
 =?utf-8?Q?FA+H3huDeYAxiXG4uBajXZU=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c5787442-a848-4f87-337c-08de2c18197a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 11:45:15.2584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSdqjvjx3qIsAkDHHAJ+/lMFJJoid7iAptciT6sCElBf18q3uiv77YBtfZGNehUEYVAMPfDIKdyBZQdyVSLz9AQ6sGIPfpzFgaF4LRhjOgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11726
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 11:45:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8113

Robert, Antonin,

On 11/24/25 4:56 PM, Antonin Godard wrote:
> Hi,
> 
> On Mon Nov 24, 2025 at 4:21 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 11/24/25 3:55 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Hi,
>>>
>>> On Wed Nov 19, 2025 at 5:55 PM CET, Robert P. J. Day wrote:
>>> [...]
>>>> -Build Host Packages
>>>> -===================
>>>> -
>>>> -You must install essential host packages on your build host. The
>>>> -following command installs the host packages based on an Ubuntu
>>>> -distribution:
>>>> -
>>>> -.. literalinclude:: ../tools/host_packages_scripts/ubuntu_essential.sh
>>>> -   :language: shell
>>>> -
>>>> -.. note::
>>>> +Supported Linux Distributions and Required Host Packages
>>>> +========================================================
>>>>
>>>> -   For host package requirements on all supported Linux distributions,
>>>> -   see the :ref:`ref-manual/system-requirements:required packages for the build host`
>>>> -   section in the Yocto Project Reference Manual.
>>>> +For host package requirements on all supported Linux distributions,
>>>> +see the :ref:`ref-manual/system-requirements:required packages for the build host`
>>>> +section in the Yocto Project Reference Manual.
>>>
>>> I think this defeats the purpose of this guide being the "Quick Start Guide". I
>>> _think_ most people run Ubuntu when they run Linux, and I believe this is the
>>> reason why this was written like so in this section.
>>>
>>
>> I have no data on this, so /me shrugs.
> 
> I know, me neither, but it's a general feeling I get from what I've seen IRL.
> 
>>> So for the majority of people reading this section will be enough, and that's
>>
>> The issue is it's not everything that needs to be done according to our
>> documentation. So it's already outdated and not well maintained. If you
>> want to keep having it this way (which is fair, avoiding to go back and
>> forth between the docs when one is reading "quick start" is a good
>> idea), I believe we can simply have an .rst with only Ubuntu
>> instructions that we can include in both
>> ref-manual/system-requirements.rst and brief-yoctoprojectqs/index.rst so
>> that it never is outdated?
> 
> Sure, having a single document for Ubuntu requirements would be an improvement!
> 

Will try giving that a shot except if Robert wants to do it?

>>> the point. Also, the previous section "Compatible Linux Distribution" does
>>> mention that not all version are supported. So I think this section is fine as
>>
>> Not all doesn't specify which ones. "Recent" is relative to time and I
>> will not be able to build Dunfell on a Ubuntu 25.10 even though that is
>> a recent distro and the docs said to use that. I would like to have this
>> "recent" removed or reworded. Something like
>>
>> :ref:`supported version of Ubuntu
>> distribution</ref-manual/system-requirements:supported linux distributions>`
> 
> Ack! I agree on removing "recent" too.
> 

Robert, do you want to send a v3 with this or do you mind if I take over 
the patch?

Quentin

