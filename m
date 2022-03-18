Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFF0C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 11:16:17 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.79])
 by mx.groups.io with SMTP id smtpd.web11.8546.1647602173875008508
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 04:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=isRaHSbB;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.79,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bs09HpO9vLUkteTPvtLDuEyEQUg30vXNYCd+aPnU3pmx+7QPFGscLR0LIoMgtTu69u7LCuZsJMZ7JPQtGUJjimHExKKfRJdDe+SpYNRiqYRMWddEQoRp8R3ws78DrMeQgNXBkhq75DZLaBEvSyF1B17BRgigTqgwIE6HgGj4aY2bC8SVVYB9OJxtDibbrWMIe/BIYsGv3JSybjUOFuki7e405ijDTUZwnc1yHSsoCGnh4Zc97PAd3EhuqiS3LgIkkDbq0XqGFQvfoMYRrxLA5Uc7K/laJO6gefEkXlU4nWyrJ6Sn5zx4B2wcMdSEzP7cSIKUl+1F2wC6aMfgUFsJhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8Xr87OheOVYpmsQtm+8RQ4OgvenZ9qR8Cdwn0orMa0=;
 b=nMfGW0mOuiOjAVirBssl/HHD5fF0GVNpj3dnPlBQfqJylGnbJjbOUmTEh63tzTHnqLMVxIiysl+RVADT6G0+fSSAm1mlVyciPO0yuj7M6GYZyjF6YYQVJLrHubg/ZdP2xKBuUL4NEAJtXflsQ9uFtVC7zkHV1ty+NP/Zb+iSxmxeWJMSKpu0T1YZ6wYQ/eJFBgvqBDGdWYjqeKczQB8DTxQUbDPxezQcxmBM+/0wyZ/xnP8DbmGMITvCZTK34h3+ALXDR+eRVmacVoAEGaz2bZ5LXdzr1e777SH9v7ZIMwgYjFlUpeL1ImXPBUDLVGCOgBkuKpX0uinRRsR3xtWpww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8Xr87OheOVYpmsQtm+8RQ4OgvenZ9qR8Cdwn0orMa0=;
 b=isRaHSbBtwIe3rGDrXny1OTiC/m1NdT4tNpf/g/2sSMPNI2lXe3US5EtfjW9Dy6bWpVSZs7gzeLM0MpJivDOnGlzasggS86ZJQdoKpHkveKnJvjrkaesYYoaxViTeaiTYtg8ML/T+fXAqy+l+sLpDyID+eYAURnqyzuQDXuJ83A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM6PR0402MB3799.eurprd04.prod.outlook.com (2603:10a6:209:19::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 18 Mar
 2022 11:16:10 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%6]) with mapi id 15.20.5081.016; Fri, 18 Mar 2022
 11:16:09 +0000
Message-ID: <a94451a0-8a13-930b-655a-8e3b34324cd4@theobroma-systems.com>
Date: Fri, 18 Mar 2022 12:16:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [docs] Version bump before release
Content-Language: en-US
To: michael.opdenacker@bootlin.com, Quentin Schulz <foss+yocto@0leil.net>,
 docs@lists.yoctoproject.org, Michael Halstead <mhalstead@linuxfoundation.org>
