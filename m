Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C7EEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:16:08 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.50])
 by mx.groups.io with SMTP id smtpd.web10.15845.1687450563040216303
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 09:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=PXA5LzeX;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.50, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7im+09p3S2U+ffl0+iWUrmt27uFTn1rW7DvVBdRq9Evl1JICj6OSXvAo+2VHpGbMBE6SnLQ433UqJSjhIjBwTioynHz2/bcecKRBeyrQ/VnBZK+0+RLpVvcTjA9X/2n7ecBUZ7TTuQYM7GwotfxVITEawGn1+GRTQ2HRvRSs0QwVgmZJqE0HO5GsXiToVQKPcYhxYAO1XoetBV0UGD42RxAZO6cbxs9u2wsln8pgZ8kRUJjoLOKJn4M6LYzRB1sRVXEHB9tvOS0ril2cHi8NNdnfTOlhpV2sLtR0g3Uo4rF2XiWpzGXcE8PAItX9w/bDh8Hcs5U9lYLWYqzPlUMeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKBKd6QB5ooy/BUbns7erDJkEqxG9FGA7Jdno+PGz7Q=;
 b=iEfgbU4wkrE4vO+dsTgc8bWKdkDlqCuipgP6r9iAt4dhusIy5fDi56f7+l5bVdVuB7HG6qJ94HhV4xHAHIlXPDJJCVVba6KJKjc3+/1d1+Vu4YEHSWfTJr33msqx/eobkzJ7mxiNm+CAx1gLbSpLLm7ipHEszmRD+qSziIByKjBRPnKmyWo4rDdvGEDsTD/+lGGcaiMfFoiLdpCDaal7+lT3WDuvAdo799NmTk/wscojhjuOxzIZv0pTgSpge1MJHP3PBcEMdbbZdtOH2n8oXaKBOeZcGtssY52cZNWa3tw+pW39N+Qbem/eGa+tih5NSkiSK8ONn/BAqSttB6LlFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKBKd6QB5ooy/BUbns7erDJkEqxG9FGA7Jdno+PGz7Q=;
 b=PXA5LzeXZBKMX+j/2M73MSrFpv1b/Va8KZ/D562GbB7Ax5hw8utZnoBqE2lVmYtvBvB27hdVq7IxPO0AwC6R6P4vgaWGMG9FsZe/spsJ9HDFlFz4TWvmCegct2hKv33cnbbfYxTqK5qnjOGjduUi4zoOPIuKbHnqJv4caShzqm0gTEc7h7fseXCQ0tatAomvqSYGDT3jsMwa+GcCA1P/wiUEbZupTgFjFLK2/Uae69NGmEVXFFvtw17haWE2KEkhcju7W6Nsjc0pH3wFhHx0ggND2LFzXBzwgBYpPerQKw5sFjLs6qCR4NULfdbZ/W7a+cadqaJSq4/vFvfJcXkJ9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM8PR04MB7283.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 16:15:58 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::f868:358b:fd4d:31bb]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::f868:358b:fd4d:31bb%3]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 16:15:58 +0000
