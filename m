Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0098E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:29:13 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.88])
 by mx.groups.io with SMTP id smtpd.web11.107692.1733765343123885583
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 09:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=jv3lDvfY;
 spf=pass (domain: cherry.de, ip: 40.107.22.88, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZl/5UzWoQ/WuH2JA3MEzXY1xc1UaWF5ekgoijgmRvWrqo4YHVDsEBWyYcaGQlO9/t5EFzKFRF9Mdew0NS7LBHr2S6l+ng6LS1HfRNgzDPrceriTspb7fC94MI/6NvOnEt75ZgUS1Wj8h8d/06yJ4QC1dsWhjdOtRg82ZluEOA3dYcwD0T1JnXx8mNNHSrNG3fYowZU14Z7V7VGqol35QBOqjGvEwmQICBCy4mTgMFXbTl9Nh5+DptvYTozt43Wu9Vw2R3NoKXURYD69q+dqXMttvsOtbWylTt/gdOM1Reri7Dyj1ZQrQLDyBADOd7jxSZlOhQFuftohsajBsprLug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KCfntiTuKJ1+2MAkerIiPJoqKhW7/eJwcymQ8644UM=;
 b=JB/WGeL0n+8knNW5IV9PdRRU32qNEPpd2QMTMKHzTH+6UNN7l2JQn/iFDQBtoXnToUFvymNxEo01IoiVl4C07gPCAGLjH4Et76eummSqBbqwP+WTv899nwiJKKsabgVf59ZVwFDjJpJF84dwoWhBJNpVYhFT+BWEHg7LcmIk70ohsZayjnQhhVnorRBXHOVIq26vrVLTQULJcy79oq/a1f2ZeeMOx8teGDFNZprRFttJetjbsRMeW9HHgK0nEc9FHqeYQpNSBhENSAPWRpNhZISB8Wva/z1vTL/637TUD9wH3aq7dhPq9iCt3yKWgjcWOO6ztbigPncxT3AIPat1XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KCfntiTuKJ1+2MAkerIiPJoqKhW7/eJwcymQ8644UM=;
 b=jv3lDvfY0QjYkH70yIWR0EIRhvRYMkIovq8jPH9DSQF+OurQwZtRKci0tSEIeOauN4fzj32u9sduvztrHBeL2etDTs1rXOXUA7w0fpZD1UYNRwUcRdbsdi08WVbyhKJxHwhtpbqYRyWKGUaryNX5D8fF1Tgiq6NSOWqQdYqaU1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AM7PR04MB6952.eurprd04.prod.outlook.com (2603:10a6:20b:107::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.17; Mon, 9 Dec
 2024 17:28:59 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 17:28:58 +0000
Message-ID: <50f1c8ad-6726-4b14-a440-043cd7a47077@cherry.de>
Date: Mon, 9 Dec 2024 18:28:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH v2 5/6] system-requirements.rst: add
 dependencies for pdf builds
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
 <20241204-update-doc-deps-v2-5-1d9b4063476f@bootlin.com>
 <f6b0c418-bd94-4fc2-a58d-ec7634926fe1@cherry.de>
 <D67BY6U5UGPM.B2AQ5R5NXNID@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D67BY6U5UGPM.B2AQ5R5NXNID@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0355.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::8) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AM7PR04MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: e8900b54-4473-4b4a-02ff-08dd1876f6fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R1o5Zmpla2h3b2UwNnh5NXYwYlFLZ2VyaDhJUWNGb01lK0JNRGRhL0g2S2xp?=
 =?utf-8?B?OCtHSTB4QXBOUnFXbldaeXRXWHhsRis3WXo0c1RTN3FMQkx4c0p1TXVBbmJp?=
 =?utf-8?B?d29WRkxnZWJkRmlYL0lJamFXdkNYTEZjRXUvZWRzMmV3a1hxVmM1cHVWWHFM?=
 =?utf-8?B?d3Y0RTU0eTFFQXlPVHdKcEhqRzlXWm9zcHV5WDlzeGFrcXdMVG03MG1pdXE0?=
 =?utf-8?B?NnZheDVFdVBEZytsVlY4a2Jic0JFZlVaMFNUbktSZjEzVnA5Wk9ueFlsbkcr?=
 =?utf-8?B?V3NZeHdxWVNMdjExbkNXcDdSSkY1ZlZiYk11Sm9WUHFWT1dIWVpTdVk2ZlpF?=
 =?utf-8?B?TDZHVTV4WDg2eHdIQ0FDMTY2eHcyLzRBWURERWp4TGo4Mjg4ZUI4dHpSOEx2?=
 =?utf-8?B?cGNNU1BhLzZMaDJ5dzZPek4rRWhCVnFCVFFnYkFXa3hKUWU1cGRYN3hkTkpl?=
 =?utf-8?B?K0JJMXpLdmZpN0Zaa2Zjb1dOQ2lVdERxYXlVYktJZGdZbVphalY2QjZEK216?=
 =?utf-8?B?a2k5WjloNzFkYWJ5dlVBODRBUk9XTTNxOEpRM0hQUkdsc1huKzZRMWFjUjYw?=
 =?utf-8?B?OUZQWC80N0cxL05ueVd1WjhiR0hRODRJNFNsei9OUkh2N2UvRUIxTklwUDJV?=
 =?utf-8?B?Q0R0RG9BeXZDTkpYN2cyWFRYL0l2ZVVOVk9ySzRTSUJjYy9KUE9pcE5iQ1dI?=
 =?utf-8?B?d0ZSa2dDVWpyVXIwUlV1cU94bVdxemJPT003a2NzWFdJd2ZLREY3dHBQNFAy?=
 =?utf-8?B?UGlSRldFdWk2bERST2NlOUV2ZllwZ3BjZkpWeTdjSXdkNDNWaG1rR1F3VHRa?=
 =?utf-8?B?Uko1bUVZM0QyU2ZRTDF1UTJmRWgxeWNVQjhvNFFwUXVoOENGWndTMDl2MGEy?=
 =?utf-8?B?Ry90YUxuLzI5K0NrSFR3NDVTdHRTQjlBRXgxUS9yNFZtZ2lmMXlCYVVoMGZR?=
 =?utf-8?B?bzJVZ1ovQk1CWkpnYVFxUW9DV2VXaE1ybXBJT1hkdE1VUzdYL28yektDODVa?=
 =?utf-8?B?Sm8yU25LY2EvUEgyTkxpRVZGcjNLWGRYVjBZNzZSYWhCOFd2bUg0NDJJNmVp?=
 =?utf-8?B?RTBzK1lvNXRNbGxhTStEcmoxdDFtVFhlYnFSUC8yY0ZJeGlFSEt0aWRGUHlG?=
 =?utf-8?B?RXJmQkZGUEdYUmQ1M2F2cERzb0FHc3VpSzZ5djRxODZoN3dmdEZnOWQ5ek1p?=
 =?utf-8?B?SXNmYVhyWWZtUGRsU1dPQnFTTE85RytKMmxqUDhqNkd2M3U4czlYd2liMzdr?=
 =?utf-8?B?MDk1cVJHMjluOW9JR3MzaDJYcmpDNU5hMTAzV29HZHQxNGZSaEh0TzB3T3pI?=
 =?utf-8?B?R0hoUW53SnFqN0l5MjUrODB2bGdlL3J5ejVlVE5keVFUUFQ4MThhbkFYclda?=
 =?utf-8?B?TGtINTdsVTdGR1dzSm1RYlNhem44aEIyTThwem05K3o4UVo0R21OL1Nld3RO?=
 =?utf-8?B?T1NOdGtWTkRucnQraThPMGxRT1lGWURuc0ZmWEhVR0ZxSTNvT055emZ6MzlE?=
 =?utf-8?B?N1BvUS9HcUx3ays4ZWlCb3poc2RabjVYczdzZXZsNXJrZmtCbkQrZFVJSmhm?=
 =?utf-8?B?ZUZieHFDSkZYR2NYeC9aMlV3UngwaG1udUMvMDZLZTlWL0J4dWszT0xoT2lv?=
 =?utf-8?B?ZXlrd0N1QUhmdGtPakg5NE5nQ0JzaHZZNUhOODhDc2xSdnJJb0w3M2xiZWFK?=
 =?utf-8?B?c3NLeTFleE9mUnphK3lxbEY3bVFCc2xQTks5ODNWV2NvNk9NSjl5RStHS09m?=
 =?utf-8?B?Tk04WGNCWUpsWmpyRnFVZG9tOVRuZ3V0U2E1TC9IU1E3VjhPa3FBa0lMWnNm?=
 =?utf-8?B?WmRDN1NONW9sbllZOXZrdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?REtZM0g0b2h4bm9qVzJxVFFMQldvVi9PenJFZEJLYTlrWG1HVjlyYkh2UkRX?=
 =?utf-8?B?K0pMaDV3dkFQb25kSzlTZFZJb2k3SkZVZ29sMGtVSkV2RWgvY1RBWlFYTzdL?=
 =?utf-8?B?Ukw2SUl3a1hpSDVlVG9yS1loelpnTHR3VUNGUzVhVUJkS0pVRm1xS1Z5TENm?=
 =?utf-8?B?OFB1a3BySXBsbSsrUlNGVTdZY1NQTDNZd2g3L1BsYXliTkhiMlZnTWp2WWlM?=
 =?utf-8?B?K1dUYkl0OTUvM1R1RTJ2Qm9uR3hUOWNCYU5PaWtrOWN3TGl0Q0tQZmVLWXRz?=
 =?utf-8?B?aVBWdllzdTkwOTdrZGh2RTZIMmVPYkNEQ1pjU3lUVnJBSFBwZSt6MzYreUZU?=
 =?utf-8?B?aDVQSGYrMjFYUUljZGplejAydjBUSmlpMEQ4V3J5TGg0b1c1RXJkU3RZdVFi?=
 =?utf-8?B?Rml4VU1EeFR6Y3RWU1YybmFzb09TK3BmN1ptbXBOczFxckJ0TnNIK3VGbzlt?=
 =?utf-8?B?K0JKbGVSSnB1NE9seEQvejJVei94bVYxeE9pLy84QTZlVHNGUnBtSEFydXRa?=
 =?utf-8?B?dlNKZ2JuaDhnV25OazY4bTgyOHhIczA3K09iMS9kYVdnemVXMnlzcU1LRU91?=
 =?utf-8?B?cDZ5a3VCUVNYUEN5eVNCU2VqczRRZWl3OUpaaWNnLzhjdU1IRUZhMFpPMGhO?=
 =?utf-8?B?Rzd3cklOS3NsMGxEMEJ1TGJKTVlNVERnTmhVY2xvRzZ5dTZMK1R2eDlFK0U5?=
 =?utf-8?B?b1hHaHF0cHFKU3F5VGdYcDdzRkJYU3drcTd4ZWVwMG14RzNKbDVYNy94K0dY?=
 =?utf-8?B?WC9PTHlTTzVxYXdYdldzMEd6VnJuS0hNTng4NmdIMzhSVnl5Z0tvc0tpeERr?=
 =?utf-8?B?OWFvYXpzVEo3K1d4SXozTlJRK2ZES0RGaU9QMGZyaFZ0TnZMdEVTNGl6Y09F?=
 =?utf-8?B?ZExkbWRTSmwrQzI5TDIzcTROanFKV0NZVDVsdmN2UWZCb2pRSGlRV28zc1J2?=
 =?utf-8?B?UTUzc2x4Yjdqejk5bFZycGg2TVVKd2Y0eWxxMnp2YS84TGxWWUJPeEdwS21Q?=
 =?utf-8?B?S01xdExhT3FIY21ZbzNjRHBialcwTFlibWtYT29RZ29EV3dOdlFQTVVoaVZP?=
 =?utf-8?B?bXA5UmdkWm9XWVJya3BkTjlWcTBtbnlSbVlwVytiZXJxMmQ3NzFYTHc0SVpn?=
 =?utf-8?B?eG42TlZmMS9PalUyRnl6UkJuSWs3UE92QmxNVUFqZENMSG5LdTBNR2hKVkVD?=
 =?utf-8?B?bU5DMVpmbGJmeE01bW5UZVJqcEhiWVJ2SW5yYnFYRjF5NjBCaGFCYkp4RkNO?=
 =?utf-8?B?dnNGOWs3QzhKMTNHUGVXQW9yTENJbkF4Yk9WS0Rla0ZEMXhBaHhHTlo4S2Ex?=
 =?utf-8?B?QzVPdFpqNW9iUlB3WVIxQmJMWFllcWVGdkJTWlphOWQvNFRTU01yVVdJZFRB?=
 =?utf-8?B?NXNYRERmZVM5eVhhTzVMLzhQS1k0WlVqMkJ5RnRkaXlpZlBPaTBVQjJFRVJ2?=
 =?utf-8?B?aHhmYys2SGFtRlkxdjlIVlhwWGs2TGFLMFVMb29OeDJyaEVQWDE5WVQxTFkr?=
 =?utf-8?B?L0QrUERWZGxqbld6aWZqQlhDcGkwbnJTMlppRjMrYjVPM2JyMHh0elVoWkVN?=
 =?utf-8?B?MmNpdElPcUZUaFhWKzhMMmxodEE4VE5iMUJ1aWlMbm5xOWpHTGxNU2NrWlpp?=
 =?utf-8?B?RElhRVZrQW5Zck9DUkhUSHByRVI3Y2s1T2wwNHEzU1pFMkJkaTBoalRtVUdv?=
 =?utf-8?B?SUZhbm1NRUZZTnk0MVB3RXdGQ0xCV1NRaWdPNzlxKzRkVW1aa09IQzhPSUUw?=
 =?utf-8?B?Mnd1eXg3VlNKRFJnRlFvYk5GVzlKQUNtM2xSajZOQkthMCtpMHVtL1NGOGQr?=
 =?utf-8?B?ZnJnLzI5bkRvN0wxTTl4OHBlU1RmM0VPQkhYUXJIS1pqbDZRZVpyTHJ1eGpp?=
 =?utf-8?B?ei81UFl6WjlMekRkbTVKZHVkcTBOeVp2RTB4RStnb1pORmhvL0Fwcnk2bWVD?=
 =?utf-8?B?aVpTL0lMc3BhMkpaUzF1Q1NBenB6MVRXWFJjdXRYQVBFNkg5N0hTL1RiTXBI?=
 =?utf-8?B?dWFqb0VUYjZvaVdHZXRacTRzMFF0eCtvU1FENEtaa0N6aUFJT1ErZWVvcmVY?=
 =?utf-8?B?YVFGWno4eDlSSGUrdGNYMElkTHE5NElkSGNZcUVvRnByKzRPQVlwVjl2RDl4?=
 =?utf-8?B?cW5EUFM1NXpoWXRvVGExYnN5aU9SejVlc3RrVzJ4RDZaZVVzdGovajZFU25y?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e8900b54-4473-4b4a-02ff-08dd1876f6fd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 17:28:58.7172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiAYqFfTPPMiuWlQP/ldx4eAnZnHEo9MWEvgr/VdaDpGpJu77jijVMCoGiMH6o1oi7K8HeGljjGsL6dY0cD6/ttrrTirBNbhmW63F70O03k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6952
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 17:29:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5906