References: 
 <CADfgfobCTXyBYSSjekdKJp4ekrmHWH+imjpARMrCMLp2gwTr5w@mail.gmail.com>
 <14D40357-15CC-46D2-B63A-66AED89F291F@0leil.net>
 <6342c148-7e51-df83-2166-e2745b9f61e0@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <6342c148-7e51-df83-2166-e2745b9f61e0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0025.eurprd08.prod.outlook.com
 (2603:10a6:803:104::38) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a847a23-e5b1-4c71-fd59-08da08d0b440
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3799:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR0402MB379981B45FA4DC8146FF28AAC2139@AM6PR0402MB3799.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lmXzsPAwFRCZc/1ihx1fYdFvUlUYCah1UtxqI3TZXqvg+EzvmyUS4+pnvqmhgBbLgiDhcn9HQo6jsVlqKm5apOYyuG3NSQ0TsKlrl0EgoJiMFOYs7OP8jAHxtxcy2w+ahMH+ZM9KRhzQ896c5PZiBQOPAzEV7pOdjGn+oOekhOMFtaBO1dW0HxCj25KBYraSqflJ/yabePelkzejhb/LikWWR2aZrUvJdfhtnaQZC+ape5e6kxXX4G5UXHgpogYUTccZGy15nBKxCz9bzCOM4mrpnuif6suZITLVmSRAk48bcIgLuYoJtKTFmquQajhLbEv0OdJvJrnEMSDKRT670TlULo7PBie/DlONPMcRoH2hv3gcN1+3u/+ihlxINB0b0QZMZ13SVs4Bu/AwvBeooyJEtLV7uH934bufCNSk/qBCDhErcBOz5eE7VlM656FXZH/rbK2VaYN7N5WGfQX93uj3kZQQhex2DLBU8NUUE6WGXrHbZCjNNjKUcQ2C8N4jqyDj/erp9+Yc+eXxjERF4RLaIqPjbf0JcxDg7UjMthkDiu1QrDu8CFQgbS+5a/Dzs5WF0iKNZ0WmJo3MTyvwbCHQFR9vwNFqrS5lmpuu6QiQRJeCsCOTIPzUrvkn3H5WjwWhtkg8NAiMT0+UGNW/s1JByaWMEGXedXNOQolq1RlvglLilFB+RY8ubBjndA7VcL005P/QZn+Ud80Z6AGAF4pT9+iWEXMzU/TknfpTkNdUEXR95v3wkEZCOvn8J56zyjoOhwDiaSG2ganNeUlQM6JMpZDbebJqCqyD/bottk2AGCa0xXpVvPbFpzKqGc4d
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(5660300002)(38100700002)(186003)(2616005)(316002)(6666004)(508600001)(110136005)(6512007)(6506007)(53546011)(966005)(44832011)(8676002)(83380400001)(66476007)(66946007)(66556008)(86362001)(31686004)(2906002)(36756003)(31696002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STZMWGppYkZKT2pmUXdVMklUcGZJclU0TlN3dFE4ZXFnbmx6QVhmUCtPQkxi?=
 =?utf-8?B?RTFvZ2ZmVSt1cU84VGtwYk8yK0s4ZXJ5UkFXRjRuemhXQUJteEFmaWdBd1Jt?=
 =?utf-8?B?VkNCaUUvZkRCTDhzYXJYZ2hzNkNDZEVuU2FOMHdERVlCdEdFajNpUno5U0s4?=
 =?utf-8?B?TTMwTnB1bi9xYlNTemZaRHl4Mk5DU21KMDRTa0U5SFpza1A2bURmMzRwZUMr?=
 =?utf-8?B?TGgwemdzdmxTSDNjNkJhbUNrK2U0cHJwcU5mVElDenlqR01DN0orSWI3YTVO?=
 =?utf-8?B?QlhqdmFBbWlvZGNqQ3hGM3puK2NyZzR5QlY1K0lMelFxamltYUZIeXYvd0NT?=
 =?utf-8?B?eVQwSTErNnBoRlVObG4yK0U3aDNBWStxMitjS0dKNFhBa3IvWlV0QUJFZCtD?=
 =?utf-8?B?N3dSVFE1TkF6bWcrZU13T0o0aHBYNE9Jelh5ZUhOajJiYW5vREdGeEZjcjFa?=
 =?utf-8?B?STVsY2JvTUVuYUVwMGtyMTdaTjFBdFZuOHNvYnJZODUzMW9JejNYSWoxeHBB?=
 =?utf-8?B?QUVRQjVtdXhDRFNpeFU5TkV1ckhOMWdqRHprcGNBaVZ2TEk4ZFhESlpJeW9j?=
 =?utf-8?B?WXJTS0oycGVHbGh3MXVkajZmaW9XVGk3SnI1bzBrMk5GNm85OWVkeWhNeExK?=
 =?utf-8?B?WThKb2FCanRlV3ZoZVRMamZtckZ0TGdPRW43b1RoQ251dW01VFVmaEN0czAw?=
 =?utf-8?B?M1J0bnNWWFZKWjljb2s4TnJxWVVaL3FSczVjWnNmSXhRbnByeitNSVVyNk96?=
 =?utf-8?B?aUJTZlphNFROb3ZKRU55NkswejFUNE5CUHlYRCs2UExPZlNWWnlnRkdabmZC?=
 =?utf-8?B?WUYvUWNhNVBGclJudmNkanR6cU81MmcvdEZHUkpQYWFsRUNvRnBNVllHeWVa?=
 =?utf-8?B?d2NZSGpCRmVmLzR5dExLNVlYZ1VuU0djTEN5UlNtMVNKanlpak40dzNlSEhU?=
 =?utf-8?B?dG5lZjdzSm1KWVpjMnM0UDNzcnViQXdrOE9SWC9tRnRlZnlzK2swWHhEYkFQ?=
 =?utf-8?B?MzFnOElQWWhQN3VIRW5vRGFyOTdiOUxqYTUrb1Y1NktzaWpIR3dwaTJhbnRN?=
 =?utf-8?B?Q1hvbFc4TXVkSmdXZERjUW1MQ3p4ci9YdHAxSzR6OWhwOWJMR0c3QklxdHgy?=
 =?utf-8?B?MWpEK0NDQzNaVXJaTDFFcXF6U2RKdGxBV1ppQmdVNzliWXJKeFo1d2ZiVjV3?=
 =?utf-8?B?R0xNOElSVG9IMUdWRHVOMmQ2VDNBZ2JrSlFqNnZxZUNmYlI4TlNDK3ZKUXpK?=
 =?utf-8?B?eVIwZUVQbDBEOUlCL2hTRUxhb1NnZElKeURRZk5NV1Z1OXk4UDZMSDQ1QXdN?=
 =?utf-8?B?ejgvbGk1c3haNEdLYmI3TkNRVXF0ZTUwVGVuOENNUit2c0Z1OHZiWWVrc1BV?=
 =?utf-8?B?UDlCejgzbmhiUnhwQWFSdFJBdG1TWVB0em15RlNwYlNMSmZUdVp1N1F1bjlq?=
 =?utf-8?B?QUk5bkJUR2JCcjgvM3NuU3kyUUN5aktvcER5YU5zNXR6Y2xjdnc0N3VFYXV2?=
 =?utf-8?B?S0p5OTZsTElBcWVuMU02YjdGTnlaQjROYnROOUV5WEtobCtIL3pGY3ZtU091?=
 =?utf-8?B?U3dld1ZmTTdoeUthRjcwNGtXRFVGL1JmSG5qbE05WXcyOXo4SmdPSnJZTHZp?=
 =?utf-8?B?UXdRanFlZ0V6cnd2bmIxclU5a3JqMEYzOWd3WWxveWdDbXJveW4rNUdrNHAr?=
 =?utf-8?B?b2E0Z3hxNEhOSzN2RXZpTFNtUHZwZ05mSm93dkRWNHljQ1NkTUdua250Z3VW?=
 =?utf-8?B?ZDhDczdYUHV5Vk16Y0d4Ykt3d01SVHBDTU5KVUpCcjRvdEQ3SnVoMGVobnlI?=
 =?utf-8?B?MDdFdExxQU1MZ2MxSzhSVFdpcnVzRjBGVmREVFQ2dzh2dVEvM0VkTC9hUHp2?=
 =?utf-8?B?TWRndEhDZmtpdlA3aTdZL0o2MjBINmZ2Znh5akxkT0crTVRacHhnUURCcGhY?=
 =?utf-8?B?eDF6NUVubnc5bUpCYjhtNGxoUkVnY3hjWlZKOWlQTHZjWVh5YVgyalcyTzJR?=
 =?utf-8?B?MW9jb2RITUdLTmxScUFwSVZzOXE2NFo5MUo2QlBML25HcDFjeEdNM2VxTlhK?=
 =?utf-8?B?OUdDbXI2aVowVGpSVCtEUXhZdnljNnJNd3BjZz09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9a847a23-e5b1-4c71-fd59-08da08d0b440
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 11:16:09.8598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U7rKwpIbvzB5EF2VlxohCblKHyXcnRyUxA16jMF3nx/ySLqBPoiBt5pw5k+AgGeTCU71LhS4u4Fxiu4X7VkMS1mz8JIYk2j/ZJBXq6OgTtjWn8M3hCnBEj1Bzt+/nhIm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3799
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 11:16:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2624

On 3/18/22 11:05, Michael Opdenacker via lists.yoctoproject.org wrote:
> Greetings,
> 
> On 3/18/22 07:47, Quentin Schulz wrote:
>> Hi all,
>>
>> On March 18, 2022 1:04:32 AM GMT+01:00, Michael Halstead <mhalstead@linuxfoundation.org> wrote:
>>> Hello,
>>> In the past we've correctly bumped the versions in the yocto-docs release
>>> branches before the release build and I only need to update the master
>>> branch to update the switcher on the website. This doesn't happen reliably
>>> though and we've been having to patch the build system to make the docs
>>> build correctly.
>>>
>>> Ideally all that would be needed at release time is a patch like
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__git.yoctoproject.org_yocto-2Ddocs_commit_-3Fid-3D78545b8f42657c21bc3cac96429d3950b07a3aca&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=cTlw8ZyDgLCzGzd6TrnLJ9k1dlLUKczlSySrRTH_ur9xCYJt7xfrVe11YI4lEcXy&s=DXdHKanD7Qz-e9W7u3ZpHzJwt1R4FvqpmXp2_rbthiw&e=
>>> to update the website.
>>> >> For the new releases (not the dot releases), it is essential this 
patch is merged with correct infos before tagging, specifically the 
poky.yaml file.
>>
>> For dot releases, what matters is the bump of the dot release in poky.yaml, the rest of the changes aren't that important because it's impossible to always keep it up-to-date.
>>
>> releases.rst and switchers.js are taken from master for all builds anyways by yocto-autobuilder-help so we don't technically have to worry about those making it before tagging day. Those need to make it to the master branch as soon as possible though (basically after tagging).
>>
>> Two changes to conf.py need to be done too for releases. current_version needs to be bumped and bitbake_version to be set.
> 
> 
> Some of the mess is probably my fault. I didn't want to update *master*
> to refer to releases that didn't exist yet, because this causes warnings
> on the documentation website. However, I realize there should be no
> issue updating the release branches (such as
> https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_dunfell_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=cTlw8ZyDgLCzGzd6TrnLJ9k1dlLUKczlSySrRTH_ur9xCYJt7xfrVe11YI4lEcXy&s=fkjdSlAymDOkLJTh9p3Ga6YaRm4Rqd6-QxTDE61UbUs&e= , which I believe are not
> advertised on https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=cTlw8ZyDgLCzGzd6TrnLJ9k1dlLUKczlSySrRTH_ur9xCYJt7xfrVe11YI4lEcXy&s=ehS2rLKxADXnphei-i1w9MfnDpE6s_eabXSGdHf3IRU&e= ), so I was wrong to apply
> the changes only after the release was out.
> 

Branches are forgiving because they are moving and we always take the 
latest commit in those branches. So nothing to say about those because 
it IS possible to fix them when we encounter an issue or if there was an 
oversight.

We cannot (policy-wise) move a tag so we need some process to make sure 
it's properly done to avoid having too many patches in the 
yocto-autobuilder-helper (especially since most of the patches are 
identical).

> My apologies!
> 

Can't blame the people if there's no documented process :)