Message-ID: <5f1d69bc-496b-1a43-3b02-f73fa9ee3b38@theobroma-systems.com>
Date: Thu, 22 Jun 2023 18:15:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [docs] [RFC PATCH] WIP LICENSE_FLAGS_DETAILS documentation
Content-Language: en-US
To: michael.opdenacker@bootlin.com, Ross Burton <ross.burton@arm.com>
CC: nd@arm.com, docs@lists.yoctoproject.org
References: <20230524163201.3630288-1-ross.burton@arm.com>
 <02d5ac9b-c4eb-0d60-d812-4128501d5473@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <02d5ac9b-c4eb-0d60-d812-4128501d5473@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::7) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM8PR04MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 66cf5b33-b57a-4dff-a18d-08db733bf66f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eBR1oXnMuo16A1I8PkrKU94341e2297ugQ3gLoO6ehMFmxdg6ESIiJQD/0s6u8bXF/3iOiWS+xnBPCO7gWpUM6eeMjmIKg2Y50RQIyvOax/7ghmEZ3gqorD4Zms49XkxrxIdtorJGcyimumsTDqx6nIuyfHpLryjcbo6W1GZT04c6zLTVVmAQVTyeR+aXzpQD7M0FaZgTjzDt0Epf0Gx+YuX+qIy1N1jD8Ik+q4jOrb/wIjp9l5ByucFcayPMyZw5hd2HQZWWYQ+1PHkycsUzinZWWBxEKm1H3ZEO2gjLD1APb7f81+2DS2aXmUnaZ6msaOIaoCngYcgsa9jmbGYvfWaCPcmMU/hvBlHYjwOxymILv1S+0hLDHAo+/NJ7P4rNTfR4xfKEoRE7xffrfu1HLWNIzIq8upEcnU/0wAfAt/x3t4YM3TGHQU8yHWHudX2p9HqyhW0PVhNCCYo5ptFSkHACiNvyfPCLlGivENjxavCsBC1FbBK78C5RYoDOrsXO2xKrusSf0wy5CWs3+KCID3ZYce8u8ZeCuptwca3gH56qS4cupTVYOO6bW/tfvHnH6QUXqWOIjQGglLX9x+7fWfbVbYpkVZ0UOP/V56DnvNafLRws7P+QvzeZfJNK60r162o3BRIB7Ln1b3/28JY+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(376002)(396003)(39850400004)(451199021)(8936002)(41300700001)(8676002)(186003)(6506007)(2906002)(6512007)(53546011)(6916009)(66556008)(316002)(4326008)(86362001)(66476007)(66946007)(31696002)(6486002)(6666004)(2616005)(45080400002)(38100700002)(478600001)(83380400001)(36756003)(966005)(44832011)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MNDQy/E0a1m00Z9OZ08OEoSjhHbo8SfBYbIsWaJ56iZtCY7ieGZq5Fi25X0P?=
 =?us-ascii?Q?Mw18zWZNdMdUcss6ikrtfF/YWLgKJ/DCqgk1/av60JuIqGhMy6Rw5isVHUQl?=
 =?us-ascii?Q?mKFvPzdbR/Ryg4DgPpjM3gsDaNQxDMdTNRUorEQ80sgKAruNnX7Mk4en6HPm?=
 =?us-ascii?Q?L77BRm9tKva+T79pNH791EVb7riTkgNNLGkmWurFGAs/2nThfsIMJdg3i42M?=
 =?us-ascii?Q?Ixld8uYcvhxWp5gw7BmWBw+iV9mgFVBb0oEv4jdb6s+odR5PVGIUObv71Mmo?=
 =?us-ascii?Q?x2yPXZCe8RYAmxo6vUh48P+lwvKsNnxVcvqX8/3JA/Xmsvdpc+R+u9bW8Rj8?=
 =?us-ascii?Q?xAM/SJJvdLOATc2OaOBEK3uJ1ra+NbVLQ7SMvUxgsapuPeVOZd3gMBnL8vWx?=
 =?us-ascii?Q?qXzlEbn63AAgnSjA79J58TxwssXi9g5DOMIcLNpnStjl+Tu0vAM4rrMKI/Hq?=
 =?us-ascii?Q?4rHVaYKl1tdDcfY5x3cMgLZtRdxGKDkyIB031h05Kw4pGD7CP+u8cu0i/BUb?=
 =?us-ascii?Q?nYib3+V0gHg7wO4jnK1vML2HEBGbm+9NNaoHSZSI2O/m53zLHUVkiuI6nJGW?=
 =?us-ascii?Q?Ri4PZez/VTT8w1ZleGau31zulDgrnL3PZa/VVy2QQRz8XVYYIwtnC5+Wq6ys?=
 =?us-ascii?Q?CKqYF/XeP/kudf880OHwySlsWQf1U6BIa6BcTEblLIdC8Yeo/vKHRbh7EOoa?=
 =?us-ascii?Q?tv/c7DL2lxdBPa0yxFnb8qUBXJBq/j3whq7e1GTYfXqTuYIIhxIgppYAYIC1?=
 =?us-ascii?Q?WR6XFJ2JYk+BGg3Min10OPkuOMXlNQ+1+1YI7b+l89d6ytbMG4Z2Icqskkje?=
 =?us-ascii?Q?QvL7x9cMBXnaeu8YM2t0yZScsuvbJBLLqgBw9OfRW6hAcKclqs/diOF7ujX3?=
 =?us-ascii?Q?p14YZ3jp2sTA80Ae05O5HMD2Vjlgkct9YnOZmUq4ZLzfE8kKVlgkWt/jmHUd?=
 =?us-ascii?Q?6qB0VV67iqlRha4HWHLBRmxWMRefueho06DfOrdO1txAtz1vqCRBptJMRDIE?=
 =?us-ascii?Q?6flv8IV6/x/RryAXco5lbteIDHEVK/bQMKOyf/iKywRRL3GKfV19/59iwK6a?=
 =?us-ascii?Q?rTlO8Upvwf7dPdrJdm+yYYPtNik7JvUP0KJwS9v7EUW5yKI8eVEJmAd+02qV?=
 =?us-ascii?Q?ry4O/oC2mzuM+iy40UOL3WWndljF6Kq6zFZoyjRniV85+EBIeGDlWbNYbWBE?=
 =?us-ascii?Q?Zl04EzpCTql2CDAe6RSTbYJqbuN+KvuvvU67QVRCCvDwwd4iVt6iVpD6hLD8?=
 =?us-ascii?Q?gqclxOk8KuDE7W7RiR/On5xnZVCq1QLgmRX4Y6ppezTIiPtx/atC6w62Rhqo?=
 =?us-ascii?Q?j6rniQ47IM730hXsrFLl/BychEj6VXBOV4YTGS+PRipwAq3twA8BrK5STly/?=
 =?us-ascii?Q?18ONBJL90Ktx4ucpxOtVByAfBnR3kWFkUsgIwWH7hjytMlj8Z8NRZgZyWJHR?=
 =?us-ascii?Q?gf8XxvDbyCxA9vkN0ipyUR4kVB2McqKGcy8yu86aR6cnPaboXQBeWGq5hfKo?=
 =?us-ascii?Q?HFxlj55dTEnVZAtyTdyiiyrus6B0WXR90gpHtLYhqfXWJWM8m0Dt3NpiIJOK?=
 =?us-ascii?Q?Nk9qiSXIUb7IKWDVJT4pYzANkGGwA0/h38Gw/54t6jfbvADc1u3tpzDzaYlV?=
 =?us-ascii?Q?VmmnhFE19fPMKbnNB+1cY8w3FDChrTflLs3mixAkQh7YR+XFcAICkZhsrXR1?=
 =?us-ascii?Q?pPUcrQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cf5b33-b57a-4dff-a18d-08db733bf66f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 16:15:57.9748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYZpmg+b93kQ2s5X0K2Hnno2yT/i9iz0ZBUFVWTDWui0b5YxzyxarRRWAjwJnk+jRswdCdkkPa/q2zXfzq6Zt4gjbIxhG72NvrT3qazHFeOORQX28GuB4yxPxe8ZrSMm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7283
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 16:16:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4025