Hi Antonin,

On 12/9/24 6:02 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Hi Quentin,
> 
> On Fri Dec 6, 2024 at 3:00 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 12/4/24 1:23 PM, Antonin Godard wrote:
>>> With the recent changes from commit
>>> bd6265ca323fac547a197bb516dc4a9ef3897508 ("doc: Makefile: add support
>>> for xelatex"), the list of dependencies needs to be updated.
>>>
>>> The initial list of dependencies was made for Ubuntu/Debian, and the
>>> packages were translated for the other distros using pkgs.org.
>>>
>>> Add them separately from the rest of the dependencies as they pull a
>>> _lot_ of additional dependencies (for LaTeX).
>>>
>>> Notes:
>>> - Fedora/OpenSUSE do not have the "lang-all" texlive collection, so
>>>     install all available languages.
>>> - AlmaLinux does not seem to provide texlive-collection-fontsextra,
>>>     texlive-collection-lang*, and texlive-collection-latexextra, so add a
>>>     warning about that.
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/poky.yaml.in                       | 47 +++++++++++++++++++++++-
>>>    documentation/ref-manual/system-requirements.rst | 27 ++++++++++++++
>>>    2 files changed, 73 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
>>> index 94849acf9942c7ebddb2ac7f8aaf5eb9d87e0c5b..25385068679a51e0f2e9e516b02b62e19e126291 100644
>>> --- a/documentation/poky.yaml.in
>>> +++ b/documentation/poky.yaml.in
>>> @@ -67,8 +67,17 @@ UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
>>>      python3-saneyaml
>>>      python3-sphinx-rtd-theme
>>>      sphinx
>>> -  texlive-latex-extra
>>>    
>>> +UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF: >-
>>> +  fonts-freefont-otf
>>> +  latexmk
>>> +  tex-gyre
>>> +  texlive-fonts-extra
>>> +  texlive-fonts-recommended
>>> +  texlive-lang-all
>>> +  texlive-latex-extra
>>> +  texlive-latex-recommended
>>> +  texlive-xetex
>>>    
>>>    FEDORA_HOST_PACKAGES_ESSENTIAL: >-
>>>      bzip2
>>> @@ -129,6 +138,19 @@ FEDORA_HOST_PACKAGES_DOC: >-
>>>      texlive-latex-extra
>>>      which
>>>    
>>> +FEDORA_HOST_PACKAGES_DOC_PDF: >-
>>> +  latexmk
>>> +  texlive-collection-fontsextra
>>> +  texlive-collection-fontsrecommended
>>> +  texlive-collection-lang*
>>
>> Please use single quotes to surround texlive-collection-lang* otherwise
>> it may be interpreted by the shell, c.f. for me:
>>
>> ```sh
>> $ sudo dnf install texlive-collection-lang*
>> zsh: no matches found: libgpiod*
>> ```
>>
>> while `sudo dnf install 'texlive-collection-lang*'` works just fine.
>>
>> Ditto for the other occurrences later in this diff.
> 
> So I had issues with this in the container scripts, which is why I left it at
> that. I initially single quoted this but it didn't work. Are you sure you can

Can you tell us more about those issues with some error value/messages 
or something?

> mix non-quotes and quoted strings here? I'll give a try, might be specific to
> the dockerfile.
> 

"""
$ sudo dnf install 'texlive-collection-lang*' latexmk
Updating and loading repositories:
Repositories loaded.
Package "texlive-collection-langarabic-11:svn59594-73.fc41.noarch" is 
already installed.
Package "texlive-collection-langchinese-11:svn63995-73.fc41.noarch" is 
already installed.
Package "texlive-collection-langcjk-11:svn65824-73.fc41.noarch" is 
already installed.
Package "texlive-collection-langcyrillic-11:svn54074-73.fc41.noarch" is 
already installed.
Package "texlive-collection-langczechslovak-11:svn54074-73.fc41.noarch" 
is already installed.
Package "texlive-collection-langenglish-11:svn65496-73.fc41.noarch" is 
already installed.
Package "texlive-collection-langeuropean-11:svn66432-73.fc41.noarch" is 
already installed.
Package "texlive-collection-langfrench-11:svn63147-73.fc41.noarch" is 
already installed.
Package "texlive-collection-langgerman-11:svn55706-73.fc41.noarch" is 
already installed.
Package "texlive-collection-langgreek-11:svn65038-73.fc41.noarch" is 
already installed.
Package "texlive-collection-langitalian-11:svn55129-73.fc41.noarch" is 
already installed.
Package "texlive-collection-langjapanese-11:svn64603-73.fc41.noarch" is 
already installed.
Package "texlive-collection-langkorean-11:svn54074-73.fc41.noarch" is 
already installed.
Package "texlive-collection-langother-11:svn59564-73.fc41.noarch" is 
already installed.
Package "texlive-collection-langpolish-11:svn54074-73.fc41.noarch" is 
already installed.
Package "texlive-collection-langportuguese-11:svn54074-73.fc41.noarch" 
is already installed.
Package "texlive-collection-langspanish-11:svn54141-73.fc41.noarch" is 
already installed.
Package "latexmk-4.85-2.fc41.noarch" is already installed.

Nothing to do.
"""

Same for latexmk first in the list.

That's for DNF5 (fedora 41 and later).

DNF4 seems to be happy in a fedora 40 container as well:

"""
[root@6f0bdf8b38f2 /]# dnf install latexmk 'texlive-collection-lang*'
Last metadata expiration check: 0:00:54 ago on Mon Dec  9 17:13:01 2024.
Dependencies resolved.
==============================================================================================
  Package                                 Arch   Version 
         Repo     Size
==============================================================================================
Installing:
  latexmk                                 noarch 4.85-1.fc40 
         updates 454 k
  texlive-collection-langarabic           noarch 11:svn59594-71.fc40 
         fedora  9.7 k
  texlive-collection-langchinese          noarch 11:svn63995-71.fc40 
         fedora   10 k
  texlive-collection-langcjk              noarch 11:svn65824-71.fc40 
         fedora  9.8 k
  texlive-collection-langcyrillic         noarch 11:svn54074-71.fc40 
         fedora   10 k
  texlive-collection-langczechslovak      noarch 11:svn54074-71.fc40 
         fedora  9.4 k
  texlive-collection-langenglish          noarch 11:svn65496-71.fc40 
         fedora   11 k
  texlive-collection-langeuropean         noarch 11:svn66432-71.fc40 
         fedora   11 k
  texlive-collection-langfrench           noarch 11:svn63147-71.fc40 
         fedora   10 k
  texlive-collection-langgerman           noarch 11:svn55706-71.fc40 
         fedora   10 k
  texlive-collection-langgreek            noarch 11:svn65038-71.fc40 
         fedora  9.6 k
  texlive-collection-langitalian          noarch 11:svn55129-71.fc40 
         fedora  9.6 k
  texlive-collection-langjapanese         noarch 11:svn64603-71.fc40 
         fedora   11 k
  texlive-collection-langkorean           noarch 11:svn54074-71.fc40 
         fedora  9.4 k
  texlive-collection-langother            noarch 11:svn59564-71.fc40 
         fedora   11 k
  texlive-collection-langpolish           noarch 11:svn54074-71.fc40 
         fedora  9.5 k
  texlive-collection-langportuguese       noarch 11:svn54074-71.fc40 
         fedora  9.4 k
  texlive-collection-langspanish          noarch 11:svn54141-71.fc40 
         fedora  9.4 k
[...]
"""

and the other way around:

"""
[root@6f0bdf8b38f2 /]# dnf install 'texlive-collection-lang*' latexmk
Last metadata expiration check: 0:00:09 ago on Mon Dec  9 17:13:01 2024.
Dependencies resolved.
==============================================================================================
  Package                                 Arch   Version 
         Repo     Size
==============================================================================================
Installing:
  latexmk                                 noarch 4.85-1.fc40 
         updates 454 k
  texlive-collection-langarabic           noarch 11:svn59594-71.fc40 
         fedora  9.7 k
  texlive-collection-langchinese          noarch 11:svn63995-71.fc40 
         fedora   10 k
  texlive-collection-langcjk              noarch 11:svn65824-71.fc40 
         fedora  9.8 k
  texlive-collection-langcyrillic         noarch 11:svn54074-71.fc40 
         fedora   10 k
  texlive-collection-langczechslovak      noarch 11:svn54074-71.fc40 
         fedora  9.4 k
  texlive-collection-langenglish          noarch 11:svn65496-71.fc40 
         fedora   11 k
  texlive-collection-langeuropean         noarch 11:svn66432-71.fc40 
         fedora   11 k
  texlive-collection-langfrench           noarch 11:svn63147-71.fc40 
         fedora   10 k
  texlive-collection-langgerman           noarch 11:svn55706-71.fc40 
         fedora   10 k
  texlive-collection-langgreek            noarch 11:svn65038-71.fc40 
         fedora  9.6 k
  texlive-collection-langitalian          noarch 11:svn55129-71.fc40 
         fedora  9.6 k
  texlive-collection-langjapanese         noarch 11:svn64603-71.fc40 
         fedora   11 k
  texlive-collection-langkorean           noarch 11:svn54074-71.fc40 
         fedora  9.4 k
  texlive-collection-langother            noarch 11:svn59564-71.fc40 
         fedora   11 k
  texlive-collection-langpolish           noarch 11:svn54074-71.fc40 
         fedora  9.5 k
  texlive-collection-langportuguese       noarch 11:svn54074-71.fc40 
         fedora  9.4 k
  texlive-collection-langspanish          noarch 11:svn54141-71.fc40 
         fedora  9.4 k
[...]
"""

Cheers,
Quentin