> Let me try to understand if I understand the desired workflow correctly:
> 
>    * Prior (weeks before) to a future new release, create a new release
>      branch on "yocto-docs", e.g. "kirkstone"
I think weeks before is too early to branch off. I think this should be 
done on release day. The issue of branching off too soon is that you 
need to apply patches to both master and kirkstone branches.

>    * Update documentation/conf.py (version specific) and
>      documentation/poky.yaml in the release branch (e.g. "dunfell")
>      according to the upcoming release (e.g. "3.1.15")
>    * Before making the release, check in the content of conf.py that
>      current_version is NOT dev and that bitbake_version is set. If
>      current_version is set, extract it and make sure it's used in
>      poky.yaml too. Also check that the YOCTO_DOC_VERSION_MINUS_ONE
>      setting in poky.yaml corresponds to the number of the latest n-1
>      release.
>    * Make the release. I guess, when we have a new release, this means
>      that a new branch for BitBake was created.

Bitbake should have a new release branch before yocto-docs is 
tagged/updated, yes. So that objects.inv from bitbake release docs can 
be used.

>    * Make sure
>      https://urldefense.proofpoint.com/v2/url?u=https-3A__git.yoctoproject.org_yocto-2Dautobuilder-2Dhelper_tree_scripts_run-2Ddocs-2Dbuild&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=cTlw8ZyDgLCzGzd6TrnLJ9k1dlLUKczlSySrRTH_ur9xCYJt7xfrVe11YI4lEcXy&s=BDfclI2ORIfQDqFY9Cdc_eYIcWJ9qzUukRH1i7ZT6o4&e=
>      supports the new BitBake branch.

Yes, though IIRC I've something in some git stash to avoid having to 
maintain this list. Please ping me until I've sent a patch related to this.

>    * Add new tags to the branch (e.g. "yocto-3.1.15" + "dunfell-3.1.15").
>      Isn't the "yocto-" tag sufficient by the way? >    * Update the following files in master:
>        o documentation/conf.py

No. conf.py in master stays with current_version="dev" and 
bitbake_version="" otherwise it's incorrectly advertised and using an 
outdated version of bitbake docs.

>        o documentation/poky.yaml
>        o documentation/releases.rst
>        o documentation/sphinx-static/switchers.js
> 
> Would this be a correct workflow? I propose to keep this in a wiki page
> by the way, so that updates and notes are easy to manage.
> 

I would actually update poky.yaml in master branch before branching off 
kirkstone because poky.yaml from master is technically using latest 
release information (not necessarily dot release though), otherwise you 
would have the patch in both master and kirkstone. Not a big difference 
though. Just need to agree on the process.

Yes to a Wiki page. We need to document the issues we are having, what 
are the requirements and the suggested solutions. There's nothing 
straightforward to implement I'm afraid, but we need to improve this to 
make it easier on maintainers and lower the risk of human 
error/oversight happening somewhere.

Cheers,
Quentin