Hi Michael,

On 5/26/23 11:18, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Ross,
>=20
> On 24.05.23 at 18:32, Ross Burton wrote:
>> From: Ross Burton <ross.burton@arm.com>
>>
>> ---
>> =C2=A0 documentation/dev-manual/licenses.rst | 7 +++++++
>> =C2=A0 1 file changed, 7 insertions(+)
>>
>> diff --git a/documentation/dev-manual/licenses.rst=20
>> b/documentation/dev-manual/licenses.rst
>> index 9629dc53293..805b40fd482 100644
>> --- a/documentation/dev-manual/licenses.rst
>> +++ b/documentation/dev-manual/licenses.rst
>> @@ -123,6 +123,13 @@ name and version (after variable expansion)::
>> =C2=A0=C2=A0=C2=A0=C2=A0 LICENSE_FLAGS =3D "license_${PN}_${PV}"
>> +It is possible to specify where to find more details for a specific=20
>> license
>> +using flags on the :term:`LICENSE_FLAGS_DETAILS` variable:
>> +
>> +=C2=A0 LICENSE_FLAGS_DETAILS[my-eula-license] =3D=20
>> "https://example.com/eula"
>> +
>> +If set, this will be displayed to the user if the license hasn't been=20
>> accepted.
>> +
>> =C2=A0 In order for a component restricted by a
>> =C2=A0 :term:`LICENSE_FLAGS` definition to be enabled and included in an=
=20
>> image, it
>> =C2=A0 needs to have a matching entry in the global
>=20
>=20
> Thank you for starting this.
> I'll get back to it when support for LICENSE_FLAGS_DETAILS is merged.
>=20

I believe it's merged now? c.f.=20
https://git.openembedded.org/openembedded-core/commit/?id=3Dcb5cdcaf3310e88=
9e80861ccfaf46c1bce624ac1

Maybe we would also benefit from an entry in the variable glossary for=20
this one?

Cheers,
Quentin

